part of '../tdapi.dart';

class LanguagePackString extends TdObject {

  /// Represents one language pack string
  LanguagePackString({this.key,
    this.value});

  /// [key] String key 
  String? key;

  /// [value] String value; pass null if the string needs to be taken from the built-in English language pack
  LanguagePackStringValue? value;

  /// Parse from a json
  LanguagePackString.fromJson(Map<String, dynamic> json)  {
    String? pre_key;
    try{
      pre_key=json['key'];
   }catch(_){}
    key = pre_key;
    LanguagePackStringValue? pre_value;
    try{
      pre_value=LanguagePackStringValue.fromJson(json['value'] ?? <String, dynamic>{});
   }catch(_){}
    value = pre_value;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "key": key,
      "value": value == null ? null : value?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'languagePackString';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}