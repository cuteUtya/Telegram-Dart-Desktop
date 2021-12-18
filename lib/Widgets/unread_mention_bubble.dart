import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';

class UnreadCountBubble extends StatelessWidget {
  const UnreadCountBubble({Key? key, required this.count, this.color})
      : super(key: key);
  final int count;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    if (count <= 0) return const SizedBox.shrink();
    return Container(
        decoration: BoxDecoration(
            color: color ??
                ClientTheme.currentTheme.getField("UnreadChatBubbleColor"),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
            child: Text(
              count.toString(),
              style: TextDisplay.create(size: 18, textColor: TextColor.White),
            )));
  }
}
