import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/message/bubble_utils.dart';
import 'package:myapp/Widgets/message/mac_message_bubble_painter.dart';
import 'package:myapp/Widgets/message/message_bubble.dart';

/// ![](https://raw.githubusercontent.com/Tim-dev-hub/tgclient-doc-resources/main/images/macMessageBubble_example.jpg)
/// message bubble that looks like bubble from telegram macOS version
/// * [content] content that will wraps by bubble
/// * [side] side in wich bubble will look nib of bubble
class MacMessageBubble extends StatelessWidget {
  const MacMessageBubble({
    Key? key,
    required this.content,
    required this.side,
    required this.position,
    this.overridePadding = false,
  }) : super(key: key);

  final Widget content;
  final Side side;
  final bool overridePadding;
  final BubbleRelativePosition position;

  static const EdgeInsets padding = EdgeInsets.symmetric(vertical: 6, horizontal: 12);

  @override
  Widget build(BuildContext context) => MessageBubble(
        content: content,
        side: side,
        position: position,
        radiusClose: const Radius.circular(4),
        radiusFree: const Radius.circular(
          18,
        ),
        bubblePainter: MacMessageBubblePainter(
          color: ClientTheme.currentTheme.getField(
            side == Side.left ? "MessageBubbleOtherColor" : "MessageBubbleMineColor",
          ),
          side: side,
        ),
        contentPadding: overridePadding ? EdgeInsets.zero : padding,
      );
}
