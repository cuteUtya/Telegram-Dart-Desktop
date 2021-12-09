import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_last_message_content.dart';
import 'package:myapp/Widgets/Userpic/chat_photo_display.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_title.dart';
import 'package:myapp/Widgets/online_indicator_display.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;

class ChatItemDisplay extends StatelessWidget {
  const ChatItemDisplay(
      {Key? key,
      required this.chat,
      required this.client,
      required this.interlocutor,
      required this.supergroup})
      : super(key: key);
  final Chat chat;
  final User? interlocutor;
  final Supergroup? supergroup;
  final TelegramClient client;
  Widget build(BuildContext context) {
    return Container(
        color: ClientTheme.currentTheme.getField("ChatUnselectedColor"),
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
                            child:
                                ChatPhotoDisplay(chat: chat, client: client)),
                        Container(
                            margin: const EdgeInsets.only(left: 44, top: 44),
                            height: 20,
                            width: 20,
                            alignment: Alignment.bottomRight,
                            child: OnlineIndicatorDidplay(online: isOnline))
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
                                    padding: const EdgeInsets.only(right: 40),
                                    child: ChatItemLastMessageContent(
                                        chat: chat, client: client),
                                  )),
                              //TODO not just positions[0]
                              chat.positions![0].isPinned!
                                  ? Expanded(
                                      child: Container(
                                          child: Icon(Icons.push_pin,
                                              color: ClientTheme.currentTheme
                                                  .getField(
                                                      "ChatPinIconColor")),
                                          alignment: Alignment.centerRight))
                                  : SizedBox.shrink(),
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
                    ]))));
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
