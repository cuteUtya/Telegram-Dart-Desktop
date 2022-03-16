import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/Widgets/blur_image_preview.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/message_display_media.dart';
import 'package:myapp/Widgets/message/message_display_text.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_base.dart';
import 'package:myapp/Widgets/remote_file_builder_progress.dart';
import 'package:myapp/Widgets/widget_hider.dart';
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
    this.senderName,
    this.adminTitle,
    this.infoWidget,
    this.replieWidget,
  }) : super(key: key);

  final TelegramClient client;
  final Message message;
  final EdgeInsets contentPadding;
  final String? senderName;
  final String? adminTitle;
  final Widget? infoWidget;
  final Widget? replieWidget;

  @override
  Widget build(BuildContext context) {
    assert(message.content is MessagePhoto);
    var photo = message.content as MessagePhoto;
    var photoSize = sortPhotoSizes(photo.photo!.sizes!)[0];
    bool haveText = (photo.caption?.text ?? "").isNotEmpty;
    var radius = ClientTheme.currentTheme.getField("BubbleBorderRadiusFree");
    var radiusSmall = ClientTheme.currentTheme.getField("MediaWithoutTextBorderRadius");
    BorderRadius border = haveText
        ? BorderRadius.vertical(
            top: Radius.circular(replieWidget == null ? radiusSmall : radius),
            bottom: Radius.circular(radiusSmall),
          )
        : BorderRadius.all(
            Radius.circular(radiusSmall),
          );

    return LayoutBuilder(
      builder: (_, box) {
        var width = max(
          100,
          min(
            box.maxWidth,
            photoSize.width!.toDouble(),
          ),
        ).toDouble();
        var height = (photoSize.height! / (photoSize.width! / width));
        var blurImage = BlurImagePreview(
          image: MemoryImage(
            base64.decode(
              photo.photo!.minithumbnail!.data!,
            ),
          ),
          width: width,
          height: height,
        );
        return MessageDisplayMedia(
          client: client,
          message: message,
          senderName: senderName,
          infoWidget: infoWidget,
          contentWidth: width,
          adminTitle: adminTitle,
          captionMargin: contentPadding,
          caption: photo.caption,
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
                          const SizedBox(
                            height: 4,
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                4,
                              ),
                            ),
                            child: SizedBox(
                              width: width * 0.33,
                              height: 12,
                              child: LinearProgressIndicator(
                                color: Colors.white,
                                backgroundColor: Color(0x2A1515).withOpacity(0.24),
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
                alignment: message.isOutgoing! ? Alignment.bottomRight : Alignment.bottomLeft,
                child: ClipRRect(
                  borderRadius: border,
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: Image.file(
                      io.File(path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
