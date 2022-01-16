import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Stickers/sticker_display.dart';
import 'package:myapp/Widgets/remote_file_builder.dart';
import 'package:myapp/rlottie/rlottie.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';

class BigStickerOverlay extends StatefulWidget {
  const BigStickerOverlay({
    Key? key,
    required this.client,
  }) : super(key: key);

  final TelegramClient client;
  @override
  State<StatefulWidget> createState() => BigStickerOverlayState();
}

class BigStickerOverlayState extends State<BigStickerOverlay> {
  static BigStickerOverlayState? _state;
  static void animateSticker(Sticker sticker) {
    _state?._animateSticker(sticker);
  }

  void _animateSticker(Sticker sticker) => setState(() {
        widget.client
            .send(GetFile(fileId: sticker.sticker!.id))
            .then((fileInfo) {
          fileInfo as File;
          void perform(String path) {
            var lottieInfo = Rlottie.getRLottieInfo(path);
            var pos = currentMousePosition -
                Offset(lottieInfo.width / 2, lottieInfo.height / 2);
            var stickerInfo = _AnimatedStickerInfo(
                position: Offset(max(0, pos.dx), max(0, pos.dy)),
                sticker: sticker);
            playedStickers.add(stickerInfo);
            Future.delayed(
                Duration(
                    milliseconds: ((lottieInfo.duration * 1000) - 100).toInt()),
                () => setState(() => playedStickers.remove(stickerInfo)));
          }

          if (fileInfo.local!.isDownloadingCompleted!) {
            perform(fileInfo.local!.path!);
          } else {
            widget.client
                .send(DownloadFile(
                    synchronous: true,
                    priority: 1,
                    fileId: sticker.sticker!.id))
                .then((file) {
              file as File;
              perform(file.local!.path!);
            });
          }
        });
      });

  List<_AnimatedStickerInfo> playedStickers = [];

  Offset currentMousePosition = Offset.zero;
  @override
  Widget build(BuildContext context) {
    _state = this;
    return MouseRegion(
      opaque: false,
      onHover: (hover) => currentMousePosition = hover.position,
      child: Stack(
        children: playedStickers
            .map((e) => Container(
                  margin:
                      EdgeInsets.only(left: e.position.dx, top: e.position.dy),
                  child: StickerDisplay(
                    client: widget.client,
                    sticker: e.sticker,
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class _AnimatedStickerInfo {
  const _AnimatedStickerInfo({required this.position, required this.sticker});
  final Sticker sticker;
  final Offset position;
}
