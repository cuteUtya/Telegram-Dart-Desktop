import 'package:flutter/material.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/Stickers/sticker_display.dart';
import 'package:myapp/Widgets/widget_hider.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'package:myapp/Widgets/widget_sizer.dart';

class MessageStickerDisplay extends StatelessWidget {
  const MessageStickerDisplay({
    Key? key,
    required this.message,
    required this.client,
    required this.infoWidget,
    required this.replieWidget,
  }) : super(key: key);

  final Message message;
  final TelegramClient client;
  final Widget infoWidget;
  final Widget? replieWidget;

  @override
  Widget build(BuildContext context) {
    assert(message.content is MessageSticker);
    var sticker = (message.content as MessageSticker).sticker!;

    var hiderKey = GlobalKey<WidgetHiderState>();
    var sizerKey = GlobalKey<WidgetSizerState>();

    var stickerWidth = (sticker.width ?? (sticker.width!)).toDouble() *
        StickerDisplay.stickerSizeRatio;
    var stickerHeight = (sticker.height ?? (sticker.height!)).toDouble() *
        StickerDisplay.stickerSizeRatio;
    return Align(
      alignment:
          message.isOutgoing! ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (replieWidget != null && message.isOutgoing!)
            Container(
              child: replieWidget!,
              margin: const EdgeInsets.only(right: 8),
            ),
          Stack(alignment: Alignment.bottomRight, children: [
            WidgetSizer(
              key: sizerKey,
              curve: Curves.easeOutBack,
              duration: const Duration(milliseconds: 200),
              alignment: message.isOutgoing!
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              sizeOnInit: Size(
                stickerWidth,
                stickerHeight,
              ),
              child: GestureDetector(
                onLongPress: () {
                  sizerKey.currentState?.resize(
                    Size(stickerWidth * 1.33, stickerHeight * 1.33),
                  );
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
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 8, bottom: 8),
              child: WidgetHider(
                key: hiderKey,
                child: infoWidget,
                hiddenOnInit: !UIManager.isMobile,
              ),
            )
          ]),
          if (replieWidget != null && !message.isOutgoing!)
            Container(
              child: replieWidget!,
              margin: const EdgeInsets.only(left: 8),
            ),
        ],
      ),
    );
  }
}
