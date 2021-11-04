part of '../tdapi.dart';

class SearchEmojis extends TdFunction {

  /// Searches for emojis by keywords. Supported only if the file database is enabled
  SearchEmojis({this.text,
    this.exactMatch,
    this.inputLanguageCodes});

  /// [text] Text to search for 
  String? text;

  /// [exactMatch] True, if only emojis, which exactly match text needs to be returned 
  bool? exactMatch;

  /// [inputLanguageCodes] List of possible IETF language tags of the user's input language; may be empty if unknown
  List<String>? inputLanguageCodes;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SearchEmojis.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text,
      "exact_match": exactMatch,
      "input_language_codes": inputLanguageCodes?.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'searchEmojis';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}