import 'package:flutter/material.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/Stickers/sticker_display.dart';
import 'package:myapp/Widgets/message/message_display_media.dart';
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

    var sizerKey = GlobalKey<WidgetSizerState>();

    var stickerWidth = (sticker.width ?? (sticker.width!)).toDouble() * StickerDisplay.stickerSizeRatio;
    var stickerHeight = (sticker.height ?? (sticker.height!)).toDouble() * StickerDisplay.stickerSizeRatio;
    return MessageDisplayMedia(
      client: client,
      message: message,
      replieWidget: replieWidget,
      infoWidget: infoWidget,
      border: BorderRadius.zero,
      content: WidgetSizer(
        key: sizerKey,
        curve: Curves.easeOutBack,
        duration: const Duration(milliseconds: 200),
        alignment: message.isOutgoing! ? Alignment.centerRight : Alignment.centerLeft,
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
            sizerKey.currentState?.resize(Size(stickerWidth, stickerHeight));
          },
          child: StickerDisplay(
            client: client,
            sticker: sticker,
          ),
        ),
      ),
    );
  }
}
