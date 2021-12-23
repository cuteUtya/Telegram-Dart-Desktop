import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/Widgets/chat_item_display_archive_not_hidden.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_display_chat.dart';
import 'package:myapp/Widgets/left%20panel/chat_lists_manager.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:collection/collection.dart';
import 'package:myapp/utils.dart';

class ChatListDisplay extends StatefulWidget {
  const ChatListDisplay(
      {Key? key,
      required this.client,
      required this.chatList,
      required this.chats})
      : super(key: key);
  final TelegramClient client;
  final ChatList chatList;
  final List<ChatFullInfo> chats;

  @override
  State<StatefulWidget> createState() => ChatListDisplayState();
}

class ChatListDisplayState extends State<ChatListDisplay> {
  Map<String, GlobalKey> keys = {};
  static const double cachedItemspx = 100;
  late ScrollController listViewContoller = ScrollController(
      initialScrollOffset: lastRealScrollOffset[widget.chatList] ?? 0);
  static Map<ChatList, double> lastRealScrollOffset = {};
  static Map<ChatList, double> virtualScrollOffset = {};

  @override
  void initState() {
    listViewContoller.addListener(() {
      setState(() {
        var delta = listViewContoller.offset -
            (lastRealScrollOffset[widget.chatList] ?? 0);
        virtualScrollOffset[widget.chatList] =
            (virtualScrollOffset[widget.chatList] ?? 0) + delta;

        lastRealScrollOffset[widget.chatList] = listViewContoller.offset;
      });
    });
    super.initState();
  }

  void jumpToStart() {
    virtualScrollOffset[widget.chatList] = 0;
    lastRealScrollOffset[widget.chatList] = 0;
    if (listViewContoller.hasClients) {
      listViewContoller.animateTo(0,
          duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    }
  }

  String _getGlobalIdenteficator(Chat chat) {
    return "${chat.id!} ${widget.chatList} ${widget.chatList is ChatListFilter ? (widget.chatList as ChatListFilter).chatFilterId : 0}";
  }

  @override
  Widget build(BuildContext context) {
    var list = widget.chats
        .where((element) =>
            showChatInChatList(element.chat.positions!, widget.chatList))
        .sorted((b, a) => a.chat.positions!
            .firstWhere((e) => compareChatlists(e.list!, widget.chatList))
            .order!
            .compareTo(b.chat.positions!
                .firstWhere((e) => compareChatlists(e.list!, widget.chatList))
                .order!));

    var top = max(((virtualScrollOffset[widget.chatList] ?? 0) ~/ 88) - 4, 0);
    var bottom =
        min((top + MediaQuery.of(context).size.height ~/ 88) + 8, list.length);

    for (final chat in list) {
      if (keys[_getGlobalIdenteficator(chat.chat)] == null) {
        keys[_getGlobalIdenteficator(chat.chat)] = GlobalKey();
      }
    }

    var sublist = list.sublist(top, bottom);
    int order = -1;
    return ListView(controller: listViewContoller, children: [
      Stack(
          children: [
                ((widget.chatList is ChatListMain)
                    ? ChatItemDisplayArchiveNotHidden(
                        client: widget.client, chats: widget.chats)
                    : const SizedBox.shrink())
              ] +
              [
                for (final chat in sublist)
                  ChatItemDisplay(
                      order: ++order +
                          top +
                          ((widget.chatList is ChatListMain) ? 1 : 0),
                      key: keys[_getGlobalIdenteficator(chat.chat)],
                      chat: chat.chat,
                      client: widget.client,
                      interlocutor: chat.interlocutor,
                      supergroup: chat.supergroup,
                      joinInfo: chat.joinInfo,
                      lastMessageSenderName: chat.lastMessageSenderName,
                      chatList: widget.chatList,
                      actionsInfo: chat.actions),
                Container(height: max(0, (list.length) * 88))
              ])
    ]);
  }
}
