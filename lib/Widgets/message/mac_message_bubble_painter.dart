import 'package:flutter/material.dart';
import 'package:myapp/Widgets/message/bubble_utils.dart';

/// ![](https://raw.githubusercontent.com/Tim-dev-hub/tgclient-doc-resources/main/images/macMessageBubble_example.png)
/// [CustomPainter] bottom nib of mac-style-bubble
/// * [color] color of bubble
/// * [side] which way will look nib of bubble
class MacMessageBubblePainter extends CustomPainter {
  const MacMessageBubblePainter({required this.color, this.side = Side.left});
  final Color color;
  final Side side;

  //https://github.com/overtake/TelegramSwift/blob/4e59c11547132d8a7fa49a4c586ab8c2359d0c3f/Telegram-Mac/ChatMessageBubbleImages.swift#L71
  @override
  void paint(Canvas canvas, Size size) {
    if (side == Side.right) {
      canvas.scale(-1, 1);
      canvas.translate(-size.width, 0);
    }
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1463414, size.height / 2);
    path_0.cubicTo(size.width * 0.1463414, size.height * 0.2237971, size.width * 0.3374390, 0, size.width * 0.573170, 0);
    path_0.cubicTo(size.width * 0.808953, 0, size.width, size.height * 0.2238571, size.width, size.height / 2);
    path_0.cubicTo(size.width, size.height * 0.776203, size.width * 0.808902, size.height, size.width * 0.573170, size.height);
    path_0.cubicTo(size.width * 0.4705878, size.height, size.width * 0.3764744, size.height * 0.957627, size.width * 0.3028768,
        size.height * 0.887010);
    path_0.cubicTo(size.width * 0.2208610, size.height, 0, size.height, 0, size.height);
    path_0.cubicTo(size.width * 0.1456585, size.height * 0.901428, size.width * 0.1463414, size.height * 0.767474,
        size.width * 0.1463414, size.height * 0.767474);
    path_0.lineTo(size.width * 0.1463414, size.height / 2);
    path_0.lineTo(size.width * 0.1463414, size.height / 2);
    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.002439024;
    paint_0_stroke.color = color.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_stroke);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
