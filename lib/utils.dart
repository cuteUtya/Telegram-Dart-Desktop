import "dart:io" show Platform;
import "dart:math";
import 'package:myapp/tdlib/td_api.dart';

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

var emojiRegex = RegExp(
    r'[\p{Extended_Pictographic}\u{1F3FB}-\u{1F3FF}\u{1F9B0}-\u{1F9B3}|\u{2F18F}]',
    unicode: true);

///Sort photos from smallest to largest
List<PhotoSize> sortPhotoSizes(List<PhotoSize> sizes) {
  sizes.sort(
      (a, b) => a.width! > b.width! ? -1 : (a.width! == b.width! ? 0 : 1));
  return sizes;
}

List<String> extractEmojisAsList(String text) {
  List<String> res = [];
  emojiRegex.allMatches(text).forEach(
      (element) => res.add(text.substring(element.start, element.end)));
  return res;
}

String extractEmojis(String text) {
  return emojiRegex.allMatches(text).map((z) => z.group(0)).toList().join("");
}

//linear interpolation beetwen two numbers
double lerp(double a, double b, double t) {
  return a + t * (b - a);
}

String bytesToSize(int bytes) {
  var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
  if (bytes == 0) return '0 Byte';
  var i = (log(bytes) / log(1024)).floor().toInt();
  return "${(bytes / pow(1024, i)).toStringAsFixed(2)} ${sizes[i]}";
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
