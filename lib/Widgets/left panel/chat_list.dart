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
  _ChatFullInfo(
      {required this.chat,
      this.interlocutor,
      this.supergroup,
      this.addedUsers,
      this.lastMessageSenderName = ""});
  Chat chat;

  ///person with whom there is a dialogue
  ///not null if chat.type is ChatTypePrivate or ChatTypeSecret
  User? interlocutor;

  ///supergroup, null if chat.type != ChatTypeSupergroup
  Supergroup? supergroup;

  ///users, what was added to chat. Non-null if lastMessage.content is MessageChatAddMembers
  List<User>? addedUsers;

  ///Name of user, what send last message in chat
  String lastMessageSenderName;
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
      List<User>? addedUsers;
      if (chat.lastMessage?.content is MessageChatAddMembers) {
        addedUsers = await getUsersById(
            (chat.lastMessage?.content as MessageChatAddMembers).memberUserIds);
      }
      result.add(_ChatFullInfo(
          chat: chat,
          interlocutor: await getUser(chat),
          supergroup: await getSupergroup(chat),
          addedUsers: addedUsers,
          lastMessageSenderName: await getLastMessageAuthor(chat) ?? ""));
    }
    setState(() => chats = result);
  }

  Future<Supergroup?> getSupergroup(Chat chat) async {
    if (chat.type is ChatTypeSupergroup) {
      return (await widget.client.send(GetSupergroup(
              supergroupId: (chat.type as ChatTypeSupergroup).supergroupId)))
          as Supergroup;
    }
  }

  Future<List<User>?> getUsersById(List<int>? id) async {
    if (id != null) {
      List<User> usrs = [];
      for (int i = 0; i < id.length; i++) {
        usrs.add(await widget.client.send(GetUser(userId: id[i])) as User);
      }

      return usrs;
    }
  }

  Future<String?> getLastMessageAuthor(Chat chat) async {
    var sender = chat.lastMessage!.sender! is MessageSenderUser;
    if (sender is MessageSenderChat) {
      return (await widget.client
                  .send(GetChat(chatId: (sender as MessageSenderChat).chatId))
              as Chat)
          .title!;
    }

    if (sender is MessageSenderUser) {
      return (await widget.client
                  .send(GetUser(userId: (sender as MessageSenderUser).userId))
              as User)
          .firstName!;
    }
  }

  Future<User?> getUser(Chat chat) async {
    int? userId;
    if (chat.type is ChatTypePrivate) {
      userId = (chat.type as ChatTypePrivate).userId;
    }
    if (chat.type is ChatTypeSecret) {
      userId = (chat.type as ChatTypeSecret).userId;
    }
    if (userId != null) {
      return (await widget.client.send(GetUser(userId: userId))) as User;
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
        //TODO make scroll more "soft" when Google implement this — https://github.com/flutter/flutter/issues/32120
        child: ListView.builder(
            cacheExtent: 800,
            itemCount: chats.length,
            itemBuilder: (context, index) => ChatItemDisplay(
                chat: chats[index].chat,
                supergroup: chats[index].supergroup,
                interlocutor: chats[index].interlocutor,
                addedInChatMembers: chats[index].addedUsers,
                lastMessageSenderName: chats[index].lastMessageSenderName,
                client: widget.client)));
  }
}
