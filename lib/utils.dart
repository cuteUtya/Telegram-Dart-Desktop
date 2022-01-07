import "dart:io" show Platform;
import "dart:math";
import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/left%20panel/chat_lists_manager.dart';
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
    r"([^ABCČĆDĐEFGHIJKLMNOPQRSŠTUVWXYZŽabcčćdđefghijklmnopqrsštuvwxyzžАБВГҐДЂЕЁЄЖЗЅИІЇЙЈКЛЉМНЊОПРСТЋУЎФХЦЧЏШЩЪЫЬЭЮЯабвгґдђеёєжзѕиіїйјклљмнњопрстћуўфхцчџшщъыьэюяΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩαβγδεζηθικλμνξοπρστυφχψωάΆέΈέΉίϊΐΊόΌύΰϋΎΫὰάὲέὴήὶίὸόὺύὼώΏ1234567890‘?’“!”(%)\[#\]{@}\/&\<\-+÷×=>®©$€£¥¢:;,.*\n ]){1,}");

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

bool showChatInChatList(List<ChatPosition> poss, ChatList list) {
  bool result = false;
  for (var pos in poss) {
    if (compareChatlists(pos.list!, list) && pos.order! != 0) {
      result = true;
    }
  }
  return result;
}

List<ChatOrder> sortChatsFor(List<ChatOrder> chats, ChatList forList) {
  List<ChatOrder> list = chats
      .where((element) => showChatInChatList(element.positions, forList))
      .toList();
  list.sort((b, a) => a.positions
      .firstWhere((element) => compareChatlists(element.list!, forList))
      .order!
      .compareTo(b.positions
          .firstWhere((element) => compareChatlists(element.list!, forList))
          .order!));
  for (int i = list.length - 1; i > 0; i--) {
    var order = list[i]
        .positions
        .firstWhere((element) => compareChatlists(element.list!, forList))
        .order;
    if (order == 0) {
      list.removeAt(i);
    }
  }
  return list;
}

bool compareChatlists(ChatList a, ChatList b) {
  return a.runtimeType == b.runtimeType &&
      (a is ChatListFilter ? a.chatFilterId : 0) ==
          (b is ChatListFilter ? b.chatFilterId : 0);
}

DateTime unixToDateTime(int unix) =>
    DateTime.fromMillisecondsSinceEpoch(unix * 1000);

//TODO show it in settings
bool useUSAStyle = true;
String getHHMM(DateTime time) {
  String afterTime = "";
  if (useUSAStyle) {
    if (time.hour > 12) {
      time = time.subtract(const Duration(hours: 12));
      afterTime = "PM";
    } else {
      afterTime = "AM";
    }
  }
  return "${to00format(time.hour.toString())}:${to00format(time.minute.toString())} $afterTime";
}

String to00format(String compenent) {
  if (compenent.length <= 1) return "0$compenent";
  return compenent;
}

Color getPeerColor(int id, [String component = "a"]) {
  id = int.parse(id.toString().replaceAll("-100", "-"));
  if (id < 0) id = -id;
  return ClientTheme.currentTheme
      .getField("PeerColor${[0, 7, 4, 1, 6, 3, 5][(id % 7)] + 1}$component");
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
