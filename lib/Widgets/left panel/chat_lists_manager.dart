import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/State managment/ui_events.dart';
import 'package:myapp/StateWithStreamsSubscriptions.dart';
import 'package:myapp/Widgets/left%20panel/chat_list.dart';
import 'package:myapp/Widgets/revertible_page.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:myapp/utils.dart';
import 'package:collection/collection.dart';

class ChatListsManager extends StatefulWidget {
  const ChatListsManager({
    Key? key,
    required this.client,
  }) : super(key: key);
  final TelegramClient client;
  @override
  State<StatefulWidget> createState() => ChatListsManagerState();
}

class ChatListsManagerState
    extends StateWithStreamsSubscriptions<ChatListsManager> {
  //static final List<ChatOrder> _chats = [];
  static List<ChatList> _lists = [];
  static final Map<int, ScrollController> _scrollContollers = {};
  static final Map<int, double> _scrollPositions = {};
  static int _currentPage = 0;

  void setChatLists(List<ChatList> lists) => setState(() => _lists = lists);

  bool _setsScrollPositionAfterSwitch = true;

  void setCurrentChatList(ChatList list) {
    if (_scrollContollers[_currentPage]!.hasClients) {
      _scrollPositions[_currentPage] = _scrollContollers[_currentPage]!.offset;
      _setsScrollPositionAfterSwitch = false;
    }
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
      _scrollPositions[lastPage] = 0;
      _scrollContollers[lastPage]?.animateTo(
        0,
        duration: Duration(milliseconds: 400),
        curve: Curves.decelerate,
      );
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

  void _updateChats() {
    widget.client.send(LoadChats(chatList: ChatListMain(), limit: 25));
    widget.client.send(LoadChats(chatList: ChatListArchive(), limit: 25));
  }

  @override
  void initState() {
    _updateChats();
    streamSubscriptions.add(UIEvents.currentChatList()
        .listen((event) => setCurrentChatList(event)));
    streamSubscriptions
        .add(UIEvents.chatLists().listen((event) => setChatLists(event)));
    streamSubscriptions.add(UIEvents.archiveState()
        .listen((opened) => _switchLists(opened ? 1 : 0)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (_scrollPositions[_currentPage] != null &&
          !_setsScrollPositionAfterSwitch &&
          _scrollContollers[_currentPage]!.hasClients) {
        _setsScrollPositionAfterSwitch = true;
        _scrollContollers[_currentPage]!.jumpTo(
          _scrollPositions[_currentPage]!,
        );
      }
    });
    return PageView(
      controller: mainArchiveContoller,
      reverse: true,
      children: [
        PageView.builder(
          controller: mainContoller,
          itemCount: _lists.length,
          onPageChanged: (p) {
            setCurrentChatList(_lists[p]);
            UIEvents.selectChatList(_lists[p]);
          },
          itemBuilder: (context, index) {
            if (_scrollContollers[index] == null) {
              _scrollContollers[index] = ScrollController();
            }
            return StreamBuilder(
              initialData: const <ChatOrder>[],
              stream: widget.client.chatsInChatList(_lists[index]),
              builder: (_, data) => ChatListDisplay(
                scrollController: _scrollContollers[index],
                chatsPositions: data.data as List<ChatOrder>,
                client: widget.client,
                addArchive: _lists[index] is ChatListMain,
              ),
            );
          },
        ),
        RevertiblePage(
          onRevert: () => UIEvents.closeArchive(),
          title: widget.client.getTranslation("lng_archived_name"),
          content: StreamBuilder(
            initialData: const <ChatOrder>[],
            stream: widget.client.chatsInChatList(ChatListArchive()),
            builder: (_, data) {
              var archChats = data.data as List<ChatOrder>;
              return Expanded(
                child: ChatListDisplay(
                  chatsPositions: archChats,
                  client: widget.client,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
