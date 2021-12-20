import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:myapp/Widgets/left%20panel/chat_list.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:collection/collection.dart';
import 'package:myapp/utils.dart';

class ChatListsManager extends StatefulWidget {
  const ChatListsManager({Key? key, required this.client}) : super(key: key);
  final TelegramClient client;
  @override
  State<StatefulWidget> createState() => ChatListsManagerState();
}

class ChatListsManagerState extends State<ChatListsManager> {
  static List<ChatFullInfo> _chats = [];
  static List<ChatList> _lists = []; //[ChatListFilter(chatFilterId: 3)];
  static int _currentPage = 0;

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

  Future<ChatFullInfo> getFullChatInfo(int chatid) async {
    var chat = await widget.client.send(GetChat(chatId: chatid)) as Chat;
    return ChatFullInfo(
        chat: chat,
        joinInfo: await getUsersJoinInfo(chat.lastMessage),
        interlocutor: await getUser(chat),
        supergroup: await getSupergroup(chat),
        lastMessageSenderName: (await getLastMessageAuthor(chat)) ?? "");
  }

  void _listenChatPosition() async {
    await for (final event in widget.client.updateChatPosition) {
      ChatFullInfo? chat =
          _chats.firstWhereOrNull((element) => element.chat.id == event.chatId);
      if (chat == null) {
        _chats.add(await getFullChatInfo(event.chatId!));
      } else {
        for (int i = 0; i < chat.chat.positions!.length; i++) {
          if (compareChatlists(
              chat.chat.positions![i].list!, event.position!.list!)) {
            chat.chat.positions![i] = event.position!;
            break;
          }
        }
      }
      if (mounted) {
        setState(() {});
      } else {
        break;
      }
    }
  }

  void setChatLists(List<ChatList> lists) {
    setState(() => _lists = lists);
  }

  void setCurrentChatList(ChatList list) {
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
      _displayLists[_lists[_currentPage]]?.currentState?.jumpToStart();
    }
  }

  void _changeCurrentPage(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  PageController pageController = PageController();
  List<StreamSubscription> _subscriptions = [];

  void _updateChats() {
    widget.client.send(LoadChats(chatList: ChatListMain(), limit: 25));
    widget.client.send(LoadChats(chatList: ChatListArchive(), limit: 25));
  }

  @override
  void initState() {
    _updateChats();
    _listenChatPosition();
    _subscriptions
        .add(widget.client.updateChatLastMessage.listen((event) async {
      ChatFullInfo? chat =
          _chats.firstWhereOrNull((element) => element.chat.id == event.chatId);
      if (chat != null) {
        chat.chat.positions = event.positions!;
        chat.chat.lastMessage = event.lastMessage;
        var joinInfo = await getUsersJoinInfo(event.lastMessage);
        if (chat.joinInfo != joinInfo) {
          chat.joinInfo = joinInfo;
        }
        chat.lastMessageSenderName =
            await getLastMessageAuthor(chat.chat) ?? "";
        setState(() {});
      }
    }));

    _subscriptions.add(widget.client.updateUserStatus.listen((event) async {
      ChatFullInfo? chat =
          _chats.firstWhereOrNull((element) => element.chat.id == event.userId);
      if (chat != null) {
        chat.interlocutor?.status = event.status;
        setState(() {});
      }
    }));

    _subscriptions.add(widget.client.updateUserChatAction.listen((event) async {
      ChatFullInfo? chat =
          _chats.firstWhereOrNull((element) => element.chat.id == event.chatId);
      if (chat != null) {
        chat.action = ChatActionInfo(
            action: event.action!,
            who: (await widget.client.send(GetUser(userId: event.userId)))
                as User);
        setState(() {});
      }
    }));

    _subscriptions.add(widget.client.updateChatReadOutbox.listen((event) {
      ChatFullInfo? chat =
          _chats.firstWhereOrNull((element) => element.chat.id == event.chatId);
      if (chat != null) {
        chat.chat.lastReadOutboxMessageId = event.lastReadOutboxMessageId;
        setState(() {});
      }
    }));

    _subscriptions.add(widget.client.updateChatDraftMessage.listen((event) {
      ChatFullInfo? chat =
          _chats.firstWhereOrNull((element) => element.chat.id == event.chatId);
      if (chat != null) {
        chat.chat.draftMessage = event.draftMessage;
        chat.chat.positions = event.positions;
        setState(() {});
      }
    }));

    _subscriptions.add(widget.client.updateChatReadinbox.listen((event) {
      ChatFullInfo? chat =
          _chats.firstWhereOrNull((element) => element.chat.id == event.chatId);
      if (chat != null) {
        chat.chat.unreadCount = event.unreadCount;
        chat.chat.lastReadInboxMessageId = event.lastReadInboxMessageId;
        setState(() {});
      }
    }));

    _subscriptions
        .add(widget.client.updateChatUnreadMentionCount.listen((event) {
      ChatFullInfo? chat =
          _chats.firstWhereOrNull((element) => element.chat.id == event.chatId);
      if (chat != null) {
        chat.chat.unreadMentionCount = event.unreadMentionCount;
        setState(() {});
      }
    }));

    _subscriptions.add(widget.client.updateMessageMentionRead.listen((event) {
      ChatFullInfo? chat =
          _chats.firstWhereOrNull((element) => element.chat.id == event.chatId);
      if (chat != null) {
        chat.chat.unreadMentionCount = event.unreadMentionCount;
        setState(() {});
      }
    }));
    super.initState();
  }

  @override
  void dispose() {
    _subscriptions.forEach((element) {
      element.cancel();
    });
    super.dispose();
  }

  bool _init = false;

  Map<ChatList, GlobalKey<ChatListDisplayState>> _displayLists = {};

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (!_init) {
        pageController.jumpToPage(_currentPage);
        _init = true;
      }
    });

    if (_chats.isEmpty) return Container();
    return PageView.builder(
        itemCount: _lists.length,
        controller: pageController,
        itemBuilder: (_, i) {
          _displayLists[_lists[i]] = GlobalKey<ChatListDisplayState>();
          return ChatListDisplay(
              key: _displayLists[_lists[i]],
              client: widget.client,
              chatList: _lists[i],
              chats: _chats);
        });
  }
}

class UsersJoinedGroupInfo {
  UsersJoinedGroupInfo(
      {required this.addedUsers, required this.langKey, required this.isJoin});

  ///users, what was added to chat. Non-null if lastMessage.content is MessageChatAddMembers
  List<User> addedUsers;

  bool isJoin;

  String langKey;
}

class ChatActionInfo {
  const ChatActionInfo({required this.action, required this.who});
  final ChatAction action;
  final User who;
}

class ChatFullInfo {
  ChatFullInfo(
      {required this.chat,
      required this.lastMessageSenderName,
      this.interlocutor,
      this.supergroup,
      this.joinInfo,
      this.order = 0,
      this.action});
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

  ChatActionInfo? action;
}
