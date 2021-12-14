import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';

class ChatItemContentIconText {
  static Color get iconClr =>
      ClientTheme.currentTheme.getField("TextInlineIconsColor");
  static List<InlineSpan> build(IconData icon, String text,
      {Color? iconColor}) {
    return [
      WidgetSpan(child: Icon(icon, color: iconColor ?? iconClr)),
      const WidgetSpan(child: SizedBox(width: 4)),
      TextSpan(text: text, style: TextDisplay.chatItemAccent)
    ];
  }
}
