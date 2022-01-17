import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Stickers/sticker_display.dart';
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
  static Future<double> animateSticker(Sticker sticker, Offset position) {
    assert(_state != null);
    return _state!._animateSticker(sticker, position);
  }

  Future<double> _animateSticker(Sticker sticker, Offset position) {
    Completer<double> result = Completer<double>();
    widget.client.send(GetFile(fileId: sticker.sticker!.id)).then((fileInfo) {
      fileInfo as File;
      void perform(String path) {
        var lottieInfo = Rlottie.getRLottieInfo(path);
        var pos =
            position - Offset(lottieInfo.width / 2, lottieInfo.height / 4);
        var stickerInfo = _AnimatedStickerInfo(
            position: Offset(max(0, pos.dx), max(0, pos.dy)),
            sticker: sticker,
            size: Offset(lottieInfo.width, lottieInfo.height));
        setState(() => playedStickers.add(stickerInfo));
        result.complete(lottieInfo.duration);
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
                synchronous: true, priority: 1, fileId: sticker.sticker!.id))
            .then((file) {
          file as File;
          perform(file.local!.path!);
        });
      }
    });
    return result.future;
  }

  List<_AnimatedStickerInfo> playedStickers = [];

  @override
  Widget build(BuildContext context) {
    _state = this;
    return Stack(
      children: playedStickers
          .map((e) => Container(
                width: e.size.dx,
                height: e.size.dy,
                margin:
                    EdgeInsets.only(left: e.position.dx, top: e.position.dy),
                child: StickerDisplay(
                  client: widget.client,
                  sticker: e.sticker,
                ),
              ))
          .toList(),
    );
  }
}

class _AnimatedStickerInfo {
  const _AnimatedStickerInfo({
    required this.position,
    required this.sticker,
    required this.size,
  });

  final Sticker sticker;
  final Offset position;
  final Offset size;
}
