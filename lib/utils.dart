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
String getDatabaseDirectory() =>
    Platform.isLinux ? "/home/timur/tdDb" : "D:/tdclient/tddb";
String getFilesDirectory() =>
    Platform.isLinux ? "/home/timur/tdFiles" : "D:/tdclient/tdFiles";
String getLanguagePackDatabasePath() => Platform.isLinux
    ? "/home/timur/tdTranslate.db"
    : "D:/tdclient/TDtranslates.db";

String getDeviceName() => Platform.localHostname;
String getSystemVersion() => Platform.operatingSystem;
