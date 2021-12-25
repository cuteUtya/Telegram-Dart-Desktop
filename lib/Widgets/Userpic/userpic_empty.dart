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
    var i = chatId;
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
              size: 24,
              fontWeight: FontWeight.w500))
    ]);
  }

  static Color getPeerColor(int id, [String component = "a"]) {
    id = int.parse(id.toString().replaceAll("-100", "-"));
    if (id < 0) id = -id;
    return ClientTheme.currentTheme
        .getField("PeerColor${[0, 7, 4, 1, 6, 3, 5][(id % 7)] + 1}$component");
  }
}
