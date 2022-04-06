import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/Widgets/blured_widget.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart' hide RichText;

class InlineKeyboardButtonDisplay extends StatelessWidget {
  const InlineKeyboardButtonDisplay({
    Key? key,
    required this.onClick,
    required this.text,
    required this.type,
  }) : super(key: key);

  final Function(BuildContext) onClick;
  final String text;
  final InlineKeyboardButtonType type;

  @override
  Widget build(BuildContext context) {
    IconData? icon = ClientTheme.currentTheme.tryGetField(
      "InlineKeyboardButton.icon.${type.runtimeType}",
    );

    return Stack(
      children: [
        BackgroundBlur(
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
        ),
        Positioned(
          top: 1,
          right: 4,
          child: IgnorePointer(
            child: Icon(
              icon,
              size: 14,
              color: ClientTheme.currentTheme.getField(
                "InlineKeyboardButton.icon.color",
              ),
            ),
          ),
        )
      ],
    );
  }
}
