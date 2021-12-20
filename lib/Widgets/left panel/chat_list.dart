import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_display.dart';
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
  //TODO maybe good idea sometime clean this structure
  static Map<String, GlobalKey> keys = {};

  static const double cachedItemspx = 100;
  late ScrollController listViewContoller = ScrollController(
      initialScrollOffset: lastRealScrollOffset[widget.chatList] ?? 0);
  static Map<ChatList, double> lastRealScrollOffset = {};
  static Map<ChatList, double> virtualScrollOffset = {};

  bool _shouldDraw(int order) {
    if (!listViewContoller.hasClients) return true;
    var myPosition = -listViewContoller.offset + order * 88;
    return !(myPosition - cachedItemspx > MediaQuery.of(context).size.height ||
        myPosition + 88 + cachedItemspx < 0);
  }

  @override
  void initState() {
    listViewContoller.addListener(() {
      var delta = listViewContoller.offset -
          (lastRealScrollOffset[widget.chatList] ?? 0);
      virtualScrollOffset[widget.chatList] =
          (virtualScrollOffset[widget.chatList] ?? 0) + delta;
      setState(() {});
      lastRealScrollOffset[widget.chatList] = listViewContoller.offset;
    });
    super.initState();
  }

  void jumpToStart() {
    virtualScrollOffset[widget.chatList] = 0;
    lastRealScrollOffset[widget.chatList] = 0;
    listViewContoller.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
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

    for (final chat in list) {
      if (keys[_getGlobalIdenteficator(chat.chat)] == null) {
        keys[_getGlobalIdenteficator(chat.chat)] = GlobalKey();
      }
    }
    var top = max(((virtualScrollOffset[widget.chatList] ?? 0) ~/ 88) - 4, 0);
    var bottom =
        min((top + MediaQuery.of(context).size.height ~/ 88) + 8, list.length);

    var sublist = list.sublist(top, bottom);
    int order = -1;
    return ListView(controller: listViewContoller, children: [
      Stack(children: [
        for (final chat in sublist)
          AnimatedContainer(
              key: Key(chat.hashCode.toString()),
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 400),
              margin: EdgeInsets.only(top: (++order + top) * 88),
              child: ChatItemDisplay(
                  key: keys[_getGlobalIdenteficator(chat.chat)],
                  chat: chat.chat,
                  client: widget.client,
                  interlocutor: chat.interlocutor,
                  supergroup: chat.supergroup,
                  joinInfo: chat.joinInfo,
                  lastMessageSenderName: chat.lastMessageSenderName,
                  chatList: widget.chatList,
                  actionInfo: chat.action)),
        Container(height: max(0, (list.length) * 88))
      ])
    ]);
  }
}
