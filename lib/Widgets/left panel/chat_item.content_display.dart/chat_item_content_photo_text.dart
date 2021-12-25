import 'package:flutter/material.dart';
import 'package:myapp/Widgets/display_text.dart';

class ChatItemContentPhotoText {
  static List<InlineSpan> build(Widget? photo, String text) {
    return [
      if (photo != null)
        WidgetSpan(child: SizedBox(width: 20, height: 20, child: photo)),
      if (photo != null) const WidgetSpan(child: SizedBox(width: 4)),
      TextSpan(text: text, style: TextDisplay.chatItemAccent),
      const WidgetSpan(child: SizedBox(width: 8))
    ];
  }
}
