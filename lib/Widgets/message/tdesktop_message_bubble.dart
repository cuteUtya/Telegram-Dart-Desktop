import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/Widgets/message/bubble_utils.dart';
import 'package:myapp/Widgets/message/message_bubble.dart';
import 'package:myapp/Widgets/message/tdesktop_message_bubble_painter.dart';

class TdesktopMessageBubble extends StatelessWidget {
  const TdesktopMessageBubble({
    Key? key,
    required this.content,
    required this.side,
    required this.position,
    this.overridePadding = false,
  }) : super(key: key);

  final Widget content;
  final Side side;
  final BubbleRelativePosition position;
  final bool overridePadding;
  @override
  Widget build(BuildContext context) => MessageBubble(
        content: content,
        side: side,
        position: position,
        radiusClose: const Radius.circular(2),
        radiusFree: const Radius.circular(10),
        bubblePainter: TdesktopMessageBubblePainter(
          color: ClientTheme.currentTheme.getField(
            side == Side.left ? "MessageBubbleOtherColor" : "MessageBubbleMineColor",
          ),
          side: side,
        ),
        contentPadding: overridePadding ? EdgeInsets.zero : const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      );
}
