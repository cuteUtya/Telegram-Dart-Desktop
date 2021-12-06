import 'package:flutter/material.dart';
import 'package:myapp/Widgets/left%20panel/userpic_empty.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'dart:io' as io;

import 'package:myapp/utils.dart';

class ChatPhotoDisplay extends StatelessWidget {
  const ChatPhotoDisplay(
      {Key? key, required this.chat, required this.client, this.useBig = false})
      : super(key: key);
  final Chat chat;
  final TelegramClient client;
  final bool useBig;

  @override
  Widget build(BuildContext context) {
    if (chat.photo == null) {
      return UserpicEmpty(
          chatId: chat.id!, displayLetters: getPeerNameLetters());
    }

    return FutureBuilder(
        builder: (context, data) {
          if (data.hasData) {
            return Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: FileImage(
                            io.File((data.data as File).local!.path!)))));
          }
          return UserpicEmpty(
              chatId: chat.id!, displayLetters: getPeerNameLetters());
        },
        future: client.send(DownloadFile(
            fileId: useBig ? chat.photo!.big!.id : chat.photo!.small!.id,
            priority: 3)));
  }

  String getPeerNameLetters() {
    var emojis = extractEmojisAsList(chat.title!);
    if (emojis.isNotEmpty) {
      if (emojis.length > 2) emojis.removeRange(2, emojis.length);
      return emojis.join();
    }
    var words = chat.title!.split(" ");
    var result = "";
    for (int i = 0; i < words.length && i < 2; i++) {
      if (words[i].isNotEmpty) result += words[i][0];
    }
    return result.toUpperCase();
  }
}
