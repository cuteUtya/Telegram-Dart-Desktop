import 'package:flutter/material.dart';

class ClickableObject extends StatefulWidget {
  const ClickableObject({Key? key, this.onTap, required this.builder})
      : super(key: key);
  final Widget Function(bool selected) builder;
  final Function()? onTap;
  @override
  State<StatefulWidget> createState() => _ClickableObjectState();
}

class _ClickableObjectState extends State<ClickableObject> {
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
