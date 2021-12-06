import 'package:flutter/material.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_last_message_content.dart';
import 'package:myapp/Widgets/left%20panel/chat_photo_display.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;

class ChatItemDisplay extends StatelessWidget {
  const ChatItemDisplay({Key? key, required this.chat, required this.client})
      : super(key: key);
  final Chat chat;
  final TelegramClient client;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 88,
        child: Padding(
            padding: const EdgeInsets.only(right: 12, left: 12),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              //user pic
              SizedBox(
                  height: 64,
                  width: 64,
                  child: ChatPhotoDisplay(chat: chat, client: client)),
              const SizedBox(width: 16),
              Flexible(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const SizedBox(height: 8),
                    Expanded(
                        child: Stack(children: [
                      Text(chat.title!,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                          style: TextDisplay.chatTittle),
                      Container(
                          margin: const EdgeInsets.only(top: 26),
                          child: Padding(
                              padding: const EdgeInsets.only(right: 40),
                              child: ChatItemLastMessageContent(
                                  chat: chat, client: client))),
                      Row(children: [
                        const Spacer(),
                        Text(getMessageTime(),
                            style: TextDisplay.create(
                                size: 18,
                                textColor: TextColor.ChatLastTimeMessage))
                      ])
                    ])),
                  ]))
            ])));
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
