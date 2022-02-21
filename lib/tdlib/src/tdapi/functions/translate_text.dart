part of '../tdapi.dart';

class TranslateText extends TdFunction {

  /// Translates a text to the given language. Returns a 404 error if the translation can't be performed
  TranslateText({this.text,
    this.fromLanguageCode,
    this.toLanguageCode});

  /// [text] Text to translate
  String? text;

  /// [fromLanguageCode] A two-letter ISO 639-1 language code of the language from which the message is translated. If empty, the language will be detected automatically
  String? fromLanguageCode;

  /// [toLanguageCode] A two-letter ISO 639-1 language code of the language to which the message is translated
  String? toLanguageCode;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  TranslateText.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text,
      "from_language_code": fromLanguageCode,
      "to_language_code": toLanguageCode,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'translateText';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}