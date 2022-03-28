import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/scale_utils.dart';

class UnreadCountBubble extends StatelessWidget {
  const UnreadCountBubble({
    Key? key,
    required this.count,
    this.important = false,
    this.fontSize = 18,
  }) : super(key: key);

  final int count;
  final bool important;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    if (count <= 0) return const SizedBox.shrink();
    return Container(
      decoration: BoxDecoration(
        color: ClientTheme.currentTheme.getField(
          important ? "UnreadMentionChatBubbleColor" : "UnreadChatBubbleColor",
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(p(8)),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: p(1), horizontal: p(4)),
        child: Text(
          count.toString(),
          style: TextDisplay.create(
            size: fontSize,
            textColor:
                ClientTheme.currentTheme.getField("UnreadChatBubbleTextColor"),
            fontFamily: TextDisplay.greaterImportance,
          ),
        ),
      ),
    );
  }
}
