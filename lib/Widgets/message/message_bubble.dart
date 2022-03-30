import 'package:flutter/cupertino.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/Widgets/message/bubble_utils.dart';
import 'package:myapp/scale_utils.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {Key? key,
      required this.content,
      required this.side,
      required this.position,
      required this.radiusClose,
      required this.radiusFree,
      required this.contentPadding,
      this.bubblePainter})
      : super(key: key);

  final Widget content;
  final Side side;
  final BubbleRelativePosition position;
  final Radius radiusFree;
  final Radius radiusClose;
  final CustomPainter? bubblePainter;
  final EdgeInsetsGeometry contentPadding;

  static final double sidePadding = p(5);

  static BorderRadius calculateBorderRadius({
    required BubbleRelativePosition position,
    required Radius radiusFree,
    required Radius radiusClose,
    required Side side,
  }) {
    switch (position) {
      case BubbleRelativePosition.top:
        return BorderRadius.only(
          bottomLeft: side == Side.left ? radiusClose : radiusFree,
          bottomRight: side == Side.left ? radiusFree : radiusClose,
          topLeft: radiusFree,
          topRight: radiusFree,
        );
      case BubbleRelativePosition.bottom:
        return BorderRadius.only(
          topRight: side == Side.left ? radiusFree : radiusClose,
          topLeft: side == Side.left ? radiusClose : radiusFree,
          bottomLeft: radiusFree,
          bottomRight: radiusFree,
        );
      case BubbleRelativePosition.middle:
        if (side == Side.right) {
          return BorderRadius.horizontal(left: radiusFree, right: radiusClose);
        } else {
          return BorderRadius.horizontal(left: radiusClose, right: radiusFree);
        }
      case BubbleRelativePosition.single:
        return BorderRadius.all(radiusFree);
    }
  }

  @override
  Widget build(BuildContext context) {
    var bubbleColor = ClientTheme.currentTheme.getField(side == Side.left
        ? "MessageBubbleOtherColor"
        : "MessageBubbleMineColor");

    var borderRadius = calculateBorderRadius(
      position: position,
      radiusFree: radiusFree,
      radiusClose: radiusClose,
      side: side,
    );

    return Stack(
      alignment:
          side == Side.left ? Alignment.bottomLeft : Alignment.bottomRight,
      children: [
        if (position == BubbleRelativePosition.bottom ||
            position == BubbleRelativePosition.single)
          CustomPaint(
            painter: bubblePainter,
            child: SizedBox(
              width: p(36),
              height: p(29),
            ),
          ),
        Container(
          margin: EdgeInsets.only(
              left: side == Side.left ? sidePadding : 0,
              right: side == Side.left ? 0 : sidePadding),
          decoration:
              BoxDecoration(color: bubbleColor, borderRadius: borderRadius),
          child: Padding(
            padding: contentPadding,
            child: content,
          ),
        ),
      ],
    );
  }
}
