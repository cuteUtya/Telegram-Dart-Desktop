part of '../tdapi.dart';

class EditCustomLanguagePackInfo extends TdFunction {

  /// Edits information about a custom local language pack in the current localization target. Can be called before authorization
  EditCustomLanguagePackInfo({this.info});

  /// [info] New information about the custom local language pack
  LanguagePackInfo? info;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  EditCustomLanguagePackInfo.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "info": info == null ? null : info?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'editCustomLanguagePackInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}