import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';

class SeparatorLine extends StatelessWidget {
  const SeparatorLine({
    Key? key,
    this.useGradient = false,
    this.isHorizontal = true,
    this.color,
  }) : super(key: key);

  final bool useGradient;
  final bool isHorizontal;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: useGradient ? null : lineColor,
      decoration: useGradient ? BoxDecoration(gradient: gradient) : null,
      height: isHorizontal ? 1 : null,
      width: isHorizontal ? null : 1,
    );
  }

  Color get lineColor => color ?? ClientTheme.currentTheme.getField("BorderLineColor");

  LinearGradient get gradient => LinearGradient(
        colors: [
          Colors.transparent,
          lineColor,
          Colors.transparent,
        ],
      );
}
