part of '../tdapi.dart';

class GetFavoriteStickers extends TdFunction {

  /// Returns favorite stickers
  GetFavoriteStickers();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetFavoriteStickers.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getFavoriteStickers';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}