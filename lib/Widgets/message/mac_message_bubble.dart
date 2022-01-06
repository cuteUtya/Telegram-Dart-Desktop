import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/message/bubble_utils.dart';
import 'package:myapp/Widgets/message/mac_message_bubble_painter.dart';

/// ![](https://raw.githubusercontent.com/Tim-dev-hub/tgclient-doc-resources/main/images/macMessageBubble_example.jpg)
/// message bubble that looks like bubble from telegram macOS version
/// * [content] content that will wraps by bubble
/// * [side] side in wich bubble will look nib of bubble
class MacMessageBubble extends StatelessWidget {
  const MacMessageBubble({Key? key, required this.content, required this.side})
      : super(key: key);
  final Widget content;
  final Side side;
  @override
  Widget build(BuildContext context) {
    var bubbleColor = ClientTheme.currentTheme.getField(side == Side.left
        ? "MessageBubbleOtherColor"
        : "MessageBubbleMineColor");
    return Stack(
        alignment:
            side == Side.left ? Alignment.bottomLeft : Alignment.bottomRight,
        children: [
          CustomPaint(
              painter: MacMessageBubblePainter(color: bubbleColor, side: side),
              child: const SizedBox(
                width: 41,
                height: 35,
              )),
          Container(
              margin: EdgeInsets.only(
                  left: side == Side.left ? 6 : 0,
                  right: side == Side.left ? 0 : 6),
              decoration: BoxDecoration(
                  color: bubbleColor,
                  borderRadius: const BorderRadius.all(Radius.circular(18))),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: content)),
        ]);
  }
}
