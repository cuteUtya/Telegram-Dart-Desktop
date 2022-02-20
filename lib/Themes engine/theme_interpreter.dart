import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/Themes%20engine/icons_deserializator.dart';

class LangFunction {
  late String funcName;
  late List<int> argsCount;
  late String Function(List<dynamic>) dartFunction;

  LangFunction(this.funcName, this.argsCount, this.dartFunction);
}

class ClientTheme {
  static ClientTheme currentTheme = ClientTheme("", false);
  static late ClientTheme _defaultTheme;

  static const String linesSeparator = ';';
  static const String valueSeparator = ':';
  final Map<String, Function> environmentVariables = {"theme": () => "light"};
  final Map<String, String> lines = {};
  final List<LangFunction> functions = [
    LangFunction("linear", [3], linear),
    LangFunction("max", [2], max_inter),
    LangFunction("min", [2], min_inter),
    LangFunction("hsv", [3], hsv_inter),
  ];

  bool _isDefault = false;

  ClientTheme(String themeContent, bool isDefault) {
    _isDefault = isDefault;
    themeContent.replaceAll("\n", "\r").split("\r").forEach((element) {
      if (element.isEmpty) return;
      if (element[0] == "#") {
        themeContent = themeContent.replaceAll(element, '');
      }
    });

    themeContent.replaceAll("\n", "\r").split("\r").join().split(linesSeparator).forEach((element) {
      if (element.isEmpty) return;
      var val = element.split(valueSeparator);
      lines[val[0].replaceAll(" ", "")] = val[1].replaceAll(" ", "");
    });
  }

  static Future init() async {
    var file = await rootBundle.loadString("Assets/theme.tcss");
    _defaultTheme = ClientTheme(file, true);
  }

  String doFuntions(String value) {
    while (true) {
      bool findFunctions = false;
      for (var foo in functions) {
        var reg = RegExp(
            "${foo.funcName}\\((((#[0-9a-zA-Z]{6,8})|([0-9]{1,20}([.,][0-9]{1,4})?)),?){${foo.argsCount.reduce(min).toString()},${foo.argsCount.reduce(max).toString()}}\\)");

        while (reg.hasMatch(value)) {
          var match = reg.firstMatch(value);
          if (match != null) {
            findFunctions = true;
            var functionStr = value.substring(match.start, match.end);
            var argsStr = functionStr.substring(foo.funcName.length + 1, functionStr.length - 1);
            var args = argsStr.split(',');
            value = value.replaceFirst(functionStr, foo.dartFunction(args));
          }
        }
      }
      if (!findFunctions) {
        break;
      }
    }
    return value;
  }

  static String max_inter(List<dynamic> args) {
    var a = args[0];
    var b = args[1];

    if (double.tryParse(a) != null && double.tryParse(b) != null) {
      var adouble = double.parse(a);
      var bdouble = double.parse(b);
      return (adouble > bdouble ? adouble : bdouble).toString();
    }

    throw Exception("Error while parsing arguments. Types should be max(double, double)");
  }

  static String min_inter(List<dynamic> args) {
    var a = args[0];
    var b = args[1];

    if (double.tryParse(a) != null && double.tryParse(b) != null) {
      var adouble = double.parse(a);
      var bdouble = double.parse(b);
      return (bdouble > adouble ? adouble : bdouble).toString();
    }

    throw Exception("Error while parsing arguments. Types should be min(double, double)");
  }

  static String hsv_inter(List<dynamic> args) {
    var hue = double.parse(args[0]);
    var saturation = double.parse(args[1]);
    var value = double.parse(args[2]);
    var color = HSVColor.fromAHSV(1, hue, saturation / 100, value / 100);
    return colorToHEX(color.toColor());
  }

  static String linear(List<dynamic> args) {
    var a = args[0]; //color or number
    var b = args[1]; //color or number
    var t = args[2]; //number

    if (double.tryParse(t) != null) {
      if (isHEX(a) && isHEX(b)) {
        var lerpedColor = Color.lerp(hexToColor(a), hexToColor(b), double.parse(t));
        if (lerpedColor != null) {
          return colorToHEX(lerpedColor);
        } else {
          throw Exception("Error while linear interpolation: a or b color is null. But how 🤔");
        }
      } else if (double.tryParse(a) != null && double.tryParse(b) != null) {
        return numberToString(((1 - t) * double.parse(a) + t * double.parse(b)), 4);
      }

      throw Exception(
          "Error while linear interpolation: wrong types of arguments, should be [Color, Color, double] or [double, double, double] ");
    }
    throw Exception("Error while linear interpolation: wrong type of t, should be double");
  }

  String? getRawField(String name) {
    return lines[name];
  }

  List<String> findAllRefsInField(String fieldName) {
    List<String> results = [];

    var refRegex = RegExp(r"ref\([a-z,A-Z]{0,64}\)");
    var rawFieldValue = getRawField(fieldName);
    if (rawFieldValue != null) {
      refRegex.allMatches(rawFieldValue).forEach((element) {
        var ref = rawFieldValue.substring(element.start, element.end);
        ref = ref.substring(4, ref.length - 1);
        results.add(ref);
      });

      return results;
    }
    return [];
  }

  String _getFieldString(String name) {
    String? value = getRawField(name);

    environmentVariables.forEach((key, val) {
      value = getRawField("$name($key=" + val.call().toString() + ")");
    });

    if ((value ?? "") == "") value = getRawField(name);

    if (value == null) {
      if (_isDefault) {
        throw Exception("Field $name unreachible");
      }
      return _defaultTheme._getFieldString(name);
    }
    /*
    detect "infinity references"
    generate tree "branches" like this:
    a>b
    a>b>c
    a>b>d
    a>b>d>a
    and throw Exceptions if detect reference, 
    what refs to the link above the tree (a>b>d>a - ininity references)
    */
    List<String> paths = [];
    findAllRefsInField(name).forEach((element) {
      paths.add(name + ">" + element);
    });
    bool pathsIsEnd = false;
    while (!pathsIsEnd) {
      List<String> newPaths = [];
      int findRefs = 0;
      for (int i = 0; i < paths.length; i++) {
        var elems = paths[i].split('>');
        var newrefs = findAllRefsInField(elems.last);
        findRefs += newrefs.length;
        for (int j = 0; j < newrefs.length; j++) {
          if (elems.contains(newrefs[j])) {
            throw Exception("Unreachable reference found, stack: " + paths[i] + ">" + newrefs[j]);
          }
          newPaths.add(paths[i] + ">" + newrefs[j]);
        }
      }
      paths = newPaths;
      if (findRefs == 0) pathsIsEnd = true;
    }

    value = replaceReferences(value!);
    value = replaceColorChannel(value!);
    value = doMath(value!);
    value = buildColors(value!);
    value = replaceColorChannel(value!);
    value = doFuntions(value!);
    return value!;
  }

  dynamic tryGetField(String name) {
    try {
      return getField(name);
    } catch (x) {
      //nope
    }
  }

  dynamic getField(String name) {
    var value = _getFieldString(name);
    if (isHEX(value)) return hexToColor(value);
    if (isIcon(value)) return getIconByName(value.split("Icons.").last) ?? value;
    return value;
  }

  static String buildColors(String value) {
    var colorRegx = RegExp(r'Color\(([0-9,]{1,4}(\.[0-9]{1,4})?){3,4}\)');

    while (colorRegx.hasMatch(value)) {
      var element = colorRegx.firstMatch(value);
      if (element != null) {
        var match = value.substring(element.start, element.end);
        List<double> colors = [];
        var colorsOnly = match.substring(6, match.length - 1);
        var colorsStr = colorsOnly.split(",");

        //if transparency empty A = 255
        if (colorsStr.length == 3) {
          colors.add(255);
        } else if (colorsStr.length == 4) {
          try {
            for (var element in colorsStr) {
              colors.add(double.parse(element));
            }
          } catch (ex) {
            throw Exception("Error while initialization new Color: parsing arguments failed");
          }
          value =
              value.replaceFirst(match, rgbaTohex(colors[0].toInt(), colors[1].toInt(), colors[2].toInt(), colors[3].toInt()));
        } else {
          throw Exception(
              "Error while initialization new Color: received " + colorsStr.length.toString() + " arguments, need [3, 4]");
        }
      }
    }

    return value;
  }

  static String doMath(String value) {
    var mathRegx = RegExp(r"Math\(([0-9]{1,20})[.,]?([0-9]{1,4})?[-+*\/]([0-9]{1,20})[.,]?([0-9]{1,4})?\)");

    while (mathRegx.hasMatch(value)) {
      var element = mathRegx.firstMatch(value);
      if (element != null) {
        var match = value.substring(element.start, element.end);
        var operation = match.substring(5, match.length - 1);

        List<String> components = [""];
        var allowOperation = ['+', '-', '*', '/'];
        var currentOperation = '';
        for (var element in allowOperation) {
          if (operation.contains(element)) {
            components = operation.split(element);
            currentOperation = element;
          }
        }

        double result = -1;
        double a;
        double b;
        try {
          a = double.parse(components[0]);
          b = double.parse(components[1]);
        } catch (ex) {
          throw Exception("Error while math operation at \n" + match + "\nparsing numbers is failed");
        }
        switch (currentOperation) {
          case '+':
            result = a + b;
            break;
          case '-':
            result = a - b;
            break;
          case '*':
            result = a * b;
            break;
          case '/':
            result = a / b;
            break;
        }
        value = value.replaceFirst(match, double.parse(result.toStringAsFixed(4)).toString());
      }
    }

    return value;
  }

  static String numberToString(double number, int accuracy) {
    return double.parse(number.toStringAsFixed(accuracy)).toString();
  }

  String replaceReferences(String value) {
    var refRegx = RegExp(r"ref\([a-z,A-Z]{0,64}\)");

    while (refRegx.hasMatch(value)) {
      var element = refRegx.firstMatch(value);
      if (element != null) {
        var match = value.substring(element.start, element.end);
        var refName = match.substring(4, match.length - 1);

        var refValue = _getFieldString(refName);
        value = value.replaceFirst(match, refValue);
      }
    }
    return value;
  }

  static String replaceColorChannel(String value) {
    var colorChannelRegx = RegExp(r"#([a-fA-F0-9]){6,8}\.[a-zA-Z]");

    while (colorChannelRegx.hasMatch(value)) {
      var element = colorChannelRegx.firstMatch(value);
      if (element != null) {
        var match = value.substring(element.start, element.end);
        var hex = match.substring(0, match.length - 2);
        var color = Color(int.parse(hex.substring(1, hex.length), radix: 16));

        var channelValue = 0;
        var channelName = match.substring(match.length - 1, match.length).toLowerCase();
        switch (channelName) {
          case 'a':
            channelValue = color.alpha;
            break;
          case 'r':
            channelValue = color.red;
            break;
          case 'g':
            channelValue = color.green;
            break;
          case 'b':
            channelValue = color.blue;
            break;

          default:
            throw Exception("Not allowed channel name [" + channelName + "], allowed only [a, r, g, b]");
        }

        value = value.replaceFirst(match, channelValue.toString());
      }
    }
    return value;
  }

  static bool isIcon(String input) {
    return RegExp(r"Icons\.(.{1,})").hasMatch(input);
  }

  static bool isHEX(String hex) {
    return RegExp("#[a-fA-F0-9]{4,6}").hasMatch(hex);
  }

  static String colorToHEX(Color clr) {
    return rgbaTohex(clr.alpha, clr.red, clr.green, clr.blue);
  }

  static Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }

  static String rgbaTohex(int a, int r, int g, int b) {
    r = (r < 0) ? -r : r;
    g = (g < 0) ? -g : g;
    b = (b < 0) ? -b : b;
    r = (r > 255) ? 255 : r;
    g = (g > 255) ? 255 : g;
    b = (b > 255) ? 255 : b;
    return '#${toHexNum(a)}${toHexNum(r)}${toHexNum(g)}${toHexNum(b)}';
  }

  static String toHexNum(int num) {
    var result = num.toRadixString(16);
    if (result.length == 1) result = "0" + result;

    return result.toUpperCase();
  }
}
