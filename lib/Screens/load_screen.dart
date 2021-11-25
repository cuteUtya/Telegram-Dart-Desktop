import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/Widgets/display_text.dart';

class LoadScreen extends StatelessWidget {
  LoadScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 256, height: 256, child: Lottie.asset("Assets/Load.json")),
        const SizedBox(height: 24),
        Text("Loading...",
            style: TextDisplay.create(fontWeight: FontWeight.w500, size: 24))
      ],
    );
  }
}
