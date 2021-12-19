import 'package:flutter/material.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_display.dart';
import 'package:myapp/Widgets/left%20panel/chat_lists_manager.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:collection/collection.dart';
import 'package:myapp/utils.dart';

class ChatListDisplay extends StatelessWidget {
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
  Widget build(BuildContext context) {
    var list = chats
        .where(
            (element) => showChatInChatList(element.chat.positions!, chatList))
        .sorted((b, a) => a.chat.positions!
            .firstWhere((e) => compareChatlists(e.list!, chatList))
            .order!
            .compareTo(b.chat.positions!
                .firstWhere((e) => compareChatlists(e.list!, chatList))
                .order!));
    int order = -1;

    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ChatItemDisplay(
              chat: list[index].chat,
              client: client,
              interlocutor: list[index].interlocutor,
              supergroup: list[index].supergroup,
              joinInfo: list[index].joinInfo,
              lastMessageSenderName: list[index].lastMessageSenderName,
              order: order,
              chatList: chatList,
              actionInfo: list[index].action);
        });
  }
}
