import 'dart:ui';

import 'package:flutter/widgets.dart';

class BackgroundBlur extends StatelessWidget {
  const BackgroundBlur({
    Key? key,
    required this.child,
    required this.blur,
    this.size,
    this.radius,
  }) : super(key: key);
  final Widget child;
  final ImageFilter blur;
  final BorderRadius? radius;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: Stack(
        children: [
          BackdropFilter(
            filter: blur,
            child: SizedBox.fromSize(
              size: size,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
