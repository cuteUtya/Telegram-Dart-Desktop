part of '../tdapi.dart';

class Backgrounds extends TdObject {

  /// Contains a list of backgrounds
  Backgrounds({this.backgrounds});

  /// [backgrounds] A list of backgrounds
  List<Background>? backgrounds;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Backgrounds.fromJson(Map<String, dynamic> json)  {
    backgrounds = List<Background>.from((json['backgrounds'] ?? [])!.map((item) => Background.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "backgrounds": backgrounds?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'backgrounds';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}