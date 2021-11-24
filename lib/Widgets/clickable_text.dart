import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ClickableText extends StatefulWidget {
  const ClickableText({Key? key, this.onTap, required this.builder})
      : super(key: key);
  final clickableTextCallback builder;
  final Function()? onTap;
  @override
  State<StatefulWidget> createState() => _ClickableTextState();
}

class _ClickableTextState extends State<ClickableText> {
  bool _isMouseUnderText = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => widget.onTap?.call(),
        child: MouseRegion(
            onEnter: (_) => setState(() => _isMouseUnderText = true),
            onExit: (_) => setState(() => _isMouseUnderText = false),
            child: widget.builder(_isMouseUnderText)));
  }
}

typedef clickableTextCallback = Widget Function(bool selected);
