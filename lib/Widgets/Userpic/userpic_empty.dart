import 'package:flutter/material.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/utils.dart';

class UserpicEmpty extends StatelessWidget {
  const UserpicEmpty(
      {Key? key,
      required this.chatId,
      required this.displayLetters,
      this.fontSize})
      : super(key: key);
  final int chatId;
  final String displayLetters;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  transform: const GradientRotation(-25 * 3.14 / 180),
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    getPeerColor(chatId, "a"),
                    getPeerColor(chatId, "b")
                  ]))),
      Text(displayLetters,
          style: TextDisplay.create(
              textColor: TextColor.PeerNameTextColor,
              fontFamily: extractEmojis(displayLetters).isNotEmpty
                  ? TextDisplay.emojiFont
                  : TextDisplay.greaterImportance,
              size: fontSize ?? 24,
              fontWeight: FontWeight.w500))
    ]);
  }
}
