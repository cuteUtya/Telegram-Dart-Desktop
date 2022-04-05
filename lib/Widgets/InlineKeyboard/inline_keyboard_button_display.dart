import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/Widgets/blured_widget.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/scale_utils.dart';

class InlineKeyboardButtonDisplay extends StatelessWidget {
  const InlineKeyboardButtonDisplay({
    Key? key,
    required this.onClick,
    required this.text,
  }) : super(key: key);

  final Function(BuildContext) onClick;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BackgroundBlur(
      radius: const BorderRadius.all(
        Radius.circular(4),
      ),
      child: TextButton(
        onPressed: () => onClick(context),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: p(8),
          ),
          child: RichText(
            text: TextDisplay.parseEmojiInString(
              text,
              TextDisplay.create(
                size: font(14),
                textColor: ClientTheme.currentTheme.getField(
                  "InlineKeyboardButton.text.color",
                ),
              ),
            ),
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => ClientTheme.currentTheme.getField(
              states.contains(MaterialState.pressed)
                  ? "InlineKeyboardButton.color.pressed"
                  : "InlineKeyboardButton.color",
            ),
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (states) => ClientTheme.currentTheme.getField(
              states.contains(MaterialState.hovered)
                  ? "InlineKeyboardButton.color.hover"
                  : "InlineKeyboardButton.color",
            ),
          ),
        ),
      ),
      blur: ImageFilter.blur(
        sigmaX: 6,
        sigmaY: 6,
      ),
    );
  }
}
