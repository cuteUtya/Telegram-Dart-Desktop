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
    key = json['key'];
    value = LanguagePackStringValue.fromJson(json['value'] ?? <String, dynamic>{});
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