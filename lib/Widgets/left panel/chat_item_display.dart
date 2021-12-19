import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/check_mark.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/horizontal_separator_line.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_action_display.dart';
import 'package:myapp/Widgets/left%20panel/chat_item.content_display.dart/chat_item_last_message_content.dart';
import 'package:myapp/Widgets/Userpic/chat_photo_display.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_title.dart';
import 'package:myapp/Widgets/left%20panel/chat_list.dart';
import 'package:myapp/Widgets/left%20panel/chat_lists_manager.dart';
import 'package:myapp/Widgets/online_indicator_display.dart';
import 'package:myapp/Widgets/unread_mention_bubble.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;
import 'package:myapp/utils.dart';

class ChatItemDisplay extends StatefulWidget {
  const ChatItemDisplay(
      {Key? key,
      required this.chat,
      required this.client,
      required this.interlocutor,
      required this.supergroup,
      required this.joinInfo,
      required this.lastMessageSenderName,
      required this.order,
      required this.chatList})
      : super(key: key);
  final Chat chat;
  final User? interlocutor;
  final Supergroup? supergroup;
  final UsersJoinedGroupInfo? joinInfo;
  final String lastMessageSenderName;
  final TelegramClient client;
  final ChatList chatList;
  final int order;

  @override
  State<StatefulWidget> createState() => ChatItemDisplayState();
}

class ChatItemDisplayState extends State<ChatItemDisplay> {
  static const bool USE_HORIZONTAL_SEPARATOR = true;

  late bool shouldDraw = true;
  late int order = widget.order;
  late Chat chat = widget.chat;
  late String lastMessageSenderName = widget.lastMessageSenderName;
  late UsersJoinedGroupInfo? joinInfo = widget.joinInfo;
  late User? interlocutor = widget.interlocutor;
  ChatActionInfo chatAction =
      ChatActionInfo(action: ChatActionCancel(), who: User());

  bool _mouseOver = false;

  Color get containerColor => ClientTheme.currentTheme
      .getField(_mouseOver ? "ChatSelectedColor" : "ChatUnselectedColor");

  void reOrder(int newOrder) => setState(() => order = newOrder);
  void updateChatInfo(Chat newChat) => setState(() => chat = newChat);
  void updateLastMessageSenderName(String newLastName) =>
      setState(() => lastMessageSenderName = newLastName);
  void updateJoinInfo(UsersJoinedGroupInfo? newjoinInfo) =>
      setState(() => joinInfo = newjoinInfo);
  void updateInterlocutor(User? newUser) =>
      setState(() => interlocutor = newUser);
  void updateChatAction(ChatActionInfo newChatAction) =>
      setState(() => chatAction = newChatAction);
  void updateShouldDrawOption(bool value) => setState(() => shouldDraw = value);

  bool get pinned =>
      chat.positions
          ?.firstWhere(
              (element) => compareChatlists(element.list!, widget.chatList))
          .isPinned ??
      false;
  //double get margin => order * 88;

  @override
  Widget build(BuildContext context) {
    /*  if (!shouldDraw) {
      _mouseOver = false;
      return Container(height: 88, margin: EdgeInsets.only(top: margin));
    }*/

    return AnimatedContainer(
        curve: Curves.decelerate,
        //margin: EdgeInsets.only(top: margin),
        duration: const Duration(milliseconds: 400),
        color: containerColor,
        child: MouseRegion(
          onEnter: (_) => setState(() => _mouseOver = true),
          onExit: (_) => setState(() => _mouseOver = false),
          child: Column(children: [
            USE_HORIZONTAL_SEPARATOR
                ? const SeparatorLine()
                : const SizedBox.shrink(),
            SizedBox(
                height: 88,
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(children: [
                      _buildAva(),
                      const SizedBox(width: 16),
                      Flexible(
                          child: Column(children: [
                        _buildStatePanel(),
                        const SizedBox(height: 2),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildMessageContent(),
                              Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  child: Row(children: [
                                    UnreadCountBubble(
                                        count: chat.unreadCount ?? 0),
                                    pinned
                                        ? Icon(Icons.push_pin,
                                            color: ClientTheme.currentTheme
                                                .getField("ChatPinIconColor"))
                                        : const SizedBox.shrink()
                                  ]))
                            ])
                      ]))
                    ]))),
            USE_HORIZONTAL_SEPARATOR
                ? const SeparatorLine()
                : const SizedBox.shrink(),
          ]),
        ));
  }

  Widget _buildAva() {
    return Stack(children: [
      Stack(alignment: Alignment.bottomRight, children: [
        SizedBox(
            height: 64,
            width: 64,
            child: ChatPhotoDisplay(
                photo: chat.photo,
                chatId: chat.id!,
                chatTitle: chat.title!,
                client: widget.client)),
        OnlineIndicatorDidplay(
            heigth: 20,
            width: 20,
            online: isOnline,
            aroundOnlineColor: containerColor)
      ]),
      UnreadCountBubble(
          count: chat.unreadMentionCount ?? 0,
          color:
              ClientTheme.currentTheme.getField("UnreadMentionChatBubbleColor"))
    ]);
  }

  Widget _buildStatePanel() {
    return Row(children: [
      Expanded(
          child: ChatItemTitle(
              title: (widget.interlocutor?.type is UserTypeDeleted)
                  ? widget.client.getTranslation("lng_deleted")
                  : chat.title!,
              isScam: isScam,
              isVerifed: isVerifed)),
      (chat.lastMessage?.isOutgoing ?? false) && chat.draftMessage == null
          ? CheckMark(
              isReaded: (chat.lastMessage?.id ?? 0) <=
                  (chat.lastReadOutboxMessageId ?? 0))
          : const SizedBox.shrink(),
      const SizedBox(width: 2),
      Text(getMessageTime(),
          textAlign: TextAlign.right,
          style: TextDisplay.create(
              size: 18, textColor: TextColor.ChatLastTimeMessage))
    ]);
  }

  Widget _buildMessageContent() {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: chatAction.action is! ChatActionCancel
                ? ChatItemActionDisplay(
                    isPrivate: interlocutor != null,
                    chatid: chat.id!,
                    client: widget.client,
                    action: chatAction)
                : ChatItemLastMessageContent(
                    joinInfo: joinInfo,
                    lastMessageAuthor: lastMessageSenderName,
                    chat: chat,
                    client: widget.client)));
  }

  bool get isOnline {
    if (widget.interlocutor != null) {
      if (widget.interlocutor!.type is! UserTypeRegular) return false;
      return widget.interlocutor!.status is UserStatusOnline;
    }
    return false;
  }

  bool get isScam {
    if (widget.supergroup?.isScam ?? false) return true;
    if (widget.interlocutor?.isScam ?? false) return true;

    return false;
  }

  bool get isVerifed {
    if (widget.supergroup?.isVerified ?? false) return true;
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
        return "${widget.client.getTranslation("lng_weekday${time.weekday}")} (${getHHMM(time, useUSAStyle)})";
      }

      return "${validateDataComponent(time.day.toString())}.${validateDataComponent(time.month.toString())}.${time.year}";
    }
    return "";
  }

  //TODO show it in settings
  bool useUSAStyle = true;
}
