import 'package:flutter/material.dart';
import 'package:myapp/Widgets/message/message_display_media.dart';
import 'package:myapp/Widgets/remote_image_display.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart' hide Text;
import 'package:myapp/utils.dart';
import 'dart:math';

class MessageDisplayPhoto extends StatelessWidget {
  const MessageDisplayPhoto({
    Key? key,
    required this.client,
    required this.message,
    required this.contentPadding,
    required this.bubbleBorderRadius,
    this.senderName,
    this.adminTitle,
    this.infoWidget,
    this.replieWidget,
  }) : super(key: key);

  final TelegramClient client;
  final Message message;
  final EdgeInsets contentPadding;
  final BorderRadius bubbleBorderRadius;
  final String? senderName;
  final String? adminTitle;
  final Widget? infoWidget;
  final Widget? replieWidget;

  @override
  Widget build(BuildContext context) {
    assert(message.content is MessagePhoto);
    var photo = message.content as MessagePhoto;
    var photoSize = sortPhotoSizes(photo.photo!.sizes!)[0];

    return LayoutBuilder(
      builder: (_, box) {
        var width = min(photoSize.width!.toDouble(), box.maxWidth - 10);
        return Padding(
          padding: EdgeInsets.all(p(1)),
          child: MessageDisplayMedia(
            forceToTextMessage: true,
            client: client,
            message: message,
            senderName: senderName,
            infoWidget: infoWidget,
            contentWidth: width,
            adminTitle: adminTitle,
            captionMargin: contentPadding,
            replieWidget: replieWidget,
            caption: photo.caption,
            borderRadius: bubbleBorderRadius,
            content: RemoteImageDisplay(
              client: client,
              photo: photo,
              width: width,
            ),
          ),
        );
      },
    );
  }
}
