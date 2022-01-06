import 'package:flutter/cupertino.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';

/// Wrapper for [content] that will be displayed besides of main message part
/// most offen its info about time and read status in gifs, stickers, images, other non-text content
/// * [content] content that will be wrapped
class MessageInfoBubbleBase extends StatelessWidget {
  const MessageInfoBubbleBase({Key? key, required this.content})
      : super(key: key);
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          child: content),
      decoration: BoxDecoration(
          color: ClientTheme.currentTheme.getField("MessageInfoBubbleColor"),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
    );
  }
}
