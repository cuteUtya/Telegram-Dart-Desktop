import 'package:flutter/cupertino.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';

class HorizontalSeparatorLine extends StatelessWidget {
  const HorizontalSeparatorLine({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1, color: ClientTheme.currentTheme.getField("BorderLineColor"));
  }
}
