part of '../tdapi.dart';

class LanguagePackInfo extends TdObject {

  /// Contains information about a language pack
  LanguagePackInfo({this.id,
    this.baseLanguagePackId,
    this.name,
    this.nativeName,
    this.pluralCode,
    this.isOfficial,
    this.isRtl,
    this.isBeta,
    this.isInstalled,
    this.totalStringCount,
    this.translatedStringCount,
    this.localStringCount,
    this.translationUrl});

  /// [id] Unique language pack identifier
  String? id;

  /// [baseLanguagePackId] Identifier of a base language pack; may be empty. If a string is missed in the language pack, then it must be fetched from base language pack. Unsupported in custom language packs
  String? baseLanguagePackId;

  /// [name] Language name
  String? name;

  /// [nativeName] Name of the language in that language
  String? nativeName;

  /// [pluralCode] A language code to be used to apply plural forms. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more info
  String? pluralCode;

  /// [isOfficial] True, if the language pack is official
  bool? isOfficial;

  /// [isRtl] True, if the language pack strings are RTL 
  bool? isRtl;

  /// [isBeta] True, if the language pack is a beta language pack
  bool? isBeta;

  /// [isInstalled] True, if the language pack is installed by the current user
  bool? isInstalled;

  /// [totalStringCount] Total number of non-deleted strings from the language pack
  int? totalStringCount;

  /// [translatedStringCount] Total number of translated strings from the language pack
  int? translatedStringCount;

  /// [localStringCount] Total number of non-deleted strings from the language pack available locally
  int? localStringCount;

  /// [translationUrl] Link to language translation interface; empty for custom local language packs
  String? translationUrl;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  LanguagePackInfo.fromJson(Map<String, dynamic> json)  {
    id = json['id'];
    baseLanguagePackId = json['base_language_pack_id'];
    name = json['name'];
    nativeName = json['native_name'];
    pluralCode = json['plural_code'];
    isOfficial = json['is_official'];
    isRtl = json['is_rtl'];
    isBeta = json['is_beta'];
    isInstalled = json['is_installed'];
    totalStringCount = json['total_string_count'];
    translatedStringCount = json['translated_string_count'];
    localStringCount = json['local_string_count'];
    translationUrl = json['translation_url'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "base_language_pack_id": baseLanguagePackId,
      "name": name,
      "native_name": nativeName,
      "plural_code": pluralCode,
      "is_official": isOfficial,
      "is_rtl": isRtl,
      "is_beta": isBeta,
      "is_installed": isInstalled,
      "total_string_count": totalStringCount,
      "translated_string_count": translatedStringCount,
      "local_string_count": localStringCount,
      "translation_url": translationUrl,
    };
  }

  static const CONSTRUCTOR = 'languagePackInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}