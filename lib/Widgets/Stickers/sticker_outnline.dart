import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart' as td;

class StickerOutline extends CustomPainter {
  const StickerOutline(this.outline, this.sizeRatio);
  final List<td.ClosedVectorPath> outline;
  final double sizeRatio;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = ClientTheme.currentTheme.getField("StickerOutlineColor");

    for (var vector in outline) {
      Path path = Path();
      var last = vector.commands!.last;
      td.Point? initPoint;
      if (last is td.VectorPathCommandLine) {
        initPoint = last.endPoint!;
      } else if (last is td.VectorPathCommandCubicBezierCurve) {
        initPoint = last.endPoint!;
      }
      if (initPoint != null) {
        path.moveTo(initPoint.x!.toDouble() * sizeRatio, initPoint.y!.toDouble() * sizeRatio);
      }
      for (var command in vector.commands!) {
        switch (command.runtimeType) {
          case td.VectorPathCommandLine:
            var point = (command as td.VectorPathCommandLine).endPoint!;
            path.lineTo(point.x!.toDouble() * sizeRatio, point.y!.toDouble() * sizeRatio);
            break;
          case td.VectorPathCommandCubicBezierCurve:
            var curve = (command as td.VectorPathCommandCubicBezierCurve);
            path.cubicTo(
                curve.startControlPoint!.x!.toDouble() * sizeRatio,
                curve.startControlPoint!.y!.toDouble() * sizeRatio,
                curve.endControlPoint!.x!.toDouble() * sizeRatio,
                curve.endControlPoint!.y!.toDouble() * sizeRatio,
                curve.endPoint!.x!.toDouble() * sizeRatio,
                curve.endPoint!.y!.toDouble() * sizeRatio);
            break;
        }
      }
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
