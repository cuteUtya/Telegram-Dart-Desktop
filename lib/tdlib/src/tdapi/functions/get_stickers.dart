part of '../tdapi.dart';

class GetStickers extends TdFunction {

  /// Returns stickers from the installed sticker sets that correspond to a given emoji. If the emoji is non-empty, favorite and recently used stickers may also be returned
  GetStickers({this.emoji,
    this.limit});

  /// [emoji] String representation of emoji. If empty, returns all known installed stickers 
  String? emoji;

  /// [limit] The maximum number of stickers to be returned
  int? limit;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetStickers.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "emoji": emoji,
      "limit": limit,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getStickers';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}