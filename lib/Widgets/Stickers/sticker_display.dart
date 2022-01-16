import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Stickers/sticker_outnline.dart';
import 'package:myapp/Widgets/remote_file_builder.dart';
import 'package:myapp/rlottie/rlottie.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'dart:io' as io;

/// UI representation of [MessageSticker]
class StickerDisplay extends StatelessWidget {
  const StickerDisplay({
    Key? key,
    required this.client,
    required this.sticker,
    this.onClick,
    this.playBehavior = PlayBehavior.loop,
    this.size = 1.0,
    this.alignment = Alignment.center,
  }) : super(key: key);
  final double size;
  final Sticker sticker;
  final PlayBehavior playBehavior;
  final Function()? onClick;
  final Alignment alignment;
  final TelegramClient client;

  static const stickerSizeRatie = 0.5;

  @override
  Widget build(BuildContext context) {
    var width = (sticker.width ?? sticker.width!).toDouble() *
        (stickerSizeRatie * size);
    var height = (sticker.height ?? sticker.height!).toDouble() *
        (stickerSizeRatie * size);
    return SizedBox(
        height: height,
        width: width,
        child: RemoteFileBuilder(
            emptyPlaceholder: sticker.outline == null
                ? const SizedBox.shrink()
                : CustomPaint(
                    painter: StickerOutline(
                      sticker.outline!,
                      stickerSizeRatie * size,
                    ),
                    child: SizedBox(
                      width: width,
                      height: height,
                    )),
            builder: (_, path) {
              return sticker.isAnimated!
                  ? Rlottie.file(
                      path: path,
                      behavior: playBehavior,
                      onClick: onClick,
                    )
                  : Image.file(io.File(path));
            },
            fileId: sticker.sticker!.id!,
            client: client));
  }
}
