import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/Widgets/chat_item_display_archive_not_hidden.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/horizontal_separator_line.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_display_chat.dart';
import 'package:myapp/Widgets/left%20panel/chat_lists_manager.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:collection/collection.dart';
import 'package:myapp/utils.dart';

class ChatListDisplay extends StatefulWidget {
  const ChatListDisplay(
      {Key? key,
      required this.client,
      required this.chatList,
      required this.chats,
      required this.selectedChatId,
      this.onChatClick,
      this.onArchiveClick})
      : super(key: key);
  final TelegramClient client;
  final ChatList chatList;
  final List<ChatFullInfo> chats;
  final Function()? onArchiveClick;
  final Function(int id)? onChatClick;
  final int? selectedChatId;

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
                        onClick: widget.onArchiveClick,
                        client: widget.client,
                        chats: widget.chats)
                    : const SizedBox.shrink())
              ] +
              [
                for (final chat in sublist)
                  ChatItemDisplay(
                      selected: chat.chat.id == widget.selectedChatId,
                      onClick: () {
                        if (widget.onChatClick != null) {
                          widget.onChatClick!(chat.chat.id!);
                        }
                      },
                      order: ++order +
                          top +
                          ((widget.chatList is ChatListMain) ? 1 : 0),
                      key: keys[_getGlobalIdenteficator(chat.chat)],
                      chat: chat.chat,
                      client: widget.client,
                      chatList: widget.chatList),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                      top: (++order +
                              top +
                              ((widget.chatList is ChatListMain) ? 1 : 0)) *
                          88),
                  child: Column(children: [
                    const SeparatorLine(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Total chats: ${list.length}",
                            style: TextDisplay.regular18,
                          )),
                    )
                  ]),
                ),
                Container(height: max(0, (list.length) * 88))
              ])
    ]);
  }
}
