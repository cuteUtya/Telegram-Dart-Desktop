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
      TextAlign? textAlign = TextAlign.left,
      TextOverflow? overflow,
      TextDecoration decoration = TextDecoration.none}) {
    var color = ClientTheme.currentTheme
        .getField(textColor.toString().replaceFirst("TextColor.", "")) as Color;
    var font = ClientTheme.currentTheme.getField(fontFamily == TextFont.regular
        ? "RegularFontFamily"
        : "HeaderFontFamily");
    return TextStyle(
      overflow: overflow,
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontFamily: font,
      decoration: decoration,
    );
  }
}

enum TextFont { regular, greaterImportance }
enum TextColor {
  Accent,
  HeaderMain,
  HeaderSecondary,
  AdditionalTextColor,
  RegularText,
  DangerColor
}
