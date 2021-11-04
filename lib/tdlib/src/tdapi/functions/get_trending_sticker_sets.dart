part of '../tdapi.dart';

class GetTrendingStickerSets extends TdFunction {

  /// Returns a list of trending sticker sets. For optimal performance, the number of returned sticker sets is chosen by TDLib
  GetTrendingStickerSets({this.offset,
    this.limit});

  /// [offset] The offset from which to return the sticker sets; must be non-negative
  int? offset;

  /// [limit] The maximum number of sticker sets to be returned; up to 100. For optimal performance, the number of returned sticker sets is chosen by TDLib and can be smaller than the specified limit, even if the end of the list has not been reached
  int? limit;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetTrendingStickerSets.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getTrendingStickerSets';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}