import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';

class TextDisplay {
  static String _getEmojiFont() => "TwitterColorEmoji";

  static TextStyle get title => create(
      size: 24, fontWeight: FontWeight.w600, textColor: TextColor.HeaderMain);
  static TextStyle get additional =>
      create(textColor: TextColor.AdditionalTextColor, size: 16);
  static TextStyle get introTitle =>
      create(size: 26, textColor: TextColor.Accent);
  static TextStyle get regular16 => create(size: 16);
  static TextStyle get regular18 => create(size: 18);
  static TextStyle get regular20 => create(size: 20);
  static TextStyle get bold18 => create(size: 20, fontWeight: FontWeight.bold);
  static TextStyle get bold20 => create(size: 20, fontWeight: FontWeight.bold);

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
  DangerColor,
  Transparent
}
