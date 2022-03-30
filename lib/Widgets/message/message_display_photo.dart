import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/blur_image_preview.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/message_display_media.dart';
import 'package:myapp/Widgets/message/message_display_text.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_base.dart';
import 'package:myapp/Widgets/remote_file_builder_progress.dart';
import 'package:myapp/Widgets/widget_hider.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart' hide Text;
import 'package:myapp/utils.dart';
import 'dart:io' as io;
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

    var width = min(photoSize.width!.toDouble(), 400.0);
    var height = (photoSize.height! / (photoSize.width! / width));
    var blurImage = photo.photo?.minithumbnail?.data != null
        ? BlurImagePreview(
            image: MemoryImage(
              base64.decode(
                photo.photo!.minithumbnail!.data!,
              ),
            ),
            width: width,
            height: height,
          )
        : Container(
            width: width,
            height: height,
            color: Colors.white,
          );

    return Container(
      width: width,
      margin: EdgeInsets.all(p(1)),
      child: MessageDisplayMedia(
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
        content: RemoteFileBuilderProgress(
          client: client,
          downloadStep: 65000,
          fileId: photoSize.photo!.id!,
          builder: (_, progress, path) {
            if (path == null || progress != 1) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  blurImage,
                  MessageInfoBubbleBase(
                    padding: const EdgeInsets.all(8),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${(progress * 100).toInt()}%",
                          style: TextDisplay.create(
                            size: 16,
                            textColor: Colors.white,
                            fontFamily: TextDisplay.greaterImportance,
                          ),
                        ),
                        SizedBox(
                          height: p(2),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              p(2),
                            ),
                          ),
                          child: SizedBox(
                            width: width * 0.33,
                            height: p(8),
                            child: LinearProgressIndicator(
                              color: Colors.white,
                              backgroundColor:
                                  Color(0x2A1515).withOpacity(0.24),
                              value: progress,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
            return Align(
              alignment: message.isOutgoing!
                  ? Alignment.bottomRight
                  : Alignment.bottomLeft,
              child: SizedBox(
                width: width,
                height: height,
                child: Image.file(
                  io.File(path),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
