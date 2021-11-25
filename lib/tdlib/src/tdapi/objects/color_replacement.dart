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
    int? pre_oldColor;
    try{
      pre_oldColor=json['old_color'];
   }catch(_){}
    oldColor = pre_oldColor;
    int? pre_newColor;
    try{
      pre_newColor=json['new_color'];
   }catch(_){}
    newColor = pre_newColor;
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