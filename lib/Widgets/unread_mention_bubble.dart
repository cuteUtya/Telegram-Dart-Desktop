import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';

class UnreadCountBubble extends StatelessWidget {
  const UnreadCountBubble({
    Key? key,
    required this.count,
    this.important = false,
    this.fontSize = 18,
  }) : super(key: key);

  final int count;
  final bool important;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    if (count <= 0) return const SizedBox.shrink();
    return Container(
      decoration: BoxDecoration(
        color: ClientTheme.currentTheme.getField(
          important ? "UnreadMentionChatBubbleColor" : "UnreadChatBubbleColor",
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
        child: Text(
          count.toString(),
          style: TextDisplay.create(
            size: fontSize ?? 18,
            textColor:
                ClientTheme.currentTheme.getField("UnreadChatBubbleTextColor"),
            fontFamily: TextDisplay.greaterImportance,
          ),
        ),
      ),
    );
  }
}
