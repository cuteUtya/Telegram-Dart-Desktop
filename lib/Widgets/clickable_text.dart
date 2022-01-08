import 'package:flutter/material.dart';
import 'package:myapp/Widgets/clickable_object.dart';
import 'package:myapp/Widgets/display_text.dart';

class ClickableText extends StatelessWidget {
  const ClickableText(
      {Key? key,
      required this.data,
      this.fontSize = 16,
      this.textColor = TextColor.Accent,
      this.onTap})
      : super(key: key);
  final String data;
  final double fontSize;
  final TextColor textColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ClickableObject(
        onTap: () => onTap?.call(),
        builder: (selected) => Text(data,
            style: TextDisplay.create(
                size: fontSize,
                textColor: textColor,
                decoration: selected
                    ? TextDecoration.underline
                    : TextDecoration.none)));
  }
}
