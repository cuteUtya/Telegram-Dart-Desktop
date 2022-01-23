import 'dart:async';

import 'package:flutter/cupertino.dart';

class SmoothNumberCounter extends StatefulWidget {
  const SmoothNumberCounter(
      {Key? key,
      required this.initialValue,
      required this.textStyle,
      this.mask = "{value}",
      this.frameOffset = const Duration(milliseconds: 50)})
      : super(key: key);
  final int initialValue;
  final String mask;
  final Duration frameOffset;
  final TextStyle textStyle;
  @override
  State<StatefulWidget> createState() => SmoothNumberCounterState();
}

class SmoothNumberCounterState extends State<SmoothNumberCounter> {
  late int targetNumber = widget.initialValue;
  int number = 0;
  Timer? timer;

  void setNewTarget(int newTarget) => setState(() => targetNumber = newTarget);

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        widget.frameOffset,
        (Timer t) => setState(() {
              if (number < targetNumber) number++;
            }));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.mask.replaceFirst("{value}", number.toString()),
      style: widget.textStyle,
    );
  }
}
