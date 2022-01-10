import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/Widgets/message/Stickers/sticker_outnline.dart';
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
    this.width,
    this.height,
    required this.client,
    required this.sticker,
    this.alignment = Alignment.center,
    required this.infoWidget,
  }) : super(key: key);
  final double? width;
  final double? height;
  final Sticker sticker;
  final Alignment alignment;
  final Widget? infoWidget;
  final TelegramClient client;

  static const double stickerSizeRatie = 0.5;

  @override
  Widget build(BuildContext context) {
    var hiderKey = GlobalKey<WidgetHiderState>();
    var sizerKey = GlobalKey<WidgetSizerState>();

    var stickerWidth = width ?? (sticker.width! * stickerSizeRatie);
    var stickerHeight = height ?? (sticker.height! * stickerSizeRatie);

    return WidgetSizer(
        key: sizerKey,
        resizeDuration: const Duration(milliseconds: 100),
        alignment: alignment,
        sizeOnInit: Size(
          stickerWidth,
          stickerHeight,
        ),
        child: GestureDetector(
            onLongPress: () {
              sizerKey.currentState
                  ?.resize(Size(stickerWidth * 1.5, stickerHeight * 1.5));
            },
            onLongPressEnd: (_) {
              sizerKey.currentState?.resize(Size(stickerWidth, stickerHeight));
            },
            child: Stack(alignment: Alignment.bottomRight, children: [
              RemoteFileBuilder(
                  emptyPlaceholder: sticker.outline == null
                      ? const SizedBox.shrink()
                      : CustomPaint(
                          painter: StickerOutline(
                            sticker.outline!,
                            stickerSizeRatie,
                          ),
                          child: Container(
                              width:
                                  sticker.width!.toDouble() * stickerSizeRatie,
                              height:
                                  sticker.height!.toDouble() * stickerSizeRatie,
                              margin: EdgeInsets.only(
                                  bottom: sticker.height! * stickerSizeRatie))),
                  builder: (_, path) {
                    return MouseRegion(
                        onEnter: (_) {
                          hiderKey.currentState?.show();
                        },
                        onExit: (_) {
                          hiderKey.currentState?.hide();
                          sizerKey.currentState
                              ?.resize(Size(stickerWidth, stickerHeight));
                        },
                        child: sticker.isAnimated!
                            ? Rlottie.file(
                                path: path, behavior: PlayBehavior.loop)
                            : Image.file(io.File(path)));
                  },
                  fileId: sticker.sticker!.id!,
                  client: client),
              if (infoWidget != null)
                Container(
                    margin: const EdgeInsets.only(right: 8, bottom: 8),
                    child: WidgetHider(
                      key: hiderKey,
                      child: infoWidget!,
                      hiddenOnInit: true,
                    ))
            ])));
  }
}
