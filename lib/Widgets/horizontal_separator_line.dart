import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';

class SeparatorLine extends StatelessWidget {
  const SeparatorLine(
      {Key? key, this.useGradient = false, this.isHorizontal = true})
      : super(key: key);
  final bool useGradient;
  final bool isHorizontal;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: useGradient ? null : lineColor,
        decoration: useGradient ? BoxDecoration(gradient: gradient) : null,
        height: isHorizontal ? 1 : null,
        width: isHorizontal ? null : 1);
  }

  Color get lineColor => ClientTheme.currentTheme.getField("BorderLineColor");

  LinearGradient get gradient => LinearGradient(
      colors: [Colors.transparent, lineColor, Colors.transparent]);
}
