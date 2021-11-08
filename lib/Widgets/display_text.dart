import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:path/path.dart';

class TextDisplay {
  static TextStyle H2(String text) {
    return H1(
        size: 28,
        textColor:
            ClientTheme.currentTheme.getField("HeaderSecondary") as Color);
  }

  static TextStyle H1(
      {double size = 36,
      Color? textColor,
      String? fontFamily,
      FontWeight weight = FontWeight.bold}) {
    fontFamily ??= ClientTheme.currentTheme.getField("HeaderFontFamily");
    textColor ??= ClientTheme.currentTheme.getField("HeaderMain") as Color;
    return Regular(
        size: size,
        fontWeight: weight,
        fontFamily: fontFamily,
        textColor: textColor);
  }

  static TextStyle Regular(
      {double size = 20,
      FontStyle fontStyle = FontStyle.normal,
      String? fontFamily,
      Color? textColor,
      FontWeight fontWeight = FontWeight.normal,
      TextAlign textAlign = TextAlign.center}) {
    textColor ??= ClientTheme.currentTheme.getField("RegularText") as Color;
    fontFamily ??= ClientTheme.currentTheme.getField("RegularFontFamily");
    return TextStyle(
      color: textColor,
      fontSize: size,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      decoration: TextDecoration.none,
    );
  }
}
