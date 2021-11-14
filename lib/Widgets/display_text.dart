import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:path/path.dart';

class TextDisplay {
  static String _getEmojiFont() => "TwitterColorEmoji";

  static InlineSpan emoji(String emoji, double size) {
    return TextSpan(
        text: emoji,
        style: TextStyle(
            fontFamily: _getEmojiFont(),
            fontSize: size,
            decoration: TextDecoration.none));
  }

  static TextStyle create(
      {double size = 20,
      FontStyle? fontStyle = FontStyle.normal,
      TextFont? fontFamily = TextFont.regular,
      TextColor? textColor = TextColor.RegularText,
      FontWeight? fontWeight = FontWeight.normal,
      TextAlign? textAlign = TextAlign.left}) {
    var color = ClientTheme.currentTheme
        .getField(textColor.toString().replaceFirst("TextColor.", "")) as Color;
    var font = ClientTheme.currentTheme.getField(fontFamily == TextFont.regular
        ? "RegularFontFamily"
        : "HeaderFontFamily");
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontFamily: font,
      decoration: TextDecoration.none,
    );
  }
}

enum TextFont { regular, greaterImportance }
enum TextColor {
  Accent,
  HeaderMain,
  HeaderSecondary,
  AdditionalTextColor,
  RegularText
}
