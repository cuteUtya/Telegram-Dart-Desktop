import 'package:flutter/material.dart';

class LayoutData {
  const LayoutData({
    required this.spacing50,
    required this.spacing75,
    required this.spacing100,
    required this.spacing200,
    required this.spacing300,
    required this.spacing400,
    required this.spacing500,
    required this.spacing600,
    required this.spacing700,
    required this.spacing800,
    required this.spacing900,
    required this.spacing1000,
  });

  final Spacing spacing50;
  final Spacing spacing75;
  final Spacing spacing100;
  final Spacing spacing200;
  final Spacing spacing300;
  final Spacing spacing400;
  final Spacing spacing500;
  final Spacing spacing600;
  final Spacing spacing700;
  final Spacing spacing800;
  final Spacing spacing900;
  final Spacing spacing1000;
}

class Spacing {
  Spacing(double value) {
    _value = value;
  }
  late double _value;

  EdgeInsetsGeometry get right => EdgeInsets.only(right: _value);
  EdgeInsetsGeometry get left => EdgeInsets.only(left: _value);
  EdgeInsetsGeometry get top => EdgeInsets.only(top: _value);
  EdgeInsetsGeometry get bottom => EdgeInsets.only(bottom: _value);
  EdgeInsetsGeometry get vertical => EdgeInsets.symmetric(vertical: _value);
  EdgeInsetsGeometry get horizontal => EdgeInsets.symmetric(horizontal: _value);
  EdgeInsetsGeometry get all => EdgeInsets.all(_value);
  EdgeInsetsGeometry get topRight => EdgeInsets.only(
        top: _value,
        right: _value,
      );
  EdgeInsetsGeometry get topLeft => EdgeInsets.only(
        top: _value,
        left: _value,
      );
  EdgeInsetsGeometry get bottomRight => EdgeInsets.only(
        bottom: _value,
        right: _value,
      );
  EdgeInsetsGeometry get bottomLeft => EdgeInsets.only(
        bottom: _value,
        left: _value,
      );
}
