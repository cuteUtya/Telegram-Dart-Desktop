import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:myapp/Widgets/display_text.dart';

class TextAnimation extends StatefulWidget {
  const TextAnimation(
      {Key? key,
      required this.frames,
      required this.textStyle,
      this.frameOffset = const Duration(seconds: 1)})
      : super(key: key);
  final List<String> frames;
  final TextStyle textStyle;
  final Duration frameOffset;

  static TextAnimation fourPoints() => TextAnimation(
      frames: const ["....", "...", "..", "."],
      textStyle: TextDisplay.chatItemAccent,
      frameOffset: const Duration(milliseconds: 500));

  @override
  State<StatefulWidget> createState() => TextAnimationState();
}

class TextAnimationState extends State<TextAnimation> {
  int currFrame = 0;

  int ticks = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        widget.frameOffset, (Timer t) => setState(() => ticks--));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.frames[ticks % widget.frames.length],
        style: widget.textStyle);
  }
}
