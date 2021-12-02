part of '../tdapi.dart';

class ColorReplacement extends TdObject {

  /// Describes a color replacement for animated emoji
  ColorReplacement({this.oldColor,
    this.newColor});

  /// [oldColor] Original animated emoji color in the RGB24 format 
  int? oldColor;

  /// [newColor] Replacement animated emoji color in the RGB24 format
  int? newColor;

  /// Parse from a json
  ColorReplacement.fromJson(Map<String, dynamic> json)  {
    oldColor = json['old_color'] == null ? null : json['old_color'];
    newColor = json['new_color'] == null ? null : json['new_color'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "old_color": oldColor,
      "new_color": newColor,
    };
  }

  static const CONSTRUCTOR = 'colorReplacement';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}