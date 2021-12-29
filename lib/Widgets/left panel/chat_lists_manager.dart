import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Chat/chat_display.dart';
import 'package:myapp/Widgets/chatFilters/chat_filter_horizontal.dart';
import 'package:myapp/Widgets/horizontal_separator_line.dart';
import 'package:myapp/Widgets/left%20panel/chat_list.dart';
import 'package:myapp/Widgets/revertible_page.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:collection/collection.dart';
import 'package:myapp/utils.dart';

class ChatListsManager extends StatefulWidget {
  const ChatListsManager(
      {Key? key, required this.client, required this.chatDisplayPointer})
      : super(key: key);
  final TelegramClient client;
  final GlobalKey<ChatDisplayState> chatDisplayPointer;
  @override
  State<StatefulWidget> createState() => ChatListsManagerState();
}

class ChatListsManagerState extends State<ChatListsManager> {
  static List<Chat> _chats = [];
  static List<ChatList> _lists = [];
  static int _currentPage = 0;

  void _listenChatPosition() async {
    await for (final event in widget.client.updateChatPosition) {
      if (!mounted) break;
      Chat? chat =
          _chats.firstWhereOrNull((element) => element.id == event.chatId);
      if (chat == null) {
        _chats.add(
          widget.client.getChat(event.chatId!),
        );
      } else {
        for (int i = 0; i < chat.positions!.length; i++) {
          if (compareChatlists(
              chat.positions![i].list!, event.position!.list!)) {
            chat.positions![i] = event.position!;
            break;
          }
        }
      }
      setState(() {});
    }
  }

  void setChatLists(List<ChatList> lists) {
    lists.forEach((e) => _displayLists[e] = GlobalKey<ChatListDisplayState>());
    _lists = lists;
  }

  void setCurrentChatList(ChatList list) {
    var lastPage = _currentPage;
    if (list is ChatListMain) {
      _changeCurrentPage(0);
      _currentPage = 0;
    } else {
      var index = _lists.indexOf(_lists.firstWhere((element) {
        if (element is ChatListFilter) {
          return element.chatFilterId == (list as ChatListFilter).chatFilterId;
        }
        return false;
      }));
      _currentPage = index;
      _changeCurrentPage(index);
    }

    if (lastPage == _currentPage) {
      _displayLists[_lists[_currentPage]]!.currentState?.jumpToStart();
    }
  }

  void _switchLists(int index) {
    mainArchiveContoller.animateToPage(index,
        duration: const Duration(milliseconds: 400), curve: Curves.decelerate);
  }

  void _changeCurrentPage(int index) {
    mainContoller.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  PageController mainContoller = PageController();
  PageController mainArchiveContoller = PageController();
  List<StreamSubscription> _subscriptions = [];

  void _updateChats() {
    widget.client.send(LoadChats(chatList: ChatListMain(), limit: 25));
    widget.client.send(LoadChats(chatList: ChatListArchive(), limit: 25));
  }

  @override
  void initState() {
    _updateChats();
    _listenChatPosition();
    _subscriptions
        .add(widget.client.updateChatLastMessage.listen((event) async {
      Chat? chat =
          _chats.firstWhereOrNull((element) => element.id == event.chatId);
      if (chat != null) {
        chat.positions = event.positions!;
        chat.lastMessage = event.lastMessage;
        setState(() {});
      }
    }));

    _subscriptions.add(widget.client.updateChatDraftMessage.listen((event) {
      Chat? chat =
          _chats.firstWhereOrNull((element) => element.id == event.chatId);
      if (chat != null) {
        chat.draftMessage = event.draftMessage;
        chat.positions = event.positions;
        setState(() {});
      }
    }));
    super.initState();
  }

  @override
  void dispose() {
    _subscriptions.forEach((element) {
      element.cancel();
    });
    super.dispose();
  }

  void _chatClickHandler(int id) async {
    if (_selectedChatId != null) {
      widget.client.send(CloseChat(chatId: _selectedChatId));
    }
    setState(() => _selectedChatId = id);
    widget.client.send(OpenChat(chatId: id));
    widget.chatDisplayPointer.currentState
        ?.changeChat((await widget.client.send(GetChat(chatId: id))) as Chat);
  }

  int? _selectedChatId;

  bool _init = false;

  static Map<ChatList, GlobalKey<ChatListDisplayState>> _displayLists = {};

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (!_init) {
        if (_currentPage != 0) mainContoller.jumpToPage(_currentPage);
        _init = true;
      }
    });

    return PageView.builder(
        reverse: true,
        controller: mainArchiveContoller,
        itemCount: 2,
        itemBuilder: (_, i) {
          if (i == 0) {
            return PageView.builder(
                controller: mainContoller,
                itemCount: _lists.length,
                itemBuilder: (context, index) => ChatListDisplay(
                    selectedChatId: _selectedChatId,
                    onArchiveClick: () => _switchLists(1),
                    onChatClick: _chatClickHandler,
                    client: widget.client,
                    chatList: _lists[index]));
          }

          return RevertiblePage(
            onRevert: () => _switchLists(0),
            title: widget.client.getTranslation("lng_archived_name"),
            content: Expanded(
                child: ChatListDisplay(
                    selectedChatId: _selectedChatId,
                    client: widget.client,
                    chatList: ChatListArchive(),
                    onChatClick: _chatClickHandler)),
          );
        });
  }
}

class UsersJoinedGroupInfo {
  UsersJoinedGroupInfo(
      {required this.addedUsers, required this.langKey, required this.isJoin});

  ///users, what was added to chat. Non-null if lastMessage.content is MessageChatAddMembers
  List<User> addedUsers;

  bool isJoin;

  String langKey;
}
