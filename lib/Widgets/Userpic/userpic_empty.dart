import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/utils.dart';

class UserpicEmpty extends StatelessWidget {
  const UserpicEmpty(
      {Key? key, required this.chatId, required this.displayLetters})
      : super(key: key);
  final int chatId;
  final String displayLetters;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
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
                  ? TextFont.emoji
                  : TextFont.greaterImportance,
              size: 24,
              fontWeight: FontWeight.w500))
    ]);
  }

  static Color getPeerColor(int id, [String component = "a"]) {
    var index = id % 6;
    return ClientTheme.currentTheme.getField("PeerColor${index + 1}$component");
  }
}
