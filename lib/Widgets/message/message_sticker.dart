import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Stickers/sticker_display.dart';
import 'package:myapp/Widgets/widget_hider.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'package:myapp/widget_sizer.dart';

class MessageStickerDisplay extends StatelessWidget {
  const MessageStickerDisplay(
      {Key? key,
      required this.alignment,
      required this.message,
      required this.client,
      required this.infoWidget})
      : super(key: key);
  final Alignment alignment;
  final Message message;
  final TelegramClient client;
  final Widget infoWidget;

  @override
  Widget build(BuildContext context) {
    assert(message.content is MessageSticker);
    var sticker = (message.content as MessageSticker).sticker!;

    var hiderKey = GlobalKey<WidgetHiderState>();
    var sizerKey = GlobalKey<WidgetSizerState>();

    var stickerWidth = (sticker.width ?? (sticker.width!)).toDouble() *
        StickerDisplay.stickerSizeRatie;
    var stickerHeight = (sticker.height ?? (sticker.height!)).toDouble() *
        StickerDisplay.stickerSizeRatie;
    return Align(
        alignment:
            message.isOutgoing! ? Alignment.bottomRight : Alignment.bottomLeft,
        child: Stack(alignment: Alignment.bottomRight, children: [
          WidgetSizer(
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
                    sizerKey.currentState
                        ?.resize(Size(stickerWidth, stickerHeight));
                  },
                  child: MouseRegion(
                      onEnter: (_) => hiderKey.currentState?.show(),
                      onExit: (_) => hiderKey.currentState?.hide(),
                      child: StickerDisplay(
                        client: client,
                        sticker: sticker,
                      )))),
          Container(
              margin: const EdgeInsets.only(right: 8, bottom: 8),
              child: WidgetHider(
                key: hiderKey,
                child: infoWidget,
                hiddenOnInit: true,
              ))
        ]));
  }
}
