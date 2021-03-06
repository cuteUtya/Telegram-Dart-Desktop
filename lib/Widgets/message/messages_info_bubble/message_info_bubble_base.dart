import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/blured_widget.dart';

/// Wrapper for [content] that will be displayed besides of main message part
/// most offen its info about time and read status in gifs, stickers, images, other non-text content
/// * [content] content that will be wrapped
class MessageInfoBubbleBase extends StatelessWidget {
  const MessageInfoBubbleBase({
    Key? key,
    required this.content,
    this.radius = const BorderRadius.all(Radius.circular(10)),
    this.padding = const EdgeInsets.symmetric(
      horizontal: 6,
      vertical: 2,
    ),
  }) : super(key: key);

  final Widget content;
  final BorderRadius radius;
  final EdgeInsets padding;

  static Widget forBig(Widget content) {
    return MessageInfoBubbleBase(
      content: content,
      radius: const BorderRadius.all(Radius.circular(12)),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundBlur(
      radius: radius,
      blur: ImageFilter.blur(
        sigmaX: 8,
        sigmaY: 8,
      ),
      child: Container(
        child: Padding(padding: padding, child: content),
        color: ClientTheme.currentTheme.getField("MessageInfoBubbleColor"),
      ),
    );
  }
}
