import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:myapp/utils.dart';

class TextDisplay {
  static String _getEmojiFont() => "TwitterColorEmoji";

  static TextStyle get title => create(size: 24, fontWeight: FontWeight.w600, textColor: TextColor.HeaderMain);
  static TextStyle get additional => create(textColor: TextColor.AdditionalTextColor, size: 16);
  static TextStyle get introTitle => create(size: 26, textColor: TextColor.Accent);
  static TextStyle get draftText => create(size: 18, textColor: TextColor.Draft);
  static TextStyle get regular16 => create(size: 16);
  static TextStyle get regular18 => create(size: 18);
  static TextStyle get regular20 => create(size: 20);
  static TextStyle get bold18 => create(size: 18, fontWeight: FontWeight.bold);
  static TextStyle get bold20 => create(size: 20, fontWeight: FontWeight.bold);
  static TextStyle get actionBarOffline => create(size: 16, textColor: TextColor.HeaderSecondary);
  static const String greaterImportance = "Ubuntu";
  static const String regular = "SourceSansPro";
  static const String monospace = "CodeSourcePro";
  static const String emojiFont = "emoji";

  static TextStyle get chatTittleSelected =>
      create(size: 18, fontWeight: FontWeight.bold, textColor: TextColor.SelectedHeaderMain, fontFamily: greaterImportance);

  static TextStyle get chatTittle =>
      create(size: 18, fontWeight: FontWeight.bold, textColor: TextColor.HeaderMain, fontFamily: greaterImportance);
  static TextStyle get chatItemAccent => create(size: 18, textColor: TextColor.Accent);
  static TextStyle get chatItemAccentSelected => create(size: 18, textColor: TextColor.White);

  static InlineSpan emoji(String emoji, TextStyle style) {
    return TextSpan(
      text: emoji,
      style: TextStyle(
        fontWeight: style.fontWeight,
        color: style.color,
        fontFamily: _getEmojiFont(),
        fontSize: style.fontSize,
        shadows: style.shadows,
        decoration: style.decoration,
      ),
    );
  }

  static Map<Type?, String> replacementPairs = {
    TextEntityTypeBold: "B",
    TextEntityTypeStrikethrough: "S",
    TextEntityTypeUnderline: "U",
    TextEntityTypeItalic: "I",
    TextEntityTypePre: "M",
    TextEntityTypeCode: "M",
    TextEntityTypeTextUrl: "L",
    TextEntityTypeUrl: "R",
    null: "-"
  };

  static Map<String, TextStyle Function()> stylePairs = {
    "B": () => create(
          fontWeight: FontWeight.bold,
        ),
    "-": () => create(),
    "M": () => create(
          fontFamily: monospace,
        ),
    "S": () => create(
          decoration: TextDecoration.lineThrough,
        ),
    "U": () => create(
          decoration: TextDecoration.underline,
        ),
    "I": () => create(
          fontStyle: FontStyle.italic,
        ),
    "L": () => create(
          decoration: TextDecoration.underline,
          customTextColor: ClientTheme.currentTheme.getField("HyperlinkColor"),
        ),
    "R": () => create(
          decoration: TextDecoration.underline,
          customTextColor: ClientTheme.currentTheme.getField("HyperlinkColor"),
        ),
  };

  static final List<Type> _interactiveTextEnteties = [
    TextEntityTypeTextUrl,
    TextEntityTypeUrl,
  ];

  static List<InlineSpan> parseFormattedText(FormattedText text,
      [double size = 20, Color? textColor, bool interactiveEnable = false, Function(String)? onUrlClick]) {
    String str = "-" * text.text!.length;
    for (int i = 0; i < (text.entities?.length ?? 0); i++) {
      if (!interactiveEnable && _interactiveTextEnteties.contains(text.entities![i].type.runtimeType)) {
        text.entities![i].type = null;
      }
      str = str.replaceRange(
        text.entities![i].offset!,
        text.entities![i].offset! + text.entities![i].length!,
        (replacementPairs[text.entities![i].type.runtimeType] ?? "/") * text.entities![i].length!,
      );
    }

    List<InlineSpan> result = [];

    var matches = RegExp(r"(?=(.))\1{1,}", unicode: true).allMatches(str);
    int entetieIndex = 0;
    for (var element in matches) {
      var textEntety = str[element.start] == "-" ? null : (text.entities![entetieIndex]);
      var style = stylePairs[str[element.start]];
      var recognizer = textEntety?.type is TextEntityTypeTextUrl || textEntety?.type is TextEntityTypeUrl
          ? (TapGestureRecognizer()
            ..onTap = () {
              if (onUrlClick != null) {
                switch (textEntety!.type.runtimeType) {
                  case TextEntityTypeTextUrl:
                    onUrlClick((textEntety.type as TextEntityTypeTextUrl).url!);
                    break;
                  case TextEntityTypeUrl:
                    onUrlClick(text.text!.substring(textEntety.offset!, textEntety.offset! + textEntety.length!));
                    break;
                }
              }
            })
          : null;
      var textStyle = style == null
          ? create(
              size: size,
              customTextColor: textColor,
            )
          : style();
      textStyle = textStyle.copyWith(
        color: textStyle.color == null ? textColor : null,
        fontSize: size,
      );
      var parsedStr = parseEmojiInString(
        text.text!.substring(element.start, element.end),
        textStyle,
        recognizer,
      );
      result.addAll(parsedStr);
      if (str[element.start] != "-") {
        entetieIndex++;
      }
    }

    return result;
  }

  static List<InlineSpan> parseEmojiInString(String text, [TextStyle? style, GestureRecognizer? recognizer]) {
    style ??= create();
    List<InlineSpan> result = [];
    var matches = emojiRegex.allMatches(text);

    int pos = 0;
    if (matches.isEmpty) {
      result.add(TextSpan(text: text, style: style, recognizer: recognizer));
      pos = text.length;
    }
    for (var element in matches) {
      if (pos != element.start) {
        result.add(
          TextSpan(
            text: text.substring(pos, element.start),
            style: style,
            recognizer: recognizer,
          ),
        );
        pos = element.start;
      }
      result.add(
        emoji(
          text.substring(element.start, element.end),
          style,
        ),
      );
      pos = element.end;
    }

    if (pos != text.length) {
      result.add(
        TextSpan(
          text: text.substring(pos, text.length),
          style: style,
          recognizer: recognizer,
        ),
      );
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
    Color? color;
    if (textColor != null) color = getColor(textColor);
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

  static Color getColor(TextColor clr) => ClientTheme.currentTheme.getField(
        clr.toString().replaceFirst(
              "TextColor.",
              "",
            ),
      ) as Color;
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
  MessageTextColor,
}
