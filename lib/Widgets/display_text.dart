import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/Links%20utils/linksOpener.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;
import 'package:myapp/utils.dart';
import 'package:collection/collection.dart';

class TextDisplay {
  static String getEmojiFont() => "AppleColorEmoji";

  static TextStyle get title => create(
      size: 24,
      fontWeight: FontWeight.w600,
      textColor: ClientTheme.currentTheme.getField("HeaderMain"));
  static TextStyle get additional => create(
      textColor: ClientTheme.currentTheme.getField("AdditionalTextColor"),
      size: 16);
  static TextStyle get introTitle =>
      create(size: 26, textColor: ClientTheme.currentTheme.getField("Accent"));
  static TextStyle get draftText =>
      create(size: 18, textColor: ClientTheme.currentTheme.getField("Draft"));
  static TextStyle get regular16 => create(size: 16);
  static TextStyle get regular18 => create(size: 18);
  static TextStyle get regular20 => create(size: 20);
  static TextStyle get bold18 => create(size: 18, fontWeight: FontWeight.bold);
  static TextStyle get bold20 => create(size: 20, fontWeight: FontWeight.bold);
  static TextStyle get actionBarOffline => create(
      size: font(14),
      textColor: ClientTheme.currentTheme.getField("ActionBarTextColor"));
  static const String greaterImportance = "SFPro";
  static const String regular = "SFPro";
  static const String monospace = "CodeSourcePro";

  static TextStyle get chatTittleSelected => create(
      size: p(14),
      fontWeight: FontWeight.bold,
      textColor: ClientTheme.currentTheme.getField("SelectedHeaderMain"),
      fontFamily: greaterImportance);

  static TextStyle get chatTittle => create(
      size: p(14),
      fontWeight: FontWeight.bold,
      textColor: ClientTheme.currentTheme.getField("HeaderMain"),
      fontFamily: greaterImportance);
  static TextStyle get chatItemAccent =>
      create(size: 18, textColor: ClientTheme.currentTheme.getField("Accent"));

  static TextSpan emoji(String emoji, {TextStyle? style}) {
    style ??= const TextStyle();
    return TextSpan(
      text: emoji,
      style: style.copyWith(
        fontFamily: getEmojiFont(),
      ),
    );
  }

  static List<InlineSpan> parseFormattedText(
    FormattedText text, {
    double size = 20,
    Color? textColor,
    bool interactiveEnable = false,
  }) {
    List<int> points = [];
    if (text.entities != null) {
      for (var e in text.entities!) {
        points.add(e.offset!);
        points.add(e.offset! + e.length!);
      }
    }

    var parsed = _textEntety(text: text.text!).split(points);
    assert(parsed.isNotEmpty);
    for (var entety in parsed) {
      text.entities?.forEach(
        (p) {
          if (p.offset! <= entety.from &&
              (p.offset! + p.length!) >= entety.to) {
            entety.appliedEnteties!.add(p);
          }
        },
      );
    }
    List<InlineSpan> parsedText = [];

    for (var e in parsed) {
      parsedText.addAll(
        e.parseToText(
          size: size,
          interactiveEnable: interactiveEnable,
          color: textColor,
        ),
      );
    }

    return parsedText;
  }

  static InlineSpan parseEmojiInString(String text,
      [TextStyle? style, GestureRecognizer? recognizer]) {
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

class _textEntety {
  _textEntety({
    required this.text,
    this.appliedEnteties,
    this.fullText = "",
    this.from = 0,
    this.to = 0,
  }) {
    appliedEnteties = [];
  }

  int from;
  int to;
  String text;
  String fullText;
  List<TextEntity>? appliedEnteties;

  final Map<String, Function(TextEntity, String)> _onTextEntetyClick = {
    "TextEntityTypeTextUrl": (textEntety, _) =>
        UrlsUtils.openLink((textEntety.type as TextEntityTypeTextUrl).url!),
    "TextEntityTypeUrl": (textEntety, text) => UrlsUtils.openLink(
        text.substring(
            textEntety.offset!, textEntety.offset! + textEntety.length!)),
    "TextEntityTypeMentionName": (textEntety, text) => UrlsUtils.openLink(
        "tg://open?id=${(textEntety.type as TextEntityTypeMentionName).userId}"),
    "TextEntityTypeMention": (textEntety, text) => UrlsUtils.openLink(
        "tg://open?username=${text.substring(textEntety.offset! + 1, textEntety.offset! + textEntety.length!)}")
  };

  List<InlineSpan> parseColortags(
    TextStyle textStyle, {
    required double size,
    bool interactiveEnable = false,
    Color? textColor,
    TapGestureRecognizer? recognizer,
  }) {
    List<InlineSpan> result = [];

    InlineSpan parseToInline(String text) => TextDisplay.parseEmojiInString(
          text,
          textStyle,
          recognizer,
        );

    if (ClientTheme.hexRegex.hasMatch(text)) {
      var matches = ClientTheme.hexRegex.allMatches(text).toList();
      if (matches.first.start != 0) {
        result.add(
          parseToInline(
            text.substring(0, matches.first.start),
          ),
        );
      }
      for (int i = 0; i < matches.length; i++) {
        var hex = text.substring(matches[i].start, matches[i].end);
        result.add(
          TextDisplay.parseEmojiInString(
            hex,
            textStyle.copyWith(
              color:
                  textColor ?? ClientTheme.currentTheme.getField("HEXtagColor"),
            ),
          ),
        );
        Widget colorSquare = Container(
          margin: const EdgeInsets.only(left: 2),
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: ClientTheme.hexToColor(
              hex,
              // TODO maybe have sense to put it in settings
              useARGB: true,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        );
        if (interactiveEnable) {
          colorSquare = Tooltip(
              triggerMode: TooltipTriggerMode.tap,
              message: UIManager.isMobile ? "Color copied" : "Click to copy",
              //TODO put it colors to theme
              textStyle: TextDisplay.create(size: 14, textColor: Colors.white),
              child: colorSquare);
        }
        result.add(
          WidgetSpan(
            placeholderDimensions: [
              PlaceholderDimensions(
                  size: Size(size + 2, size),
                  alignment: PlaceholderAlignment.middle)
            ],
            child: GestureDetector(
                onTap: interactiveEnable
                    ? () => Clipboard.setData(
                          ClipboardData(text: hex),
                        )
                    : null,
                child: colorSquare),
          ),
        );

        if (i < matches.length - 1) {
          if (matches[i].end != matches[i + 1].start) {
            result.add(
              parseToInline(
                text.substring(matches[i].end, matches[i + 1].start),
              ),
            );
          }
        }
      }
      if (matches.last.end != text.length) {
        result.add(parseToInline(
          text.substring(matches.last.end, text.length),
        ));
      }
    } else {
      result.add(
        parseToInline(text),
      );
    }

    return result;
  }

  List<InlineSpan> parseToText(
      {required double size, bool interactiveEnable = false, Color? color}) {
    bool haveEnteryWithType(Type p) =>
        appliedEnteties!.firstWhereOrNull((e) => e.type.runtimeType == p) !=
        null;

    var isItalic = haveEnteryWithType(TextEntityTypeItalic);
    var isBold = haveEnteryWithType(TextEntityTypeBold);
    var isUnderline = haveEnteryWithType(TextEntityTypeUnderline);
    var isLineThgough = haveEnteryWithType(TextEntityTypeStrikethrough);
    var isLink = haveEnteryWithType(TextEntityTypeTextUrl) ||
        haveEnteryWithType(TextEntityTypeUrl);
    var isHashTag = haveEnteryWithType(TextEntityTypeHashtag);
    var isMention = haveEnteryWithType(TextEntityTypeMention) ||
        haveEnteryWithType(TextEntityTypeMentionName);

    var defaultStyle = TextDisplay.create(
      size: size,
      textColor: color,
    );

    var interactiveEntety = appliedEnteties!.firstWhereOrNull(
      (e) => _onTextEntetyClick[e.type.runtimeType.toString()] != null,
    );

    var onClick =
        _onTextEntetyClick[interactiveEntety?.type.runtimeType.toString()];

    var tapRecognizer = onClick == null || !interactiveEnable
        ? null
        : (TapGestureRecognizer()
          ..onTap = () {
            onClick(
              interactiveEntety!,
              fullText,
            );
          });

    Color? affectedColor = isLink
        ? ClientTheme.currentTheme.getField("HyperlinkColor")
        : isHashTag || isMention
            ? ClientTheme.currentTheme.getField("MentionEntityColor")
            : null;

    return parseColortags(
      defaultStyle.copyWith(
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: affectedColor,
        decoration: isUnderline || isLineThgough
            ? TextDecoration.combine([
                isUnderline
                    ? TextDecoration.underline
                    : TextDecoration.lineThrough,
                isLineThgough
                    ? TextDecoration.lineThrough
                    : TextDecoration.underline,
              ])
            : TextDecoration.none,
      ),
      size: size,
      interactiveEnable: interactiveEnable,
      recognizer: tapRecognizer,
    );
  }

  List<_textEntety> split(List<int> points) {
    points.sort((a, b) => a.compareTo(b));
    points = LinkedHashSet<int>.from(points).toList();
    String b = "";
    void print(Object s) => b += "$s\n";
    print(points);
    List<_textEntety> strings = [];

    void add(int from, int to) {
      strings.add(
        _textEntety(
          text: text.substring(from, to),
          from: from,
          to: to,
          fullText: text,
        ),
      );
    }

    if (points.isNotEmpty) {
      if (points[0] != 0) {
        add(0, points[0]);
      }
      for (int i = 0; i < points.length - 1; i++) {
        var start = points[i];
        var end = points[i + 1];
        add(start, end);
      }
      if (points.last != text.length) {
        add(points.last, text.length);
      }
      print(strings);
    } else {
      add(0, text.length);
    }
    return strings;
  }
}
