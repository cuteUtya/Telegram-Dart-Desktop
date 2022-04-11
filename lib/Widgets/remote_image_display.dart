import 'dart:convert';
import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:myapp/Widgets/blur_image_preview.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_base.dart';
import 'package:myapp/Widgets/remote_file_builder_progress.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart' hide Text;
import 'package:myapp/utils.dart';

class RemoteImageDisplay extends StatelessWidget {
  const RemoteImageDisplay({
    Key? key,
    required this.client,
    required this.photo,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  final TelegramClient client;
  final MessagePhoto photo;
  final BoxFit fit;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    var photoSize = sortPhotoSizes(photo.photo!.sizes!)[0];

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

    return RemoteFileBuilderProgress(
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
                        width: (width ?? 200) * 0.33,
                        height: p(8),
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
        return Image.file(
          io.File(path),
          fit: fit,
          width: width,
          height: height,
        );
      },
    );
  }
}
