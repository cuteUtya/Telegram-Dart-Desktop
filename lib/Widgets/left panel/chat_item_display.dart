import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_last_message_content.dart';
import 'package:myapp/Widgets/Userpic/chat_photo_display.dart';
import 'package:myapp/Widgets/online_indicator_display.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;

class ChatItemDisplay extends StatelessWidget {
  const ChatItemDisplay(
      {Key? key,
      required this.chat,
      required this.client,
      required this.interlocutor})
      : super(key: key);
  final Chat chat;
  final User? interlocutor;
  final TelegramClient client;
  @override
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
                            child: OnlineIndicatorDidplay(
                                online:
                                    (interlocutor?.status is UserStatusOnline &&
                                        interlocutor?.type is UserTypeRegular)))
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
                                  child: Text(chat.title!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextDisplay.chatTittle)),
                              Container(
                                  margin: const EdgeInsets.only(top: 26),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 40),
                                    child: ChatItemLastMessageContent(
                                        chat: chat, client: client),
                                  )),
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
