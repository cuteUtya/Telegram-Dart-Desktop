import 'package:flutter/cupertino.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';

class MessageInfoBubbleBase extends StatelessWidget {
  const MessageInfoBubbleBase({Key? key, required this.content})
      : super(key: key);
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6), child: content),
      decoration: BoxDecoration(
          color: ClientTheme.currentTheme.getField("MessageInfoBubbleColor"),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
    );
  }
}
