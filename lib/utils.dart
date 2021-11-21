import 'dart:async';
import 'package:device_info_plus/device_info_plus.dart';

double clamp(double value, double min, double max) {
  if (value > max) return max;
  if (value < min) return min;
  return value;
}

int clampInt(int value, int min, int max) {
  if (value > max) return max;
  if (value < min) return min;
  return value;
}

//linear interpolation beetwen two numbers
double lerp(double a, double b, double t) {
  return a + t * (b - a);
}

String getUserLocale() => "ru";
String getDatabaseDirectory() => "/home/timur/tdDb";
String getFilesDirectory() => "/home/timur/tdFiles";
String getLanguagePackDatabasePath() => "/home/timur/tdTranslate.db";
Future<String> getDeviceName() async {
  var info = DeviceInfoPlugin();
  try {
    return "Linux " + (await info.linuxInfo).prettyName;
  } catch (_) {}
  try {
    return (await info.windowsInfo).computerName;
  } catch (_) {}
  try {
    return (await info.macOsInfo).model;
  } catch (_) {}
  return Future(() => "undefined device");
}

Future<String> getSystemVersion() async {
  var info = DeviceInfoPlugin();
  try {
    return (await info.linuxInfo).version ?? "undefined version";
  } catch (_) {}
  try {
    return (await info.windowsInfo) == null ? "Windows" : throw Exception();
  } catch (_) {}
  try {
    return (await info.macOsInfo).osRelease;
  } catch (_) {}
  return Future(() => "undefined system");
}
