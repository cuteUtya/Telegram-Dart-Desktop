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

class UsersJoinedGroupInfo {
  UsersJoinedGroupInfo(
      {required this.addedUsers, required this.langKey, required this.isJoin});

  ///users, what was added to chat. Non-null if lastMessage.content is MessageChatAddMembers
  List<User> addedUsers;

  bool isJoin;

  String langKey;
}

class _ChatFullInfo {
  _ChatFullInfo(
      {required this.chat,
      required this.lastMessageSenderName,
      required this.key,
      this.interlocutor,
      this.supergroup,
      this.joinInfo,
      this.order = 0});
  Chat chat;

  ///person with whom there is a dialogue
  ///not null if chat.type is ChatTypePrivate or ChatTypeSecret
  User? interlocutor;

  ///supergroup, null if chat.type != ChatTypeSupergroup
  Supergroup? supergroup;

  ///Name of user, what send last message in chat
  String lastMessageSenderName;

  //info about MessageChatAddMembers or MessageChatJoinByLink or MessageChatJoinByRequest message
  UsersJoinedGroupInfo? joinInfo;

  //order in chatlist
  int order;

  GlobalKey<ChatItemDisplayState> key;
}

class _ChatListDisplayState extends State<ChatListDisplay> {
  void updateChats() =>
      widget.client.send(LoadChats(chatList: ChatListMain(), limit: 25));

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

  Future<UsersJoinedGroupInfo?> getUsersJoinInfo(Message? message) async {
    if (message?.content != null) {
      switch (message?.content.runtimeType) {
        case MessageChatJoinByRequest:
          return UsersJoinedGroupInfo(
              addedUsers: [], isJoin: true, langKey: "lng_action_user_joined");
        case MessageChatJoinByLink:
          return UsersJoinedGroupInfo(
              addedUsers: [],
              isJoin: true,
              langKey: "lng_action_user_joined_by_link");
        case MessageChatAddMembers:
          var members = await getUsersById(
              (message?.content as MessageChatAddMembers).memberUserIds);
          bool isJoin = (members ?? []).firstWhereOrNull((e) =>
                  (e.id == (message?.sender as MessageSenderUser).userId)) !=
              null;
          return UsersJoinedGroupInfo(
              addedUsers: members ?? [],
              isJoin: isJoin,
              langKey:
                  isJoin ? "lng_action_user_joined" : "lng_action_add_user");
      }
    }
  }

  Future<String?> getLastMessageAuthor(Chat chat) async {
    var sender = chat.lastMessage?.sender;
    if (sender is MessageSenderChat) {
      return (await widget.client.send(GetChat(chatId: sender.chatId)) as Chat)
          .title!;
    }
    if (sender is MessageSenderUser) {
      return (await widget.client.send(GetUser(userId: sender.userId)) as User)
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

  Future<_ChatFullInfo> getFullChatInfo(int chatid) async {
    var chat = await widget.client.send(GetChat(chatId: chatid)) as Chat;
    return _ChatFullInfo(
        key: GlobalKey<ChatItemDisplayState>(),
        chat: chat,
        joinInfo: await getUsersJoinInfo(chat.lastMessage),
        interlocutor: await getUser(chat),
        supergroup: await getSupergroup(chat),
        lastMessageSenderName: (await getLastMessageAuthor(chat)) ?? "");
  }

  void sortItems() {
    //TODO not just positions![0]
    chats.sort((a, b) =>
        b.chat.positions![0].order!.compareTo(a.chat.positions![0].order!));
    for (int order = 0; order < chats.length; order++) {
      if (order != chats[order].order) {
        chats[order].order = order;
        chats[order].key.currentState?.reOrder(order);
      }
    }
  }

  @override
  void initState() {
    updateChats();
    widget.client.updateChatPosition.listen((UpdateChatPosition event) async {
      _ChatFullInfo? updatesChat =
          chats.firstWhereOrNull((element) => element.chat.id == event.chatId);
      if (updatesChat == null) {
        chats.add(await getFullChatInfo(event.chatId!));
        sortItems();
        setState(() => chatsCount = chats.length);
      } else {
        //TODO not just positions![0]
        updatesChat.chat.positions![0] = event.position!;
        sortItems();
      }
    });

    widget.client.updateChatLastMessage
        .listen((UpdateChatLastMessage event) async {
      _ChatFullInfo? updatesChat =
          chats.firstWhereOrNull((element) => element.chat.id == event.chatId);
      if (updatesChat != null) {
        updatesChat.chat.positions = event.positions!;
        updatesChat.chat.lastMessage = event.lastMessage;
        updatesChat.key.currentState?.updateChatInfo(updatesChat.chat);
        updatesChat.key.currentState?.updateLastMessageSenderName(
            await getLastMessageAuthor(updatesChat.chat) ?? "");

        sortItems();
      }
    });
    super.initState();
  }

  List<_ChatFullInfo> chats = [];
  int chatsCount = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        //TODO make scroll more "soft" when Google implement this — https://github.com/flutter/flutter/issues/32120
        child: ListView(children: [
      /*My friend, if you read this - know i load ALL chats in RAM with all images,
          if you don't find this message here (?what?) i optimized this moment*/
      Stack(
          children: chats
              .map((chat) => ChatItemDisplay(
                  key: chat.key,
                  order: chat.order,
                  chat: chat.chat,
                  joinInfo: chat.joinInfo,
                  supergroup: chat.supergroup,
                  interlocutor: chat.interlocutor,
                  lastMessageSenderName: chat.lastMessageSenderName,
                  client: widget.client))
              .toList())
    ]));
  }
}
