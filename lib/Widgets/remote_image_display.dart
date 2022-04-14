import 'dart:convert';
import 'dart:io' as io;
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/blur_image_preview.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_base.dart';
import 'package:myapp/Widgets/remote_file_builder_progress.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart' hide Text;
import 'package:myapp/utils.dart';

class RemoteImageDisplay extends StatefulWidget {
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
  State<RemoteImageDisplay> createState() => _RemoteImageDisplayState();
}

class _RemoteImageDisplayState extends State<RemoteImageDisplay> {
  late PhotoSize photoSize = sortPhotoSizes(widget.photo.photo!.sizes!)[0];

  Widget _build(io.File imageFile) {
    return LayoutBuilder(
      builder: (_, box) {
        if (photoSize.width != null && photoSize.height != null) {
          var placeholderRatio = box.maxHeight / box.maxWidth;
          var ratio = photoSize.height! / photoSize.width!;

          int w = 0;
          int h = 0;

          //TODO idk why images looks bad without this magic multyplier
          const double multyplier = 1.15;

          if (placeholderRatio > ratio && box.maxHeight != double.infinity) {
            h = (box.maxHeight *
                    MediaQuery.of(context).devicePixelRatio *
                    multyplier)
                .toInt();
            w = (h * (photoSize.width! / photoSize.height!)).toInt();
          } else {
            w = (box.maxWidth *
                    MediaQuery.of(context).devicePixelRatio *
                    multyplier)
                .toInt();
            h = (w * ratio).toInt();
          }

          w = min(w, photoSize.width!);
          h = min(h, photoSize.height!);

          return Image.file(
            imageFile,
            fit: widget.fit,
            width: widget.width,
            height: widget.height,
            cacheWidth: w,
            cacheHeight: h,
            filterQuality: FilterQuality.medium,
          );
        }
        return const SizedBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var blurImage = widget.photo.photo?.minithumbnail?.data != null
        ? FittedBox(
            fit: widget.fit,
            child: SizedBox(
              width: photoSize.width!.toDouble(),
              height: photoSize.height!.toDouble(),
              child: BlurImagePreview(
                image: MemoryImage(
                  base64.decode(
                    widget.photo.photo!.minithumbnail!.data!,
                  ),
                ),
                width: widget.width,
                height: widget.height,
              ),
            ))
        : Container(
            width: widget.width,
            height: widget.height,
            color: Colors.white,
          );

    return RemoteFileBuilderProgress(
      client: widget.client,
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
                        width: (widget.width ?? 200) * 0.33,
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

        var imageFile = io.File(path);
        return _build(imageFile);
      },
    );
  }
}
