import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';

class LoadScreen extends StatelessWidget {
  const LoadScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        "Assets/Load.json",
        width: 186,
        height: 186,
      ),
    );
  }
}
