import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';

class UserpicEmpty extends StatelessWidget {
  const UserpicEmpty({Key? key, required this.chatId}) : super(key: key);
  final int chatId;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  getPeerColor(chatId, "a"),
                  getPeerColor(chatId, "b")
                ])));
  }

  static Color getPeerColor(int id, [String component = "a"]) {
    //TODO colors don't match with tdesktop
    var index = id % 7;
    var map = [0, 7, 4, 1, 6, 3, 5];
    return ClientTheme.currentTheme
        .getField("PeerColor${map[index]}$component");
  }
}
