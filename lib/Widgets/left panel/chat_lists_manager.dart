import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/StateManagment/ui_events.dart';
import 'package:myapp/Widgets/left%20panel/chat_list.dart';
import 'package:myapp/Widgets/revertible_page.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:myapp/utils.dart';
import 'package:collection/collection.dart';

class ChatListsManager extends StatefulWidget {
  const ChatListsManager({Key? key, required this.client}) : super(key: key);
  final TelegramClient client;
  @override
  State<StatefulWidget> createState() => ChatListsManagerState();
}

class ChatListsManagerState extends State<ChatListsManager> {
  static List<ChatOrder> _chats = [];
  static List<ChatList> _lists = [];
  static Map<int, ScrollController> _scrollContollers = {};
  static int _currentPage = 0;

  void _listenChatPosition() async {
    await for (final event in widget.client.updateChatPosition) {
      if (!mounted) break;
      setState(() {
        var chat = _chats
            .firstWhereOrNull((element) => element.chatId == event.chatId);
        if (chat == null) {
          chat = ChatOrder(event.chatId!, [event.position!]);
        } else {
          for (int i = 0; i < chat.positions.length; i++) {
            if (compareChatlists(
                chat.positions[i].list!, event.position!.list!)) {
              chat.positions[i] = event.position!;
              break;
            }
          }
        }
      });
    }
  }

  void setChatLists(List<ChatList> lists) => setState(() => _lists = lists);

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
      _scrollContollers[lastPage]?.jumpTo(0);
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
  final List<StreamSubscription> _subscriptions = [];

  void _updateChats() {
    widget.client.send(LoadChats(chatList: ChatListMain(), limit: 25));
    widget.client.send(LoadChats(chatList: ChatListArchive(), limit: 25));
  }

  @override
  void initState() {
    _updateChats();
    _listenChatPosition();
    _subscriptions
        .add(widget.client.updateChatLastMessage.listen((event) => setState(() {
              var chat = _chats.firstWhereOrNull(
                  (element) => element.chatId == event.chatId);
              if (chat == null) {
                _chats.add(ChatOrder(event.chatId!, event.positions!));
              } else {
                chat.positions = event.positions!;
              }
            })));
    _subscriptions.add(widget.client.updateChatDraftMessage.listen((event) =>
        setState(() => _chats
            .firstWhere((element) => element.chatId == event.chatId)
            .positions = event.positions!)));
    _subscriptions.add(UIEvents.currentChatList()
        .listen((event) => setCurrentChatList(event)));
    _subscriptions
        .add(UIEvents.chatLists().listen((event) => setChatLists(event)));
    _subscriptions.add(UIEvents.archiveState()
        .listen((opened) => _switchLists(opened ? 1 : 0)));
    super.initState();
  }

  @override
  void dispose() {
    _subscriptions.forEach((element) {
      element.cancel();
    });
    super.dispose();
  }

  bool _init = false;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (!_init) {
        if (_currentPage != 0) mainContoller.jumpToPage(_currentPage);
        _init = true;
      }
    });

    return PageView.builder(
        controller: mainArchiveContoller,
        reverse: true,
        itemCount: 2,
        itemBuilder: (_, i) {
          if (i == 0) {
            return PageView.builder(
                controller: mainContoller,
                itemCount: _lists.length,
                itemBuilder: (context, index) {
                  if (_scrollContollers[index] == null) {
                    _scrollContollers[index] = ScrollController();
                  }
                  return ChatListDisplay(
                      scrollController: _scrollContollers[index],
                      chatsPositions: _chats,
                      client: widget.client,
                      chatList: _lists[index]);
                });
          }

          return RevertiblePage(
            onRevert: () => UIEvents.closeArchive(),
            title: widget.client.getTranslation("lng_archived_name"),
            content: Expanded(
                child: ChatListDisplay(
                    chatsPositions: _chats,
                    client: widget.client,
                    chatList: ChatListArchive())),
          );
        });
  }
}

class ChatOrder {
  ChatOrder(this.chatId, this.positions);
  int chatId;
  List<ChatPosition> positions;
}
