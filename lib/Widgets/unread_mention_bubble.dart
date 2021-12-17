import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';

class UnreadMentionBubble extends StatelessWidget {
  const UnreadMentionBubble({Key? key, required this.count}) : super(key: key);
  final int count;
  @override
  Widget build(BuildContext context) {
    if (count <= 0) return const SizedBox.shrink();
    return Container(
        decoration: BoxDecoration(
            color: ClientTheme.currentTheme.getField("UnreadChatBubbleColor"),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
            child: Text(
              count.toString(),
              style: TextDisplay.create(size: 18, textColor: TextColor.White),
            )));
  }
}
