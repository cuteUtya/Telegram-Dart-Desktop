import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Userpic/userpic_empty.dart';
import 'package:myapp/Widgets/file_image_display.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';

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
      return emptyUserpic();
    }

    return FileImageDisplay(
        containerShape: BoxShape.circle,
        client: client,
        id: useBig ? chat.photo!.big!.id! : chat.photo!.small!.id!,
        emptyReplacer: emptyUserpic());
  }

  Widget emptyUserpic() =>
      UserpicEmpty(chatId: chat.id!, displayLetters: getPeerNameLetters());

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
