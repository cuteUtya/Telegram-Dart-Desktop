import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:myapp/utils.dart';

class TextDisplay {
  static String getEmojiFont() => "AppleColorEmoji";

  static TextStyle get title =>
      create(size: 24, fontWeight: FontWeight.w600, textColor: ClientTheme.currentTheme.getField("HeaderMain"));
  static TextStyle get additional => create(textColor: ClientTheme.currentTheme.getField("AdditionalTextColor"), size: 16);
  static TextStyle get introTitle => create(size: 26, textColor: ClientTheme.currentTheme.getField("Accent"));
  static TextStyle get draftText => create(size: 18, textColor: ClientTheme.currentTheme.getField("Draft"));
  static TextStyle get regular16 => create(size: 16);
  static TextStyle get regular18 => create(size: 18);
  static TextStyle get regular20 => create(size: 20);
  static TextStyle get bold18 => create(size: 18, fontWeight: FontWeight.bold);
  static TextStyle get bold20 => create(size: 20, fontWeight: FontWeight.bold);
  static TextStyle get actionBarOffline => create(size: 16, textColor: ClientTheme.currentTheme.getField("ActionBarTextColor"));
  static const String greaterImportance = "Ubuntu";
  static const String regular = "SourceSansPro";
  static const String monospace = "CodeSourcePro";

  static TextStyle get chatTittleSelected => create(
      size: 18,
      fontWeight: FontWeight.bold,
      textColor: ClientTheme.currentTheme.getField("SelectedHeaderMain"),
      fontFamily: greaterImportance);

  static TextStyle get chatTittle => create(
      size: 18,
      fontWeight: FontWeight.bold,
      textColor: ClientTheme.currentTheme.getField("HeaderMain"),
      fontFamily: greaterImportance);
  static TextStyle get chatItemAccent => create(size: 18, textColor: ClientTheme.currentTheme.getField("Accent"));

  static TextSpan emoji(String emoji, {TextStyle? style}) {
    style ??= const TextStyle();
    return TextSpan(
      text: emoji,
      style: style.copyWith(
        fontFamily: getEmojiFont(),
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
    TextEntityTypeMention: "P",
    TextEntityTypeMentionName: "P",
    null: "-"
  };

  static Map<String, TextStyle Function()> stylePairs = {
    "B": () => create(fontWeight: FontWeight.bold, textColor: ClientTheme.currentTheme.getField("BoldTextColor")),
    "-": () => create(),
    "M": () => create(
          fontFamily: monospace,
          textColor: ClientTheme.currentTheme.getField("MonospaceTextColor"),
          backgroundColor: ClientTheme.currentTheme.getField("MonospaceTextBackgroundColor"),
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
          textColor: ClientTheme.currentTheme.getField("HyperlinkColor"),
        ),
    "R": () => create(
          textColor: ClientTheme.currentTheme.getField("HyperlinkColor"),
        ),
    "P": () => create(
          textColor: ClientTheme.currentTheme.getField("MentionEntityColor"),
        )
  };

  static final List<Type> _interactiveTextEnteties = [
    TextEntityTypeTextUrl,
    TextEntityTypeUrl,
  ];

  static List<InlineSpan> parseFormattedText(FormattedText text,
      {double size = 20, Color? textColor, bool interactiveEnable = false, Function(String)? onUrlClick}) {
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
      var recognizer = textEntety?.type is TextEntityTypeTextUrl ||
              textEntety?.type is TextEntityTypeUrl ||
              textEntety?.type is TextEntityTypeMention ||
              textEntety?.type is TextEntityTypeMentionName
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
                  case TextEntityTypeMention:
                    onUrlClick(
                        "tg://open?username=${text.text!.substring(textEntety.offset! + 1, textEntety.offset! + textEntety.length!)}");
                    break;
                  case TextEntityTypeMentionName:
                    onUrlClick("tg://open?id=${(textEntety.type as TextEntityTypeMentionName).userId}");
                    break;
                }
              }
            })
          : null;
      var textStyle = style == null
          ? create(
              size: size,
              textColor: ClientTheme.currentTheme.getField("MessageTextColor"),
            )
          : style();
      textStyle = textStyle.copyWith(
        color: textColor,
        fontSize: size,
      );
      var parsedStr = parseEmojiInString(
        text.text!.substring(element.start, element.end),
        textStyle,
        recognizer,
      );
      result.add(parsedStr);
      if (str[element.start] != "-") {
        entetieIndex++;
      }
    }

    return result;
  }

  static InlineSpan parseEmojiInString(String text, [TextStyle? style, GestureRecognizer? recognizer]) {
    return TextSpan(
      text: text,
      style: style?.copyWith(fontFamilyFallback: [
        getEmojiFont(),
        style.fontFamily ?? "Arial",
      ]),
      recognizer: recognizer,
    );
  }

  static TextStyle create(
      {double size = 20,
      FontStyle? fontStyle = FontStyle.normal,
      String? fontFamily,
      Color? textColor,
      Color? backgroundColor,
      FontWeight? fontWeight = FontWeight.normal,
      TextAlign? textAlign = TextAlign.left,
      TextOverflow? overflow,
      TextDecoration decoration = TextDecoration.none}) {
    fontFamily ??= regular;
    textColor ??= ClientTheme.currentTheme.getField("RegularText");
    if (fontFamily == "emoji") {
      fontFamily = getEmojiFont();
    }
    return TextStyle(
      overflow: overflow,
      color: textColor,
      fontSize: size,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      backgroundColor: backgroundColor,
      fontFamily: fontFamily,
      decoration: decoration,
    );
  }
}
