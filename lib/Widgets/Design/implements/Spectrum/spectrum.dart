import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Design/desing_colors.dart';
import 'package:myapp/Widgets/Design/desing_layout.dart';
import 'package:myapp/Widgets/Design/desing_typography.dart';

class Spectrum {
  Spectrum({
    SpectrumTheme theme = SpectrumTheme.light,
  }) {
    /// TODO implement themes
    var gray = const MaterialColor(0xfff, {
      50: Color(0xffffffff),
      75: Color(0xfffafafa),
      100: Color(0xfff5f5f5),
      200: Color(0xffeaeaea),
      300: Color(0xffe1e1e1),
      400: Color(0xffcacaca),
      500: Color(0xffb3b3b3),
      600: Color(0xff8e8e8e),
      700: Color(0xff6e6e6e),
      800: Color(0xff4b4b4b),
      900: Color(0xff2c2c2c),
    });

    var red = const MaterialColor(0xffE34850, {
      400: Color(0xffE34850),
      500: Color(0xffD7373F),
      600: Color(0xffC9252D),
      700: Color(0xffBB121A),
    });

    var orange = const MaterialColor(0xffE68619, {
      400: Color(0xffE68619),
      500: Color(0xffDA7B11),
      600: Color(0xffCB6F10),
      700: Color(0xffBD640D),
    });

    var yellow = const MaterialColor(0xffDFBF00, {
      400: Color(0xffDFBF00),
      500: Color(0xffD2B200),
      600: Color(0xffC4A600),
      700: Color(0xffB79900),
    });

    var chartreuse = const MaterialColor(0xff85D044, {
      400: Color(0xff85D044),
      500: Color(0xff7CC33F),
      600: Color(0xff73B53A),
      700: Color(0xff6AA834),
    });

    var green = const MaterialColor(0xff2D9D78, {
      400: Color(0xff2D9D78),
      500: Color(0xff268E6C),
      600: Color(0xff12805C),
      700: Color(0xff107154),
    });

    var celery = const MaterialColor(0xff44B556, {
      400: Color(0xff44B556),
      500: Color(0xff3DA74E),
      600: Color(0xff379947),
      700: Color(0xff318B40),
    });

    var seafoam = const MaterialColor(0xff1B959A, {
      400: Color(0xff1B959A),
      500: Color(0xff16878C),
      600: Color(0xff0F797D),
      700: Color(0xff096C6F),
    });

    var blue = const MaterialColor(0xff2680EB, {
      400: Color(0xff2680EB),
      500: Color(0xff1473E6),
      600: Color(0xff0D66D0),
      700: Color(0xff095ABA),
    });

    var indigo = const MaterialColor(0xff6767EC, {
      400: Color(0xff6767EC),
      500: Color(0xff5C5CE0),
      600: Color(0xff5151D3),
      700: Color(0xff4646C6),
    });

    var purple = const MaterialColor(0xff9256D9, {
      400: Color(0xff9256D9),
      500: Color(0xff864CCC),
      600: Color(0xff7A42BF),
      700: Color(0xff6F38B1),
    });

    var fuchsia = const MaterialColor(0xffC038CC, {
      400: Color(0xffC038CC),
      500: Color(0xffB130BD),
      600: Color(0xffA228AD),
      700: Color(0xff93219E),
    });

    var magenta = const MaterialColor(0xffD83790, {
      400: Color(0xffD83790),
      500: Color(0xffCE2783),
      600: Color(0xffBC1C74),
      700: Color(0xffAE0E66),
    });

    colors = ColorData(
      accent: magenta,
      gray: gray,
      red: red,
      orange: orange,
      yellow: yellow,
      chartreuse: chartreuse,
      green: green,
      celery: celery,
      seafoam: seafoam,
      blue: blue,
      indigo: indigo,
      purple: purple,
      fuchsia: fuchsia,
      magenta: magenta,
    );

    layout = LayoutData(
      spacing50: Spacing(2),
      spacing75: Spacing(4),
      spacing100: Spacing(8),
      spacing200: Spacing(12),
      spacing300: Spacing(16),
      spacing400: Spacing(24),
      spacing500: Spacing(32),
      spacing600: Spacing(40),
      spacing700: Spacing(48),
      spacing800: Spacing(64),
      spacing900: Spacing(80),
      spacing1000: Spacing(96),
    );
  }

  @override
  late ColorData colors;

  @override
  late LayoutData layout;

  @override
  late TypographyData typography;
}

class SpectrumTypograhy extends TypographyData {
  SpectrumTypograhy()
      : super(
          fontSize50: FontSize(desktop: 11, mobile: 13),
          fontSize75: FontSize(desktop: 12, mobile: 15),
          fontSize100: FontSize(desktop: 14, mobile: 17),
          fontSize200: FontSize(desktop: 16, mobile: 19),
          fontSize300: FontSize(desktop: 18, mobile: 22),
          fontSize400: FontSize(desktop: 20, mobile: 24),
          fontSize500: FontSize(desktop: 22, mobile: 27),
          fontSize600: FontSize(desktop: 25, mobile: 31),
          fontSize700: FontSize(desktop: 28, mobile: 34),
          fontSize800: FontSize(desktop: 32, mobile: 39),
          fontSize900: FontSize(desktop: 36, mobile: 44),
          fontSize1000: FontSize(desktop: 40, mobile: 49),
          fontSize1100: FontSize(desktop: 45, mobile: 55),
          fontSize1200: FontSize(desktop: 50, mobile: 62),
          fontSize1300: FontSize(desktop: 60, mobile: 70),
        );

  @override
  TextSpan text(
    String text, {
    required double size,
    TextSemantic semantic = TextSemantic.body,
    Color? color,
  }) {
    String fontFamily;

    switch (semantic) {
      case TextSemantic.code:
        fontFamily = "Source Code Pro";
        break;

      default:
        // TODO import adobe clean
        fontFamily = "Adobe Clean";
        break;
    }
    return TextSpan(
      text: text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: size,
        color: color,
        fontWeight: semantic == TextSemantic.heading
            ? FontWeight.bold
            : FontWeight.normal,
        fontStyle: semantic == TextSemantic.detail
            ? FontStyle.italic
            : FontStyle.normal,
      ),
    );
  }
}

enum SpectrumTheme {
  light,
  lightest,
  dark,
  darkest,
}
