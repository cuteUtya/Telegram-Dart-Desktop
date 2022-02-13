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
    required this.userId,
    required this.userTitle,
    required this.client,
    this.useBig = false,
  }) : super(key: key);

  final ChatPhotoInfo? chatPhotoInfo;
  final ChatPhoto? chatPhoto;
  final ProfilePhoto? profilePhoto;
  final BoxShape shape;
  final String userTitle;
  final int userId;
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
      borderRadius: const BorderRadius.all(Radius.circular(40)),
      client: client,
      id: photo!.id!,
      emptyReplacer: emptyUserpic(),
    );
  }

  Widget emptyUserpic() => LayoutBuilder(
        builder: (_, box) => UserpicEmpty(
          chatId: userId,
          displayLetters: getPeerNameLetters(),
          fontSize: box.maxWidth * 0.4,
        ),
      );

  String getPeerNameLetters() {
    var emojis = extractEmojisAsList(userTitle);
    if (emojis.isNotEmpty) {
      if (emojis.length > 2) emojis.removeRange(2, emojis.length);
      return emojis.join();
    }
    var words = userTitle.split(" ");
    var result = "";
    for (int i = 0; i < words.length && i < 2; i++) {
      if (words[i].isNotEmpty) result += words[i][0];
    }
    return result.toUpperCase();
  }
}
