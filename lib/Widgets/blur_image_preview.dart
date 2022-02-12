import 'dart:ui';
import 'package:flutter/material.dart';

class BlurImagePreview extends StatelessWidget {
  const BlurImagePreview({
    Key? key,
    required this.image,
    this.height,
    this.width,
  }) : super(key: key);

  final ImageProvider image;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 16,
          sigmaY: 16,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(
              0.0,
            ),
          ),
        ),
      ),
    );
  }
}
