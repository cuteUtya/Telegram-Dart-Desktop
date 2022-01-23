import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/message/bubble_utils.dart';
import 'package:myapp/Widgets/message/mac_message_bubble_painter.dart';

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
  }) : super(key: key);

  final Widget content;
  final Side side;
  final BubbleRelativePosition position;
  @override
  Widget build(BuildContext context) {
    var bubbleColor = ClientTheme.currentTheme.getField(side == Side.left ? "MessageBubbleOtherColor" : "MessageBubbleMineColor");
    Radius radiusFree = const Radius.circular(18);
    Radius radiusClose = const Radius.circular(4);
    BorderRadius borderRadius = BorderRadius.all(radiusFree);
    switch (position) {
      case BubbleRelativePosition.top:
        //borderRadius =
        //    BorderRadius.vertical(top: radiusFree, bottom: radiusClose);
        borderRadius = BorderRadius.only(
          bottomLeft: side == Side.left ? radiusClose : radiusFree,
          bottomRight: side == Side.left ? radiusFree : radiusClose,
          topLeft: radiusFree,
          topRight: radiusFree,
        );
        break;
      case BubbleRelativePosition.bottom:
        //borderRadius =
        //    BorderRadius.vertical(top: radiusClose, bottom: radiusFree);
        borderRadius = BorderRadius.only(
          topRight: side == Side.left ? radiusFree : radiusClose,
          topLeft: side == Side.left ? radiusClose : radiusFree,
          bottomLeft: radiusFree,
          bottomRight: radiusFree,
        );
        break;
      case BubbleRelativePosition.middle:
        //borderRadius = BorderRadius.all(radiusClose);
        if (side == Side.right) {
          borderRadius = BorderRadius.horizontal(left: radiusFree, right: radiusClose);
        } else {
          borderRadius = BorderRadius.horizontal(left: radiusClose, right: radiusFree);
        }
        break;
      case BubbleRelativePosition.single:
        borderRadius = BorderRadius.all(radiusFree);
        break;
    }
    return Stack(
      alignment: side == Side.left ? Alignment.bottomLeft : Alignment.bottomRight,
      children: [
        if (position == BubbleRelativePosition.bottom || position == BubbleRelativePosition.single)
          CustomPaint(
            painter: MacMessageBubblePainter(color: bubbleColor, side: side),
            child: const SizedBox(
              width: 41,
              height: 35,
            ),
          ),
        Container(
          margin: EdgeInsets.only(left: side == Side.left ? 6 : 0, right: side == Side.left ? 0 : 6),
          decoration: BoxDecoration(color: bubbleColor, borderRadius: borderRadius),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: content,
          ),
        ),
      ],
    );
  }
}
