part of '../tdapi.dart';

class SearchStickers extends TdFunction {

  /// Searches for stickers from public sticker sets that correspond to a given emoji
  SearchStickers({this.emoji,
    this.limit});

  /// [emoji] String representation of emoji; must be non-empty 
  String? emoji;

  /// [limit] The maximum number of stickers to be returned
  int? limit;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SearchStickers.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "emoji": emoji,
      "limit": limit,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'searchStickers';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}