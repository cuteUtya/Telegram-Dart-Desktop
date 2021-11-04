part of '../tdapi.dart';

class GetEmojiSuggestionsUrl extends TdFunction {

  /// Returns an HTTP URL which can be used to automatically log in to the translation platform and suggest new emoji replacements. The URL will be valid for 30 seconds after generation
  GetEmojiSuggestionsUrl({this.languageCode});

  /// [languageCode] Language code for which the emoji replacements will be suggested
  String? languageCode;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetEmojiSuggestionsUrl.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "language_code": languageCode,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getEmojiSuggestionsUrl';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}