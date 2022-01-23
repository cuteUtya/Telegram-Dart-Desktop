import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Userpic/userpic_empty.dart';
import 'package:myapp/Widgets/file_image_display.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';

import 'package:myapp/utils.dart';

class Userpic extends StatelessWidget {
  const Userpic({
    Key? key,
    this.chatPhotoInfo,
    this.profilePhoto,
    this.chatPhoto,
    this.shape = BoxShape.circle,
    this.emptyUserpicFontSize,
    required this.chatId,
    required this.chatTitle,
    required this.client,
    this.useBig = false,
  }) : super(key: key);

  final ChatPhotoInfo? chatPhotoInfo;
  final ChatPhoto? chatPhoto;
  final ProfilePhoto? profilePhoto;
  final BoxShape shape;
  final double? emptyUserpicFontSize;
  final String chatTitle;
  final int chatId;
  final TelegramClient client;
  final bool useBig;

  @override
  Widget build(BuildContext context) {
    if (chatPhotoInfo == null && profilePhoto == null && chatPhoto == null) {
      return emptyUserpic();
    }

    File? photo;

    if (chatPhoto != null) {
      photo = sortPhotoSizes(chatPhoto!.sizes!)[0].photo!;
    } else if (chatPhotoInfo != null) {
      photo = (useBig ? chatPhotoInfo!.big! : chatPhotoInfo!.small!);
    } else if (profilePhoto != null) {
      photo = useBig ? profilePhoto!.big! : profilePhoto!.small!;
    }

    assert(photo != null);

    //TODO if profilePhoto has animations animate photo on mouse hover
    return FileImageDisplay(
      containerShape: shape,
      client: client,
      id: photo!.id!,
      emptyReplacer: emptyUserpic(),
    );
  }

  Widget emptyUserpic() => UserpicEmpty(
        chatId: chatId,
        displayLetters: getPeerNameLetters(),
        fontSize: emptyUserpicFontSize,
      );

  String getPeerNameLetters() {
    var emojis = extractEmojisAsList(chatTitle);
    if (emojis.isNotEmpty) {
      if (emojis.length > 2) emojis.removeRange(2, emojis.length);
      return emojis.join();
    }
    var words = chatTitle.split(" ");
    var result = "";
    for (int i = 0; i < words.length && i < 2; i++) {
      if (words[i].isNotEmpty) result += words[i][0];
    }
    return result.toUpperCase();
  }
}
