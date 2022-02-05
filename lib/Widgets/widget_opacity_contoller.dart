import 'package:flutter/cupertino.dart';

/// Widget that provide ease interface to smooth hide or show [child] through [GlobalKey]
class WidgetOpacityContoller extends StatefulWidget {
  const WidgetOpacityContoller({
    Key? key,
    required this.child,
    this.opacity = 1.0,
    this.duration = const Duration(seconds: 1),
  }) : super(key: key);

  final Widget child;
  final double opacity;
  final Duration duration;
  @override
  State<StatefulWidget> createState() => WidgetOpacityContollerState();
}

class WidgetOpacityContollerState extends State<WidgetOpacityContoller> {
  late double _opacity = widget.opacity;
  late Duration _duration = widget.duration;

  void animateOpacity(double opacity) {
    setState(() {
      _opacity = opacity;
    });
  }

  void changeDuration(Duration duration) {
    setState(() {
      _duration = duration;
    });
  }

  void changeOpacity(double opacity) {
    setState(() {
      _opacity = opacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: _duration,
      child: widget.child,
    );
  }
}
