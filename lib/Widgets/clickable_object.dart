import 'package:flutter/material.dart';

class ClickabeObject extends StatefulWidget {
  const ClickabeObject({Key? key, this.onTap, required this.builder})
      : super(key: key);
  final Widget Function(bool selected) builder;
  final Function()? onTap;
  @override
  State<StatefulWidget> createState() => _ClickabeObjectState();
}

class _ClickabeObjectState extends State<ClickabeObject> {
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
