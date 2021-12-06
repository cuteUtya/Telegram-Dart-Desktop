import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_display.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';

class ChatListDisplay extends StatefulWidget {
  const ChatListDisplay({Key? key, required this.client}) : super(key: key);
  final TelegramClient client;
  @override
  State<ChatListDisplay> createState() => _ChatListDisplayState();
}

class _chatAndPositionPair {
  const _chatAndPositionPair(this.chat, this.order);
  final int chat;
  final int order;
}

class _ChatListDisplayState extends State<ChatListDisplay> {
  void updateChats() =>
      widget.client.send(LoadChats(chatList: ChatListMain(), limit: 25));

  void rebuildChats() async {
    List<Chat> result = [];
    List<_chatAndPositionPair> pairs = [];
    orderedChats
        .forEach((key, value) => pairs.add(_chatAndPositionPair(key, value)));
    pairs.sort((a, b) => b.order.compareTo(a.order));
    for (int i = 0; i < pairs.length; i++) {
      result.add(
          await widget.client.send(GetChat(chatId: pairs[i].chat)) as Chat);
    }
    setState(() => chats = result);
  }

  @override
  void initState() {
    updateChats();
    widget.client.updateChatPosition.listen((UpdateChatPosition event) {
      orderedChats[event.chatId!] = event.position!.order!;
      rebuildChats();
    });
    widget.client.updateChatLastMessage.listen((UpdateChatLastMessage event) {
      event.positions?.forEach((ChatPosition position) =>
          orderedChats[event.chatId!] = position.order!);
      rebuildChats();
    });
    super.initState();
  }

  Map<int, int> orderedChats = {};
  List<Chat> chats = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            cacheExtent: 400,
            itemCount: chats.length,
            itemBuilder: (context, index) =>
                ChatItemDisplay(chat: chats[index], client: widget.client)));
  }
}
