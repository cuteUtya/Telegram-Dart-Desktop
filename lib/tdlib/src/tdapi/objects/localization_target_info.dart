part of '../tdapi.dart';

class LocalizationTargetInfo extends TdObject {

  /// Contains information about the current localization target
  LocalizationTargetInfo({this.languagePacks});

  /// [languagePacks] List of available language packs for this application
  List<LanguagePackInfo>? languagePacks;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  LocalizationTargetInfo.fromJson(Map<String, dynamic> json)  {
    languagePacks = json['language_packs'] == null ? null : List<LanguagePackInfo>.from((json['language_packs'] ?? [])!.map((item) => LanguagePackInfo.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "language_packs": languagePacks?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'localizationTargetInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}