import 'package:flutter/material.dart';

// colors source for Spectrum: https://spectrum.adobe.com/page/color-palette/

/// ## Spectrum
/// 900 used for component backgrounds with white text
/// 300-600 used for components with black text
class ColorData {
  ColorData({
    required this.accent,
    required this.gray,
    required this.red,
    required this.orange,
    required this.yellow,
    required this.chartreuse,
    required this.green,
    required this.celery,
    required this.seafoam,
    required this.blue,
    required this.indigo,
    required this.fuchsia,
    required this.magenta,
    required this.purple,
  });

  final MaterialColor accent;

  /// ## Spectrum
  /// * gray50, gray75, gray100 and gray200 used for background layers
  /// * gray200 and gray300 Decorative and app framing borders
  /// * gray400 field border, disabled icon
  /// * gray500 illustration
  /// * gray600 contol border
  /// * gray500 disabled text
  /// * gray700 subdued text, subdued icon
  /// * gray800 text, icon
  /// * gray900 heading
  late MaterialColor gray;

  /// ## Spectrum
  /// Negative semantic
  late MaterialColor red;

  /// ## Spectrum
  /// Notice semantic
  late MaterialColor orange;
  late MaterialColor yellow;
  late MaterialColor chartreuse;

  /// ## Spectrum
  /// Positive semantic
  late MaterialColor green;
  late MaterialColor celery;
  late MaterialColor seafoam;

  /// ## Spectrum
  /// Informative, accent semantic
  late MaterialColor blue;
  late MaterialColor indigo;
  late MaterialColor purple;
  late MaterialColor fuchsia;
  late MaterialColor magenta;
}
