import 'package:flutter/material.dart';
import 'package:myapp/StateManagment/ui_events.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/Userpic/userpic_icon.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_base.dart';
import 'package:myapp/Widgets/check_mark.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_action_display.dart';
import 'package:myapp/Widgets/left%20panel/chat_item.content_display.dart/chat_item_last_message_content.dart';
import 'package:myapp/Widgets/Userpic/userpic.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_title.dart';
import 'package:myapp/Widgets/online_indicator_display.dart';
import 'package:myapp/Widgets/unread_mention_bubble.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;
import 'package:myapp/utils.dart';

class ChatItemDisplay extends StatelessWidget {
  const ChatItemDisplay(
      {Key? key,
      required this.chatId,
      required this.client,
      required this.chatList,
      this.onClick})
      : super(key: key);
  final int chatId;
  final TelegramClient client;
  final ChatList chatList;
  final Function()? onClick;

  bool pinned(Chat chat) =>
      chat.positions
          ?.firstWhere((element) => compareChatlists(element.list!, chatList))
          .isPinned ??
      false;

  static int i = 0;

  @override
  Widget build(BuildContext context) {
    bool isSavedMessages =
        chatId == client.getOptionValue<OptionValueInteger>("my_id")?.value;
    bool isReplieChat = chatId ==
        (client
            .getOptionValue<OptionValueInteger>("replies_bot_chat_id")
            ?.value);
    return StreamBuilder(
        stream: UIEvents.selectedChat(),
        builder: (_, data) {
          var selected = data.data == chatId;
          return ChatItemBase(
              selected: selected,
              onClick: () => onClick?.call(),
              title: Row(children: [
                Expanded(
                    child: StreamBuilder(
                        stream: isSavedMessages
                            ? null
                            : client.titleOf(client.getChat(chatId).id!),
                        initialData: client.getChat(chatId).title,
                        builder: (_, data) {
                          var chat = client.getChat(chatId);
                          return ChatItemTitle(
                              selected: selected,
                              isBot: interlocutor(chat)?.type is UserTypeBot &&
                                  !isReplieChat,
                              isChannel: (supergroup(chat)?.isChannel) ?? false,
                              isChat: (supergroup(chat) != null &&
                                      !(supergroup(chat)?.isChannel ?? true)) ||
                                  chat.type is ChatTypeBasicGroup,
                              title: isSavedMessages
                                  ? client.getTranslation("lng_saved_messages")
                                  : (interlocutor(chat)?.type
                                          is UserTypeDeleted)
                                      ? client.getTranslation("lng_deleted")
                                      : (data.data ?? "").toString(),
                              isScam: isScam(chat),
                              isVerifed: isVerifed(chat),
                              isSupport: isSupport(chat));
                        })),
                StreamBuilder(
                    initialData: client.getChat(chatId).lastReadOutboxMessageId,
                    builder: (context, data) {
                      var value = false;
                      if (data.hasData) {
                        value = (client.getChat(chatId).lastMessage?.id ?? 0) <=
                            (data.data as int);
                      }
                      if (!isSavedMessages &&
                          (client.getChat(chatId).lastMessage?.isOutgoing ??
                              false)) {
                        return CheckMark(isReaded: value);
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                const SizedBox(width: 2),
                StreamBuilder(
                    initialData: client.getChat(chatId).lastMessage,
                    stream: client.lastMessageIn(chatId),
                    builder: (_, data) => Text(
                        getMessageTime(
                            data.data != null ? data.data as Message : null),
                        textAlign: TextAlign.right,
                        style: TextDisplay.create(
                            size: 18,
                            textColor: selected
                                ? TextColor.SelectedChatLastTimedMessage
                                : TextColor.ChatLastTimeMessage))),
              ]),
              chatPic: isSavedMessages
                  ? UserpicIcon(
                      color: ClientTheme.currentTheme
                          .getField("SaveMessagesBackColor"),
                      iconColor: ClientTheme.currentTheme
                          .getField("SaveMessageIconColor"),
                      icon: Icons.bookmarks_outlined)
                  : isReplieChat
                      ? UserpicIcon(
                          color: ClientTheme.currentTheme
                              .getField("RepliesMessagesBackColor"),
                          iconColor: ClientTheme.currentTheme
                              .getField("RepliesMessageIconColor"),
                          icon: Icons.question_answer_outlined)
                      : Stack(children: [
                          Stack(alignment: Alignment.bottomRight, children: [
                            SizedBox(
                                height: 64,
                                width: 64,
                                child: StreamBuilder(
                                    stream: client.photoOf(chatId),
                                    initialData: client.getChat(chatId).photo,
                                    builder: (_, data) {
                                      var chatPhoto = data.data == null
                                          ? null
                                          : data.data as ChatPhotoInfo;
                                      return Userpic(
                                          key: Key(
                                              "userpic#chatId?=${chatId}fileId?=${chatPhoto?.big?.id}"),
                                          chatPhoto:
                                              data.hasData ? chatPhoto : null,
                                          chatId: chatId,
                                          chatTitle:
                                              client.getChat(chatId).title!,
                                          client: client);
                                    })),
                            if (interlocutor(client.getChat(chatId)) != null &&
                                interlocutor(client.getChat(chatId))?.type
                                    is UserTypeRegular)
                              StreamBuilder(
                                  stream: client.statusOf(
                                      interlocutor(client.getChat(chatId))!
                                          .id!),
                                  initialData:
                                      interlocutor(client.getChat(chatId))!
                                          .status,
                                  builder: (context, data) =>
                                      OnlineIndicatorDidplay(
                                          heigth: 20,
                                          width: 20,
                                          online:
                                              data.data is UserStatusOnline))
                          ]),
                          StreamBuilder(
                              initialData:
                                  client.getChat(chatId).unreadMentionCount!,
                              stream: client.unreadMentionCountOf(chatId),
                              builder: (context, data) => UnreadCountBubble(
                                  count: data.hasData ? data.data as int : 0,
                                  important: true))
                        ]),
              unreadPlaceHolder: StreamBuilder(
                  initialData: client.getChat(chatId).unreadCount,
                  stream: client.unreadCountOf(chatId),
                  builder: (context, data) {
                    var chat = client.getChat(chatId);
                    if (data.hasData) {
                      chat.unreadCount = data.data as int;
                    }
                    return StreamBuilder(
                        initialData: chat.unreadMentionCount,
                        stream: client.unreadMentionCountOf(chat.id!),
                        builder: (context, data1) {
                          if (data.hasData) {
                            chat.unreadMentionCount = (data1.data as int);
                          }
                          return UnreadCountBubble(
                              count: chat.unreadCount!,
                              important: (chat.unreadMentionCount ?? 0) != 0);
                        });
                  }),
              content: Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: StreamBuilder(
                          stream: client.actionsOf(chatId),
                          builder: (_, data) {
                            if (data.hasData) {
                              var actions =
                                  data.data as Map<MessageSender, ChatAction>;
                              if (actions.isNotEmpty) {
                                return ChatItemActionDisplay(
                                    chatSelected: selected,
                                    isPrivate:
                                        interlocutor(client.getChat(chatId)) !=
                                            null,
                                    chatid: chatId,
                                    client: client,
                                    actions: actions);
                              }
                            }
                            return ChatItemLastMessageContent(
                                chatSelected: selected,
                                chat: client.getChat(chatId),
                                client: client);
                          }))),
              icon: pinned(client.getChat(chatId))
                  ? Icon(Icons.push_pin,
                      color: ClientTheme.currentTheme.getField(selected
                          ? "SelectedChatPinIconColor"
                          : "ChatPinIconColor"))
                  : null);
        });
  }

  Supergroup? supergroup(Chat chat) {
    if (chat.type is ChatTypeSupergroup) {
      return client
          .getSupergroup((chat.type as ChatTypeSupergroup).supergroupId!);
    }
  }

  User? interlocutor(Chat chat) {
    if (chat.type is ChatTypePrivate || chat.type is ChatTypeSecret) {
      return client.getUser(chat.type is ChatTypePrivate
          ? (chat.type as ChatTypePrivate).userId!
          : (chat.type as ChatTypeSecret).userId!);
    }
  }

  bool isOnline(Chat chat) {
    if (interlocutor(chat) != null) {
      if (interlocutor(chat)?.type is! UserTypeRegular) return false;
      return interlocutor(chat)?.status is UserStatusOnline;
    }
    return false;
  }

  bool isScam(Chat chat) {
    if (supergroup(chat)?.isScam ?? false) return true;
    if (interlocutor(chat)?.isScam ?? false) return true;

    return false;
  }

  bool isVerifed(Chat chat) {
    if (supergroup(chat)?.isVerified ?? false) return true;
    return false;
  }

  bool isSupport(Chat chat) {
    if (interlocutor(chat)?.isSupport ?? false) return true;
    return false;
  }

  String getMessageTime(Message? message) {
    if (message == null) return "";
    var time = unixToDateTime(message.date!);
    var now = DateTime.now();
    var deltaInDays = (DateTime.now().difference(time) +
            (const Duration(days: 1) -
                Duration(
                    hours: now.hour,
                    minutes: now.minute,
                    seconds: now.second,
                    milliseconds: now.millisecond)))
        .inDays;

    if (deltaInDays <= 0) {
      return getHHMM(time);
    } else if (deltaInDays <= 7 && time.weekday < now.weekday) {
      return "${client.getTranslation("lng_weekday${time.weekday}")} (${getHHMM(time)})";
    }

    return "${to00format(time.day.toString())}.${to00format(time.month.toString())}.${time.year}";
  }
}
