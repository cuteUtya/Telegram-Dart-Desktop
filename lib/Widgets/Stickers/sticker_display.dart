import 'package:flutter/material.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/Stickers/sticker_outnline.dart';
import 'package:myapp/Widgets/message/message_display_gif.dart';
import 'package:myapp/Widgets/message/message_display_video.dart';
import 'package:myapp/Widgets/message/message_display_video_sticker.dart';
import 'package:myapp/Widgets/remote_file_builder.dart';
import 'package:myapp/Rlottie/rlottie.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'dart:io' as io;
import 'package:dart_vlc/dart_vlc.dart' as vlc;

/// UI representation of [MessageSticker]
class StickerDisplay extends StatelessWidget {
  const StickerDisplay({
    Key? key,
    this.rlottieKey,
    required this.client,
    required this.sticker,
    this.loadPlaceHolder,
    this.onClick,
    this.onAnimPlayed,
    this.showOutline = true,
    this.playBehavior = PlayBehavior.loop,
    this.size = 1.0,
    this.alignment = Alignment.center,
  }) : super(key: key);

  final Key? rlottieKey;
  final double size;
  final Sticker sticker;
  final PlayBehavior playBehavior;
  final Widget? loadPlaceHolder;
  final bool showOutline;
  final Function()? onClick;
  final Function()? onAnimPlayed;
  final Alignment alignment;
  final TelegramClient client;

  static double get stickerSizeRatio => UIManager.isMobile ? 0.35 :  0.45;

  @override
  Widget build(BuildContext context) {
    var width = (sticker.width ?? sticker.width!).toDouble() * (stickerSizeRatio * size);
    var height = (sticker.height ?? sticker.height!).toDouble() * (stickerSizeRatio * size);
    return RemoteFileBuilder(
        emptyPlaceholder: loadPlaceHolder ??
            (sticker.outline == null || !showOutline
                ? const SizedBox.shrink()
                : CustomPaint(
                    painter: StickerOutline(
                      sticker.outline!,
                      stickerSizeRatio * size,
                    ),
                    child: SizedBox(
                      width: width,
                      height: height,
                    ),
                  )),
        builder: (_, path) {
          switch (sticker.type.runtimeType) {
            case StickerTypeStatic:
              return Image.file(io.File(path));
            case StickerTypeAnimated:
              return Rlottie.file(
                key: rlottieKey,
                path: path,
                behavior: playBehavior,
                onClick: onClick,
                onAnimPlayed: onAnimPlayed,
              );
            case StickerTypeVideo:
              return MessageDisplayVideoSticker(
                client: client,
                sticker: sticker,
              );
          }
          return const SizedBox.shrink();
        },
        fileId: sticker.sticker!.id!,
        client: client);
  }
}
