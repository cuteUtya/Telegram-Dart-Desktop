import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Stickers/sticker_display.dart';
import 'package:myapp/Widgets/big_stickers_overlay.dart';
import 'package:myapp/rlottie/rlottie.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';

/// TODO don't process clicks while animation play
/// TODO terminate animation on last frame (for now it's work using timer, not best solution)
/// TODO preload animation or don't show animation if time of him loading was more than N ms, i don't know best solution, but on first click user have big delayed in particles animation
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
    extends State<MessageDisplayAnimatedEmoji> {
  void showBigAnimation({Sticker? sticker}) async {
    var renderObject = _animationKey.currentContext?.findRenderObject();
    var transition = renderObject?.getTransformTo(null).getTranslation();
    var rect = renderObject?.paintBounds
        .shift(Offset(transition?.x ?? 0, transition?.y ?? 0));
    var animPosition = Offset(rect?.left ?? 0, rect?.top ?? 0);

    if (sticker == null) {
      var clickResult = await widget.client.send(ClickAnimatedEmojiMessage(
          chatId: widget.chatId, messageId: widget.message.id!));
      if (clickResult is Sticker) {
        BigStickerOverlayState.animateSticker(clickResult, animPosition);
      }
    } else {
      BigStickerOverlayState.animateSticker(sticker, animPosition);
    }
  }

  final List<StreamSubscription> _streamSubscription = [];
  final GlobalKey<RlottieState> _animationKey = GlobalKey<RlottieState>();

  @override
  void initState() {
    _streamSubscription.add(widget.client
        .animatedEmojiClick(widget.chatId, widget.message.id!)
        .listen((event) {
      _animationKey.currentState?.play();
      showBigAnimation(sticker: event.sticker);
    }));
    super.initState();
  }

  @override
  void dispose() {
    for (var element in _streamSubscription) {
      element.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.message.content is MessageAnimatedEmoji);
    return Align(
        alignment: widget.message.isOutgoing!
            ? Alignment.bottomRight
            : Alignment.bottomLeft,
        child: StickerDisplay(
          rlottieKey: _animationKey,
          onClick: () => showBigAnimation(),
          sticker: (widget.message.content as MessageAnimatedEmoji)
              .animatedEmoji!
              .sticker!,
          playBehavior: PlayBehavior.playOnClick,
          client: widget.client,
        ));
  }
}
