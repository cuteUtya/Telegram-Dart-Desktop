import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_base.dart';
import 'package:myapp/Widgets/check_mark.dart';
import 'package:myapp/Widgets/clickable_object.dart';
import 'package:myapp/Widgets/clickable_text.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/horizontal_separator_line.dart';
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
      required this.chat,
      required this.client,
      required this.interlocutor,
      required this.supergroup,
      required this.joinInfo,
      required this.lastMessageSenderName,
      required this.chatList,
      required this.actionsInfo,
      required this.order})
      : super(key: key);
  final Chat chat;
  final int order;
  final User? interlocutor;
  final Supergroup? supergroup;
  final UsersJoinedGroupInfo? joinInfo;
  final String lastMessageSenderName;
  final TelegramClient client;
  final ChatList chatList;
  final List<ChatActionInfo>? actionsInfo;

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
        margin: EdgeInsets.only(top: order * 88),
        child: ChatItemBase(
            title: Row(children: [
              Expanded(
                  child: ChatItemTitle(
                      title: (interlocutor?.type is UserTypeDeleted)
                          ? client.getTranslation("lng_deleted")
                          : chat.title!,
                      isScam: isScam,
                      isVerifed: isVerifed,
                      isSupport: isSupport)),
              (chat.lastMessage?.isOutgoing ?? false) &&
                      chat.draftMessage == null
                  ? CheckMark(
                      isReaded: (chat.lastMessage?.id ?? 0) <=
                          (chat.lastReadOutboxMessageId ?? 0))
                  : const SizedBox.shrink(),
              const SizedBox(width: 2),
              Text(getMessageTime(),
                  textAlign: TextAlign.right,
                  style: TextDisplay.create(
                      size: 18, textColor: TextColor.ChatLastTimeMessage))
            ]),
            chatPic: Stack(children: [
              Stack(alignment: Alignment.bottomRight, children: [
                SizedBox(
                    height: 64,
                    width: 64,
                    child: ChatPhotoDisplay(
                        photo: chat.photo,
                        chatId: chat.id!,
                        chatTitle: chat.title!,
                        client: client)),
                OnlineIndicatorDidplay(heigth: 20, width: 20, online: isOnline)
              ]),
              UnreadCountBubble(
                  count: chat.unreadMentionCount ?? 0, important: true)
            ]),
            unread: chat.unreadCount ?? 0,
            unreadMention: chat.unreadMentionCount ?? 0,
            content: Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: actionsInfo?.isNotEmpty ?? false
                        ? ChatItemActionDisplay(
                            isPrivate: interlocutor != null,
                            chatid: chat.id!,
                            client: client,
                            actions: actionsInfo!)
                        : ChatItemLastMessageContent(
                            joinInfo: joinInfo,
                            lastMessageAuthor: lastMessageSenderName,
                            chat: chat,
                            client: client))),
            icon: pinned
                ? Icon(Icons.push_pin,
                    color:
                        ClientTheme.currentTheme.getField("ChatPinIconColor"))
                : null));
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
      var time =
          DateTime.fromMillisecondsSinceEpoch(chat.lastMessage!.date! * 1000);

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
        return getHHMM(time, useUSAStyle);
      } else if (deltaInDays <= 7 && time.weekday < now.weekday) {
        return "${client.getTranslation("lng_weekday${time.weekday}")} (${getHHMM(time, useUSAStyle)})";
      }

      return "${validateDataComponent(time.day.toString())}.${validateDataComponent(time.month.toString())}.${time.year}";
    }
    return "";
  }

  //TODO show it in settings
  bool useUSAStyle = true;
}
