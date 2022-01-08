import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:myapp/utils.dart';

class TextDisplay {
  static String _getEmojiFont() => "AppleColorEmoji";

  static TextStyle get title => create(
      size: 24, fontWeight: FontWeight.w600, textColor: TextColor.HeaderMain);
  static TextStyle get additional =>
      create(textColor: TextColor.AdditionalTextColor, size: 16);
  static TextStyle get introTitle =>
      create(size: 26, textColor: TextColor.Accent);
  static TextStyle get draftText =>
      create(size: 18, textColor: TextColor.Draft);
  static TextStyle get regular16 => create(size: 16);
  static TextStyle get regular18 => create(size: 18);
  static TextStyle get regular20 => create(size: 20);
  static TextStyle get bold18 => create(size: 18, fontWeight: FontWeight.bold);
  static TextStyle get bold20 => create(size: 20, fontWeight: FontWeight.bold);
  static TextStyle get actionBarOffline =>
      create(size: 16, textColor: TextColor.HeaderSecondary);
  static const String greaterImportance = "Ubuntu";
  static const String regular = "SourceSansPro";
  static const String monospace = "CodeSourcePro";
  static const String emojiFont = "emoji";

  static TextStyle get chatTittleSelected => create(
      size: 18,
      fontWeight: FontWeight.bold,
      textColor: TextColor.SelectedHeaderMain,
      fontFamily: greaterImportance);

  static TextStyle get chatTittle => create(
      size: 18,
      fontWeight: FontWeight.bold,
      textColor: TextColor.HeaderMain,
      fontFamily: greaterImportance);
  static TextStyle get chatItemAccent =>
      create(size: 18, textColor: TextColor.Accent);
  static TextStyle get chatItemAccentSelected =>
      create(size: 18, textColor: TextColor.White);

  static InlineSpan emoji(String emoji, TextStyle style) {
    return TextSpan(
        text: emoji,
        style: TextStyle(
            fontWeight: style.fontWeight,
            color: style.color,
            fontFamily: _getEmojiFont(),
            fontSize: style.fontSize,
            shadows: style.shadows,
            decoration: style.decoration));
  }

  static Map<Type?, String> replacementPairs = {
    TextEntityTypeBold: "B",
    TextEntityTypeStrikethrough: "S",
    TextEntityTypeUnderline: "U",
    TextEntityTypeItalic: "I",
    TextEntityTypePre: "M",
    TextEntityTypeCode: "M",
    null: "-"
  };

  static Map<String, TextStyle Function(double size, TextColor color)>
      stylePairs = {
    "B": (s, c) => create(size: s, fontWeight: FontWeight.bold, textColor: c),
    "-": (s, c) => create(size: s, textColor: c),
    "M": (s, c) => create(size: s, fontFamily: monospace, textColor: c),
    "S": (s, c) =>
        create(size: s, decoration: TextDecoration.lineThrough, textColor: c),
    "U": (s, c) =>
        create(size: s, decoration: TextDecoration.underline, textColor: c),
    "I": (s, c) => create(size: s, fontStyle: FontStyle.italic, textColor: c)
  };

  static List<InlineSpan> parseFormattedText(FormattedText text,
      [double size = 20, TextColor textColor = TextColor.RegularText]) {
    String str = "-" * text.text!.length;
    for (int i = 0; i < (text.entities?.length ?? 0); i++) {
      str = str.replaceRange(
          text.entities![i].offset!,
          text.entities![i].offset! + text.entities![i].length!,
          (replacementPairs[text.entities![i].type.runtimeType] ?? "/") *
              text.entities![i].length!);
    }

    List<InlineSpan> result = [];

    var matches = RegExp(r"(?=(.))\1{1,}", unicode: true).allMatches(str);
    matches.forEach((element) {
      var style = stylePairs[str[element.start]];
      result.addAll(parseEmojiInString(
          text.text!.substring(element.start, element.end),
          style == null
              ? create(size: size, textColor: textColor)
              : style(size, textColor)));
    });

    return result;
  }

  /// Outlines a text using shadows.
  static List<Shadow> outlinedText(
      {double strokeWidth = 2,
      Color strokeColor = Colors.black,
      int precision = 5}) {
    List<Shadow> result = [];
    for (int x = 1; x < strokeWidth + precision; x++) {
      for (int y = 1; y < strokeWidth + precision; y++) {
        double offsetX = x.toDouble();
        double offsetY = y.toDouble();
        result.add(Shadow(
            offset: Offset(-strokeWidth / offsetX, -strokeWidth / offsetY),
            color: strokeColor));
        result.add(Shadow(
            offset: Offset(-strokeWidth / offsetX, strokeWidth / offsetY),
            color: strokeColor));
        result.add(Shadow(
            offset: Offset(strokeWidth / offsetX, -strokeWidth / offsetY),
            color: strokeColor));
        result.add(Shadow(
            offset: Offset(strokeWidth / offsetX, strokeWidth / offsetY),
            color: strokeColor));
      }
    }
    return result.toList();
  }

  static List<InlineSpan> parseEmojiInString(String text, [TextStyle? style]) {
    style ??= create();
    List<InlineSpan> result = [];
    var matches = emojiRegex.allMatches(text);

    int pos = 0;
    if (matches.isEmpty) {
      result.add(TextSpan(text: text, style: style));
      pos = text.length;
    }
    matches.forEach((element) {
      if (pos != element.start) {
        result.add(
            TextSpan(text: text.substring(pos, element.start), style: style));
        pos = element.start;
      }
      result.add(emoji(text.substring(element.start, element.end), style!));
      pos = element.end;
    });

    if (pos != text.length) {
      result
          .add(TextSpan(text: text.substring(pos, text.length), style: style));
    }

    return result;
  }

  static TextStyle create(
      {double size = 20,
      FontStyle? fontStyle = FontStyle.normal,
      String? fontFamily,
      TextColor? textColor,
      FontWeight? fontWeight = FontWeight.normal,
      TextAlign? textAlign = TextAlign.left,
      TextOverflow? overflow,
      TextDecoration decoration = TextDecoration.none,
      Color? customTextColor}) {
    fontFamily ??= regular;
    textColor ??= TextColor.RegularText;
    var color = getColor(textColor);
    if (fontFamily == "emoji") {
      fontFamily = _getEmojiFont();
    }
    return TextStyle(
      overflow: overflow,
      color: customTextColor ?? color,
      fontSize: size,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      decoration: decoration,
    );
  }

  static Color getColor(TextColor clr) => ClientTheme.currentTheme
      .getField(clr.toString().replaceFirst("TextColor.", "")) as Color;
}

enum TextColor {
  Accent,
  HeaderMain,
  SelectedHeaderMain,
  HeaderSecondary,
  AdditionalTextColor,
  RegularText,
  DangerColor,
  Transparent,
  ChatLastTimeMessage,
  SelectedChatLastTimedMessage,
  PeerNameTextColor,
  Draft,
  White,
  OnlineColor,
  MessageTextColor
}
