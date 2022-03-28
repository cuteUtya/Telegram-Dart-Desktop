import 'package:flutter/material.dart';
import 'package:myapp/scale_utils.dart';

class ChatItemContentPhotoText {
  static List<InlineSpan> build(
    Widget? photo,
    String text,
    TextStyle textStyle,
  ) {
    return [
      if (photo != null)
        WidgetSpan(child: SizedBox(width: p(13), height: p(13), child: photo)),
      if (photo != null) const WidgetSpan(child: SizedBox(width: 4)),
      TextSpan(text: text, style: textStyle),
      const WidgetSpan(
        child: SizedBox(width: 2),
      ),
    ];
  }
}
