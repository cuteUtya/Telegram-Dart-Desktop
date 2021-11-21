part of '../tdapi.dart';

class Text extends TdObject {

  /// Contains some text
  Text({this.text});

  /// [text] Text
  String? text;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Text.fromJson(Map<String, dynamic> json)  {
    String? pre_text;
    try{
      pre_text=json['text'];
   }catch(_){}
    text = pre_text;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text,
    };
  }

  static const CONSTRUCTOR = 'text';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}