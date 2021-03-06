import 'package:flutter/material.dart';

/// Widget that provide ease interface to resize [child] through [GlobalKey]
class WidgetSizer extends StatefulWidget {
  const WidgetSizer({
    Key? key,
    required this.child,
    this.sizeOnInit,
    this.curve = Curves.easeIn,
    this.duration = Duration.zero,
    this.alignment,
  }) : super(key: key);
  final Widget child;
  final Size? sizeOnInit;
  final Curve curve;
  final Duration duration;
  final Alignment? alignment;
  @override
  State<StatefulWidget> createState() => WidgetSizerState();
}

class WidgetSizerState extends State<WidgetSizer> {
  late Size? _size = widget.sizeOnInit;

  void resize(Size size) => setState(() => _size = size);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      curve: widget.curve,
      width: _size?.width,
      height: _size?.height,
      child: widget.child,
      alignment: widget.alignment,
    );
  }
}
