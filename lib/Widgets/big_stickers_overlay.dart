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
  static void animateSticker(Sticker sticker, Offset position) async {
    assert(_state != null);
    _state!._animateSticker(sticker, position);
  }

  void _animateSticker(Sticker sticker, Offset position) async {
    var fileInfo =
        await widget.client.send(GetFile(fileId: sticker.sticker!.id)) as File;
    String path;

    if (fileInfo.local!.isDownloadingCompleted!) {
      path = fileInfo.local!.path!;
    } else {
      path = ((await widget.client.send(DownloadFile(
              synchronous: true,
              priority: 1,
              fileId: sticker.sticker!.id)) as File)
          .local!
          .path!);
    }

    var lottieInfo = Rlottie.getRLottieInfo(path);
    var pos = position - Offset(lottieInfo.width / 2, lottieInfo.height / 4);

    setState(() => playedStickers.add(_AnimatedStickerInfo(
        position: Offset(max(0, pos.dx), max(0, pos.dy)),
        sticker: StickerDisplay(
          client: widget.client,
          sticker: sticker,
          onAnimPlayed: () {
            setState(() => playedStickers.removeLast());
          },
        ),
        size: Offset(lottieInfo.width, lottieInfo.height))));
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
                child: e.sticker,
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

  final Widget sticker;
  final Offset position;
  final Offset size;
}
