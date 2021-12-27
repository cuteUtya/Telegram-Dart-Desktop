import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_base.dart';
import 'package:myapp/Widgets/check_mark.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_action_display.dart';
import 'package:myapp/Widgets/left%20panel/chat_item.content_display.dart/chat_item_last_message_content.dart';
import 'package:myapp/Widgets/Userpic/chat_photo_display.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_title.dart';
import 'package:myapp/Widgets/left%20panel/chat_lists_manager.dart';
import 'package:myapp/Widgets/online_indicator_display.dart';
import 'package:myapp/Widgets/unread_mention_bubble.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;
import 'package:myapp/utils.dart';

class ChatItemDisplay extends StatelessWidget {
  ChatItemDisplay(
      {Key? key,
      required this.selected,
      required this.chat,
      required this.client,
      required this.chatList,
      required this.order,
      this.onClick})
      : super(key: key);
  final bool selected;
  final Chat chat;
  final int order;
  final TelegramClient client;
  final ChatList chatList;
  final Function()? onClick;

  static const bool USE_HORIZONTAL_SEPARATOR = false;
  bool get pinned =>
      chat.positions
          ?.firstWhere((element) => compareChatlists(element.list!, chatList))
          .isPinned ??
      false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        curve: Curves.decelerate,
        duration: const Duration(milliseconds: 400),
        margin: EdgeInsets.only(top: order * ChatItemBase.height),
        child: ChatItemBase(
            selected: selected,
            onClick: onClick,
            title: Row(children: [
              Expanded(
                  child: StreamBuilder(
                      stream: client.titleOf(chat.id!),
                      initialData: chat.title,
                      builder: (_, data) => ChatItemTitle(
                          selected: selected,
                          isBot: interlocutor?.type is UserTypeBot,
                          isChannel: (supergroup?.isChannel) ?? false,
                          isChat: (supergroup != null &&
                                  !(supergroup?.isChannel ?? true)) ||
                              chat.type is ChatTypeBasicGroup,
                          title: (interlocutor?.type is UserTypeDeleted)
                              ? client.getTranslation("lng_deleted")
                              : (data.data ?? "").toString(),
                          isScam: isScam,
                          isVerifed: isVerifed,
                          isSupport: isSupport))),
              if (chat.lastMessage?.isOutgoing ?? false)
                StreamBuilder(
                    initialData: chat.lastReadOutboxMessageId,
                    builder: (context, data) {
                      var value = false;
                      if (data.hasData) {
                        value =
                            (chat.lastMessage?.id ?? 0) <= (data.data as int);
                      }
                      return CheckMark(isReaded: value);
                    }),
              const SizedBox(width: 2),
              Text(getMessageTime(),
                  textAlign: TextAlign.right,
                  style: TextDisplay.create(
                      size: 18,
                      textColor: selected
                          ? TextColor.SelectedChatLastTimedMessage
                          : TextColor.ChatLastTimeMessage))
            ]),
            chatPic: Stack(children: [
              Stack(alignment: Alignment.bottomRight, children: [
                SizedBox(
                    height: 64,
                    width: 64,
                    child: StreamBuilder(
                        stream: client.photoOf(chat.id!),
                        initialData: chat.photo,
                        builder: (_, data) => ChatPhotoDisplay(
                            photo: data.hasData
                                ? data.data as ChatPhotoInfo
                                : null,
                            chatId: chat.id!,
                            chatTitle: chat.title!,
                            client: client))),
                if (interlocutor != null &&
                    interlocutor?.type is UserTypeRegular)
                  StreamBuilder(
                      stream: client.statusOf(interlocutor!.id!),
                      initialData: interlocutor?.status,
                      builder: (context, data) => OnlineIndicatorDidplay(
                          heigth: 20,
                          width: 20,
                          online: data.data is UserStatusOnline))
              ]),
              StreamBuilder(
                  initialData: chat.unreadMentionCount!,
                  stream: client.unreadMentionCountOf(chat.id!),
                  builder: (context, data) => UnreadCountBubble(
                      count: data.hasData ? data.data as int : 0,
                      important: true))
            ]),
            unreadPlaceHolder: StreamBuilder(
                initialData: chat.unreadCount,
                stream: client.unreadCountOf(chat.id!),
                builder: (context, data) {
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
                        stream: client.actionsOf(chat.id!),
                        builder: (_, data) {
                          if (data.hasData && data.data != null) {
                            if ((data.data as Map<String, ChatAction>)
                                .isNotEmpty) {
                              return ChatItemActionDisplay(
                                  chatSelected: selected,
                                  isPrivate: interlocutor != null,
                                  chatid: chat.id!,
                                  client: client,
                                  actions:
                                      data.data as Map<String, ChatAction>);
                            }
                          }
                          return ChatItemLastMessageContent(
                              chatSelected: selected,
                              chat: chat,
                              client: client);
                        }))),
            icon: pinned
                ? Icon(Icons.push_pin,
                    color: ClientTheme.currentTheme.getField(selected
                        ? "SelectedChatPinIconColor"
                        : "ChatPinIconColor"))
                : null));
  }

  Supergroup? get supergroup {
    if (chat.type is ChatTypeSupergroup) {
      return client
          .getSupergroup((chat.type as ChatTypeSupergroup).supergroupId!);
    }
  }

  User? get interlocutor {
    if (chat.type is ChatTypePrivate || chat.type is ChatTypeSecret) {
      return client.getUser(chat.type is ChatTypePrivate
          ? (chat.type as ChatTypePrivate).userId!
          : (chat.type as ChatTypeSecret).userId!);
    }
  }

  bool get isOnline {
    if (interlocutor != null) {
      if (interlocutor!.type is! UserTypeRegular) return false;
      return interlocutor!.status is UserStatusOnline;
    }
    return false;
  }

  bool get isScam {
    if (supergroup?.isScam ?? false) return true;
    if (interlocutor?.isScam ?? false) return true;

    return false;
  }

  bool get isVerifed {
    if (supergroup?.isVerified ?? false) return true;
    return false;
  }

  bool get isSupport {
    if (interlocutor?.isSupport ?? false) return true;
    return false;
  }

  String getMessageTime() {
    if (chat.lastMessage != null) {
      var time = unixToDateTime(chat.lastMessage!.date!);
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

      return "${validateDataComponent(time.day.toString())}.${validateDataComponent(time.month.toString())}.${time.year}";
    }
    return "";
  }
}
