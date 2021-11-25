import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';

class LoadScreen extends StatelessWidget {
  LoadScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(
            width: 186, height: 186, child: Lottie.asset("Assets/Load.json")),
      ]),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: ClientTheme.currentTheme.getField("LoadScreenBackgroundColor"),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: ClientTheme.currentTheme.getField("LoadScreenShadowColor"),
            blurRadius: 4,
            offset: const Offset(2, -2), // Shadow position
          ),
        ],
      ),
    );
  }
}
