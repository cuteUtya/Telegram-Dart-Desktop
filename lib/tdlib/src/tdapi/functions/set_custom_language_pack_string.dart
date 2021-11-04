part of '../tdapi.dart';

class SetCustomLanguagePackString extends TdFunction {

  /// Adds, edits or deletes a string in a custom local language pack. Can be called before authorization
  SetCustomLanguagePackString({this.languagePackId,
    this.newString});

  /// [languagePackId] Identifier of a previously added custom local language pack in the current localization target 
  String? languagePackId;

  /// [newString] New language pack string
  LanguagePackString? newString;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetCustomLanguagePackString.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "language_pack_id": languagePackId,
      "new_string": newString == null ? null : newString?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setCustomLanguagePackString';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}