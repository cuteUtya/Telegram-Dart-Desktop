import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_last_message_content.dart';
import 'package:myapp/Widgets/left%20panel/chat_photo_display.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;

class ChatItemDisplay extends StatefulWidget {
  ChatItemDisplay({Key? key, required this.id, required this.client})
      : super(key: key);
  late int id;
  final TelegramClient client;

  @override
  State<ChatItemDisplay> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItemDisplay> {
  bool isInit = false;
  void subcribeOnUpdates() {
    Map<Stream, bool Function(TdObject)> map = {
      widget.client.updateChatLastMessage: (event) =>
          (event as UpdateChatLastMessage).chatId! == widget.id
    };

    map.forEach((key, value) {
      key.listen((event) {
        var predicate = value;
        if (predicate(event)) {
          widget.client.send(GetChat(chatId: widget.id)).then((c) {
            if (mounted) setState(() => chatObject = c as Chat);
          });
        }
      });
    });
  }

  Chat? chatObject;
  @override
  Widget build(BuildContext context) {
    if (!isInit) {
      isInit = true;
      subcribeOnUpdates();
    }
    if (chatObject != null) {
      return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: SizedBox(
              height: 88,
              child: Row(children: [
                const SizedBox(width: 12),
                //user pic
                SizedBox(
                    height: 64,
                    width: 64,
                    child: chatObject!.photo == null
                        ? const Center()
                        : ChatPhotoDisplay(
                            info: chatObject!.photo!, client: widget.client)),
                const SizedBox(width: 16),
                Flexible(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      const SizedBox(height: 12),
                      Row(children: [
                        Text(chatObject!.title!,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.left,
                            style: TextDisplay.chatTittle),
                        const Spacer(),
                        Text(getMessageTime()),
                        const SizedBox(width: 12)
                      ]),
                      ChatItemLastMessageContent(
                          chat: chatObject!, client: widget.client)
                    ]))
              ])));
    }
    widget.client
        .send(GetChat(chatId: widget.id))
        .then((c) => chatObject = c as Chat);
    return Center();
  }

  String getMessageTime() {
    var time = DateTime.fromMillisecondsSinceEpoch(
        chatObject!.lastMessage!.date! * 1000);
    var minutes = time.minute.toString();
    var hours = time.hour.toString();

    if (minutes.length <= 1) minutes = "0$minutes";
    if (hours.length <= 1) hours = "0$hours";

    return "$hours:$minutes";
  }
}
