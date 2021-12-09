import 'package:flutter/material.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_display.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:collection/collection.dart';

class ChatListDisplay extends StatefulWidget {
  const ChatListDisplay({Key? key, required this.client}) : super(key: key);
  final TelegramClient client;
  @override
  State<ChatListDisplay> createState() => _ChatListDisplayState();
}

class _ChatAndPositionPair {
  const _ChatAndPositionPair(this.chat, this.order);
  final int chat;
  final int order;
}

class _ChatFullInfo {
  _ChatFullInfo({required this.chat, this.interlocutor});
  Chat chat;
  User? interlocutor;
}

class _ChatListDisplayState extends State<ChatListDisplay> {
  void updateChats() =>
      widget.client.send(LoadChats(chatList: ChatListMain(), limit: 25));

  void rebuildChats() async {
    List<_ChatFullInfo> result = [];
    List<_ChatAndPositionPair> pairs = [];
    orderedChats
        .forEach((key, value) => pairs.add(_ChatAndPositionPair(key, value)));
    pairs.sort((a, b) => b.order.compareTo(a.order));
    for (int i = 0; i < pairs.length; i++) {
      var chat =
          await widget.client.send(GetChat(chatId: pairs[i].chat)) as Chat;
      User? user;
      if (chat.type is ChatTypePrivate || chat.type is ChatTypeSecret) {
        user = await widget.client.send(GetUser(userId: chat.id)) as User;
      }
      result.add(_ChatFullInfo(chat: chat, interlocutor: user));
    }
    setState(() => chats = result);
  }

  Future<User?> getUser(Chat chat) async {
    if (chat.lastMessage!.sender is MessageSenderUser) {
      var id = (chat.lastMessage!.sender as MessageSenderUser).userId;
      return (await widget.client.send(GetUser(userId: id))) as User;
    }
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
    widget.client.updateUserStatus.listen((event) {
      setState(() => chats
          .firstWhereOrNull((element) => element.chat.id == event.userId)
          ?.interlocutor
          ?.status = event.status);
    });
    super.initState();
  }

  Map<int, int> orderedChats = {};
  List<_ChatFullInfo> chats = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            cacheExtent: 800,
            itemCount: chats.length,
            itemBuilder: (context, index) => ChatItemDisplay(
                chat: chats[index].chat,
                interlocutor: chats[index].interlocutor,
                client: widget.client)));
  }
}
