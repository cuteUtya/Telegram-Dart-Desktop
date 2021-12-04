import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_last_message_content.dart';
import 'package:myapp/Widgets/left%20panel/chat_photo_display.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;

class ChatItemDisplay extends StatefulWidget {
  const ChatItemDisplay(
      {Key? key, required this.id, required this.client, required this.order})
      : super(key: key);
  final int id;
  final TelegramClient client;
  final int order;

  @override
  State<ChatItemDisplay> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItemDisplay> {
  @override
  void initState() {
    Map<Stream, bool Function(TdObject)> map = {};

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
    super.initState();
  }

  Chat? chatObject;
  @override
  Widget build(BuildContext context) {
    if (chatObject != null) {
      return Padding(
          padding: EdgeInsets.only(top: (widget.order * 88).toDouble()),
          child: SizedBox(
              height: 88,
              child: Padding(
                  padding: EdgeInsets.only(right: 12, left: 12),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //user pic
                        SizedBox(
                            height: 64,
                            width: 64,
                            child: chatObject!.photo == null
                                ? Container(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.lightBlue))
                                : ChatPhotoDisplay(
                                    info: chatObject!.photo!,
                                    client: widget.client)),
                        const SizedBox(width: 16),
                        Flexible(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              const SizedBox(height: 8),
                              Expanded(
                                  child: Stack(children: [
                                Text(chatObject!.title!,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.left,
                                    style: TextDisplay.chatTittle),
                                Container(
                                    margin: const EdgeInsets.only(top: 26),
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 40),
                                        child: ChatItemLastMessageContent(
                                            chat: chatObject!,
                                            client: widget.client))),
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
    widget.client
        .send(GetChat(chatId: widget.id))
        .then((c) => chatObject = c as Chat);
    return const Center();
  }

  String getMessageTime() {
    if (chatObject!.lastMessage != null) {
      var time = DateTime.fromMillisecondsSinceEpoch(
          chatObject!.lastMessage!.date! * 1000);
      var minutes = time.minute.toString();
      var hours = time.hour.toString();

      if (minutes.length <= 1) minutes = "0$minutes";
      if (hours.length <= 1) hours = "0$hours";

      return "$hours:$minutes";
    }
    return "";
  }
}
