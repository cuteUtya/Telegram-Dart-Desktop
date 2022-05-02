import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Design/desing_system.dart';

class TypographyData {
  const TypographyData({
    required this.fontSize50,
    required this.fontSize75,
    required this.fontSize100,
    required this.fontSize200,
    required this.fontSize300,
    required this.fontSize400,
    required this.fontSize500,
    required this.fontSize600,
    required this.fontSize700,
    required this.fontSize800,
    required this.fontSize900,
    required this.fontSize1000,
    required this.fontSize1100,
    required this.fontSize1200,
    required this.fontSize1300,
  });

  final FontSize fontSize50;
  final FontSize fontSize75;
  final FontSize fontSize100;
  final FontSize fontSize200;
  final FontSize fontSize300;
  final FontSize fontSize400;
  final FontSize fontSize500;
  final FontSize fontSize600;
  final FontSize fontSize700;
  final FontSize fontSize800;
  final FontSize fontSize900;
  final FontSize fontSize1000;
  final FontSize fontSize1100;
  final FontSize fontSize1200;
  final FontSize fontSize1300;

  TextSpan text(
    String text, {
    required double size,
    TextSemantic semantic = TextSemantic.body,
    Color? color,
  }) =>
      throw UnimplementedError();
}

class FontSize {
  FontSize({
    required double desktop,
    required double mobile,
  }) {
    _desktop = desktop;
    _mobile = mobile;
  }

  late double _desktop;
  late double _mobile;

  double get value => isMobile ? _mobile : _desktop;
}

// TODO: implment typograhy class for every desing system

enum TextSemantic {
  heading,
  body,
  detail,
  code,
}
