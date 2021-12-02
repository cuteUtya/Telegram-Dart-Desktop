part of '../tdapi.dart';

class Emojis extends TdObject {

  /// Represents a list of emoji
  Emojis({this.emojis});

  /// [emojis] List of emojis
  List<String>? emojis;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Emojis.fromJson(Map<String, dynamic> json)  {
    emojis = json['emojis'] == null ? null : List<String>.from((json['emojis'] ?? [])!.map((item) => item).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "emojis": emojis?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'emojis';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}