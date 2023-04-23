import 'package:flutter/material.dart';
import 'package:myapp/StateWithStreamsSubscriptions.dart';
import 'package:myapp/Widgets/Stickers/sticker_display.dart';
import 'package:myapp/Rlottie/rlottie.dart';
import 'package:myapp/Widgets/message/message_display_media.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';

class MessageDisplayAnimatedEmoji extends StatefulWidget {
  const MessageDisplayAnimatedEmoji({
    Key? key,
    required this.chatId,
    required this.message,
    required this.client,
    this.infoWidget,
    this.replieWidget,
  }) : super(key: key);

  final int chatId;
  final Message message;
  final TelegramClient client;
  final Widget? infoWidget;
  final Widget? replieWidget;
  @override
  State<StatefulWidget> createState() => _MessageDisplayAnimtedEmojiState();
}

class _MessageDisplayAnimtedEmojiState
    extends StateWithStreamsSubscriptions<MessageDisplayAnimatedEmoji> {
  bool _canPlayAnim = true;
  OverlayEntry? entry;
  @override
  void dispose() {
    entry?.remove();
    super.dispose();
  }

  void showBigAnimation({Sticker? sticker}) async {
    void animate({required Offset position, required Sticker sticker}) {
      var size = _animationKey.currentContext!.size!;
      Size stickerSize = const Size(386, 386);
      entry = OverlayEntry(
        builder: (_) => Positioned(
          left: -position.dx - (stickerSize.width - size.width),
          top: -position.dy - size.height,
          child: IgnorePointer(
            child: SizedBox.fromSize(
              size: stickerSize,
              child: StickerDisplay(
                client: widget.client,
                sticker: sticker,
                onAnimPlayed: () {
                  entry!.remove();
                },
              ),
            ),
          ),
        ),
      );
      Overlay.of(context).insert(entry!);
    }

    if (_canPlayAnim) {
      _canPlayAnim = false;
      _animationKey.currentState?.play();
      var box = _animationKey.currentContext?.findRenderObject() as RenderBox;
      var animPosition = box.globalToLocal(Offset.zero);

      if (sticker == null) {
        var clickResult = await widget.client.send(
          ClickAnimatedEmojiMessage(
            chatId: widget.chatId,
            messageId: widget.message.id!,
          ),
        );
        if (clickResult is Sticker) {
          animate(
            position: animPosition,
            sticker: clickResult,
          );
        }
      } else {
        animate(
          position: animPosition,
          sticker: sticker,
        );
      }
    }
  }

  final GlobalKey<RlottieState> _animationKey = GlobalKey<RlottieState>();

  @override
  void initState() {
    streamSubscriptions.add(widget.client
        .animatedEmojiClick(widget.chatId, widget.message.id!)
        .listen((event) {
      if (_canPlayAnim) {
        _animationKey.currentState?.play();
        showBigAnimation(sticker: event.sticker);
      }
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.message.content is MessageAnimatedEmoji);
    var emoji = (widget.message.content as MessageAnimatedEmoji).animatedEmoji!;
    return MessageDisplayMedia(
      message: widget.message,
      infoWidget: widget.infoWidget,
      replieWidget: widget.replieWidget,
      client: widget.client,
      content: GestureDetector(
        onTap: () => showBigAnimation(),
        child: Align(
          alignment: widget.message.isOutgoing!
              ? Alignment.bottomRight
              : Alignment.bottomLeft,
          child: SizedBox(
            width: emoji.sticker!.width! * StickerDisplay.stickerSizeRatio,
            height: emoji.sticker!.height! * StickerDisplay.stickerSizeRatio,
            child: StickerDisplay(
              rlottieKey: _animationKey,
              onClick: () => showBigAnimation(),
              onAnimPlayed: () {
                _canPlayAnim = true;
              },
              sticker: emoji.sticker!,
              playBehavior: PlayBehavior.externalControl,
              client: widget.client,
            ),
          ),
        ),
      ),
    );
  }
}
