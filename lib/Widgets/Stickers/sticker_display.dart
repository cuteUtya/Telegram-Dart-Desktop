import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Stickers/sticker_outnline.dart';
import 'package:myapp/Widgets/remote_file_builder.dart';
import 'package:myapp/Widgets/widget_hider.dart';
import 'package:myapp/rlottie/rlottie.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'dart:io' as io;

import 'package:myapp/widget_sizer.dart';

/// UI representation of [MessageSticker]
class StickerDisplay extends StatelessWidget {
  const StickerDisplay({
    Key? key,
    required this.client,
    required this.sticker,
    this.width,
    this.height,
    this.alignment = Alignment.center,
  }) : super(key: key);
  final double? width;
  final double? height;
  final Sticker sticker;
  final Alignment alignment;
  final TelegramClient client;

  static const stickerSizeRatie = 0.5;

  @override
  Widget build(BuildContext context) {
    var width = (sticker.width ?? sticker.width!).toDouble() * stickerSizeRatie;
    var height =
        (sticker.height ?? sticker.height!).toDouble() * stickerSizeRatie;
    return RemoteFileBuilder(
        emptyPlaceholder: sticker.outline == null
            ? const SizedBox.shrink()
            : CustomPaint(
                painter: StickerOutline(
                  sticker.outline!,
                  stickerSizeRatie,
                ),
                child: SizedBox(
                  width: width,
                  height: height,
                )),
        builder: (_, path) {
          return sticker.isAnimated!
              ? Rlottie.file(path: path, behavior: PlayBehavior.loop)
              : Image.file(io.File(path));
        },
        fileId: sticker.sticker!.id!,
        client: client);
  }
}
