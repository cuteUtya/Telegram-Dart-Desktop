import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
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
      required this.lastMessageSender})
      : super(key: key);
  final Chat chat;
  final User? interlocutor;
  final Supergroup? supergroup;
  final List<User>? addedInChatMembers;
  final String lastMessageSender;
  final TelegramClient client;

  @override
  State<StatefulWidget> createState() => _ChatItemDisplayState();
}

class _ChatItemDisplayState extends State<ChatItemDisplay> {
  bool mouseOver = false;

  Color get containerColor => ClientTheme.currentTheme
      .getField(mouseOver ? "ChatSelectedColor" : "ChatUnselectedColor");

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) => setState(() => mouseOver = true),
        onExit: (_) => setState(() => mouseOver = false),
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12))
                /*borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12))*/
                ,
                color: containerColor),
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
                                    chat: widget.chat, client: widget.client)),
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
                                          title: widget.chat.title!,
                                          isScam: isScam,
                                          isVerifed: isVerifed)),
                                  Container(
                                      margin: const EdgeInsets.only(top: 26),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 40),
                                        child: ChatItemLastMessageContent(
                                            lastMessageAuthor:
                                                widget.lastMessageSender,
                                            addedInChatUsers:
                                                widget.addedInChatMembers,
                                            chat: widget.chat,
                                            client: widget.client),
                                      )),
                                  //TODO not just positions[0]
                                  widget.chat.positions![0].isPinned!
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
    if (widget.chat.lastMessage != null) {
      var time = DateTime.fromMillisecondsSinceEpoch(
          widget.chat.lastMessage!.date! * 1000);
      var minutes = time.minute.toString();
      var hours = time.hour.toString();

      if (minutes.length <= 1) minutes = "0$minutes";
      if (hours.length <= 1) hours = "0$hours";

      return "$hours:$minutes";
    }
    return "";
  }
}
