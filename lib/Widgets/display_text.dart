import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;

class TextDisplay {
  static String _getEmojiFont() => "AppleColorEmoji";

  static TextStyle get title => create(
      size: 24, fontWeight: FontWeight.w600, textColor: TextColor.HeaderMain);
  static TextStyle get additional =>
      create(textColor: TextColor.AdditionalTextColor, size: 16);
  static TextStyle get introTitle =>
      create(size: 26, textColor: TextColor.Accent);
  static TextStyle get regular16 => create(size: 16);
  static TextStyle get regular18 => create(size: 18);
  static TextStyle get regular20 => create(size: 20);
  static TextStyle get bold18 => create(size: 18, fontWeight: FontWeight.bold);
  static TextStyle get bold20 => create(size: 20, fontWeight: FontWeight.bold);
  static const String greaterImportance = "Ubuntu";
  static const String regular = "Roboto";
  static const String monospace = "CodeSourcePro";
  static const String emojiFont = "emoji";

  static TextStyle get chatTittle => create(
      size: 20,
      fontWeight: FontWeight.bold,
      textColor: TextColor.HeaderMain,
      fontFamily: greaterImportance);
  static TextStyle get chatItemAccent =>
      create(size: 18, textColor: TextColor.Accent);

  static InlineSpan emoji(String emoji, double size,
      {FontWeight? weight, Color? color}) {
    return TextSpan(
        text: emoji,
        style: TextStyle(
            fontWeight: weight,
            color: color,
            fontFamily: _getEmojiFont(),
            fontSize: size,
            decoration: TextDecoration.none));
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

  static Map<String, TextStyle Function(double size)> stylePairs = {
    "B": (s) => create(size: s, fontWeight: FontWeight.bold),
    "-": (s) => create(size: s),
    "M": (s) => create(size: s, fontFamily: monospace /*SOURCE CODE PRO*/
        ),
    "S": (s) => create(size: s, decoration: TextDecoration.lineThrough),
    "U": (s) => create(size: s, decoration: TextDecoration.underline),
    "I": (s) => create(size: s, fontStyle: FontStyle.italic)
  };

  static List<InlineSpan> parseFormattedText(FormattedText text,
      [double size = 20]) {
    List<_textSection> textMap = [];
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
          style == null ? create(size: 18) : style(18)));
    });

    return result;
  }

  static List<InlineSpan> parseEmojiInString(String text, [TextStyle? style]) {
    style ??= create();
    List<InlineSpan> result = [];
    var matches = RegExp(
            r"([^ABCČĆDĐEFGHIJKLMNOPQRSŠTUVWXYZŽabcčćdđefghijklmnopqrsštuvwxyzžАБВГҐДЂЕЁЄЖЗЅИІЇЙЈКЛЉМНЊОПРСТЋУЎФХЦЧЏШЩЪЫЬЭЮЯабвгґдђеёєжзѕиіїйјклљмнњопрстћуўфхцчџшщъыьэюяΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩαβγδεζηθικλμνξοπρστυφχψωάΆέΈέΉίϊΐΊόΌύΰϋΎΫὰάὲέὴήὶίὸόὺύὼώΏ1234567890‘?’“!”(%)\[#\]{@}\/&\<\-+÷×=>®©$€£¥¢:;,.*\n ]){1,}")
        .allMatches(text);

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
      result.add(emoji(
          text.substring(element.start, element.end), style!.fontSize!,
          weight: style.fontWeight!, color: style.color));
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
      TextDecoration decoration = TextDecoration.none}) {
    fontFamily ??= regular;
    textColor ??= TextColor.RegularText;
    var color = getColor(textColor);
    if (fontFamily == "emoji") {
      fontFamily = _getEmojiFont();
    }
    return TextStyle(
      overflow: overflow,
      color: color,
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
  HeaderSecondary,
  AdditionalTextColor,
  RegularText,
  DangerColor,
  Transparent,
  ChatLastTimeMessage,
  PeerNameTextColor,
  Draft,
  White
}

class _textSection {
  const _textSection(this.text, this.type);
  final String text;
  final Type? type;
}
