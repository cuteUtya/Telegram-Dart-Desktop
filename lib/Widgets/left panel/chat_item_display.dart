import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/clickable_object.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_last_message_content.dart';
import 'package:myapp/Widgets/Userpic/chat_photo_display.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_title.dart';
import 'package:myapp/Widgets/online_indicator_display.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;

class ChatItemDisplay extends StatefulWidget {
  const ChatItemDisplay(
      {Key? key,
      required this.chat,
      required this.client,
      required this.interlocutor,
      required this.supergroup,
      required this.addedInChatMembers,
      required this.lastMessageSenderName,
      required this.order})
      : super(key: key);
  final Chat chat;
  final User? interlocutor;
  final Supergroup? supergroup;
  final List<User>? addedInChatMembers;
  final String lastMessageSenderName;
  final TelegramClient client;
  final int order;

  @override
  State<StatefulWidget> createState() => ChatItemDisplayState();
}

class ChatItemDisplayState extends State<ChatItemDisplay> {
  late int order = widget.order;
  late Chat chat = widget.chat;
  late String lastMessageSenderName = widget.lastMessageSenderName;
  bool _mouseOver = false;

  Color get containerColor => ClientTheme.currentTheme
      .getField(_mouseOver ? "ChatSelectedColor" : "ChatUnselectedColor");

  void reOrder(int newOrder) => setState(() => order = newOrder);
  void updateChatInfo(Chat newChat) => setState(() => chat = newChat);
  void updateLastMessageSenderName(String newLastName) =>
      setState(() => lastMessageSenderName = newLastName);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        curve: Curves.decelerate /*Curves.elasticOut*/,
        margin: EdgeInsets.only(top: order * 88),
        duration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12))
            /*borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12))*/
            ,
            color: containerColor),
        child: MouseRegion(
            onEnter: (_) => setState(() => _mouseOver = true),
            onExit: (_) => setState(() => _mouseOver = false),
            child: SizedBox(
                height: 88,
                child: Padding(
                    padding: const EdgeInsets.only(right: 12, left: 12),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //user pic
                          Stack(children: [
                            SizedBox(
                                height: 64,
                                width: 64,
                                child: ChatPhotoDisplay(
                                    chat: chat, client: widget.client)),
                            Container(
                                margin:
                                    const EdgeInsets.only(left: 44, top: 44),
                                height: 20,
                                width: 20,
                                alignment: Alignment.bottomRight,
                                child: OnlineIndicatorDidplay(
                                    online: isOnline,
                                    aroundOnlineColor: containerColor))
                          ]),
                          const SizedBox(width: 16),
                          Flexible(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                const SizedBox(height: 8),
                                Expanded(
                                    child: Stack(children: [
                                  Padding(
                                      padding: const EdgeInsets.only(right: 60),
                                      child: ChatItemTitle(
                                          title: chat.title!,
                                          isScam: isScam,
                                          isVerifed: isVerifed)),
                                  Container(
                                      margin: const EdgeInsets.only(top: 26),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 40),
                                        child: ChatItemLastMessageContent(
                                            lastMessageAuthor:
                                                lastMessageSenderName,
                                            addedInChatUsers:
                                                widget.addedInChatMembers,
                                            chat: chat,
                                            client: widget.client),
                                      )),
                                  //TODO not just positions[0]
                                  chat.positions![0].isPinned!
                                      ? Container(
                                          child: Icon(Icons.push_pin,
                                              color: ClientTheme.currentTheme
                                                  .getField(
                                                      "ChatPinIconColor")),
                                          alignment: Alignment.centerRight)
                                      : const SizedBox.shrink(),
                                  Row(children: [
                                    const Spacer(),
                                    Text(getMessageTime(),
                                        style: TextDisplay.create(
                                            size: 18,
                                            textColor:
                                                TextColor.ChatLastTimeMessage))
                                  ])
                                ])),
                              ]))
                        ])))));
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
      var minutes = time.minute.toString();
      var hours = time.hour.toString();

      if (minutes.length <= 1) minutes = "0$minutes";
      if (hours.length <= 1) hours = "0$hours";

      return "$hours:$minutes";
    }
    return "";
  }
}
