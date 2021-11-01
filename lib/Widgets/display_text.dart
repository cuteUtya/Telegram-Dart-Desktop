import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';

class TextDisplay {
  static Widget H2(String text) {
    return H1(text,
        size: 28,
        textColor:
            ClientTheme.currentTheme.getField("HeaderSecondary") as Color);
  }

  static Widget H1(String text,
      {double size = 36,
      Color? textColor,
      String? fontFamily,
      FontWeight weight = FontWeight.bold}) {
    fontFamily ??= ClientTheme.currentTheme.getField("HeaderFontFamily");
    textColor ??= ClientTheme.currentTheme.getField("HeaderMain") as Color;
    return Regular(text,
        size: size,
        fontWeight: weight,
        fontFamily: fontFamily,
        textColor: textColor);
  }

  static Widget Regular(String text,
      {double size = 18,
      FontStyle fontStyle = FontStyle.normal,
      String? fontFamily,
      Color? textColor,
      FontWeight fontWeight = FontWeight.normal,
      TextAlign textAlign = TextAlign.center}) {
    textColor ??= ClientTheme.currentTheme.getField("RegularText") as Color;
    fontFamily ??= ClientTheme.currentTheme.getField("RegularFontFamily");
    return Text(text,
        style: TextStyle(
          color: textColor,
          fontSize: size,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
          decoration: TextDecoration.none,
        ),
        textAlign: textAlign);
  }
}
