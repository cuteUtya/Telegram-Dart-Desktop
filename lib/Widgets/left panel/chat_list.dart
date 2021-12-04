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

class _ChatListDisplayState extends State<ChatListDisplay> {
  void updateChats() =>
      widget.client.send(LoadChats(chatList: ChatListMain(), limit: 25));
  void rebuildChats() {
    List<Widget> result = [];
    var keys = orderedChats.keys.toList();
    keys.sort((a, b) => b.compareTo(a));
    for (int i = 0; i < keys.length; i++) {
      result.add(
          ChatItemDisplay(id: orderedChats[keys[i]]!, client: widget.client));
    }
    setState(() {
      chats = result;
    });
  }

  @override
  void initState() {
    updateChats();
    widget.client.updateChatPosition.listen((UpdateChatPosition event) {
      orderedChats.forEach((key, value) {
        if (value == event.chatId) orderedChats.remove(key);
      });
      orderedChats[event.position!.order!] = event.chatId!;
      rebuildChats();
    });
    widget.client.updateChatLastMessage.listen((UpdateChatLastMessage event) {
      event.positions?.forEach((ChatPosition position) =>
          orderedChats[position.order!] = event.chatId!);
      rebuildChats();
    });
    super.initState();
  }

  Map<int, int> orderedChats = {};
  List<Widget> chats = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, i) => chats[i],
            addAutomaticKeepAlives: true,
            cacheExtent: 1000));
  }
}
