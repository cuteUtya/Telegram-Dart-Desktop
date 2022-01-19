import 'dart:async';

import 'package:myapp/audio utils/audio_provider.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Stickers/sticker_display.dart';
import 'package:myapp/Widgets/big_stickers_overlay.dart';
import 'package:myapp/rlottie/rlottie.dart';
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
    extends State<MessageDisplayAnimatedEmoji> {
  bool _canPlayAnim = true;
  void showBigAnimation({Sticker? sticker}) async {
    print(_canPlayAnim);
    if (_canPlayAnim) {
      _canPlayAnim = false;
      _animationKey.currentState?.play();
      var renderObject = _animationKey.currentContext?.findRenderObject();
      var transition = renderObject?.getTransformTo(null).getTranslation();
      var rect = renderObject?.paintBounds
          .shift(Offset(transition?.x ?? 0, transition?.y ?? 0));
      var animPosition = Offset(rect?.left ?? 0, rect?.top ?? 0);

      var audio =
          (widget.message.content as MessageAnimatedEmoji).animatedEmoji?.sound;
      if (audio != null) {
        widget.client
            .send(
                DownloadFile(fileId: audio.id, priority: 1, synchronous: true))
            .then((file) {
          file as File;
          AudioProvider.playOneTick(file.local!.path!);
        });
      }

      if (sticker == null) {
        var clickResult = await widget.client.send(ClickAnimatedEmojiMessage(
            chatId: widget.chatId, messageId: widget.message.id!));
        if (clickResult is Sticker) {
          BigStickerOverlayState.animateSticker(
            clickResult,
            animPosition,
          );
        }
      } else {
        BigStickerOverlayState.animateSticker(sticker, animPosition);
      }
    }
  }

  final List<StreamSubscription> _streamSubscription = [];
  final GlobalKey<RlottieState> _animationKey = GlobalKey<RlottieState>();

  @override
  void initState() {
    _streamSubscription.add(widget.client
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
  void dispose() {
    for (var element in _streamSubscription) {
      element.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.message.content is MessageAnimatedEmoji);
    var emoji = (widget.message.content as MessageAnimatedEmoji).animatedEmoji!;
    return GestureDetector(
        onTap: () => showBigAnimation(),
        child: Align(
            alignment: widget.message.isOutgoing!
                ? Alignment.bottomRight
                : Alignment.bottomLeft,
            child: SizedBox(
                width: emoji.sticker!.width! * StickerDisplay.stickerSizeRatie,
                height:
                    emoji.sticker!.height! * StickerDisplay.stickerSizeRatie,
                child: StickerDisplay(
                  rlottieKey: _animationKey,
                  onClick: () => showBigAnimation(),
                  onAnimPlayed: () {
                    _canPlayAnim = true;
                  },
                  sticker: emoji.sticker!,
                  playBehavior: PlayBehavior.externalControl,
                  client: widget.client,
                ))));
  }
}
