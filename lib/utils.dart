import 'dart:async';
import "dart:io" show Platform;

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

String getDeviceName() {
  String deviceName =
      "${Platform.localHostname} ${Platform.operatingSystem} ${Platform.numberOfProcessors} cores";
  return deviceName;
}

String getSystemVersion() {
  return "${Platform.operatingSystem} ${Platform.operatingSystemVersion}";
}
