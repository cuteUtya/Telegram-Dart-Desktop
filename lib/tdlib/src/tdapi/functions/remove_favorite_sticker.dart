part of '../tdapi.dart';

class RemoveFavoriteSticker extends TdFunction {

  /// Removes a sticker from the list of favorite stickers
  RemoveFavoriteSticker({this.sticker});

  /// [sticker] Sticker file to delete from the list
  InputFile? sticker;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  RemoveFavoriteSticker.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sticker": sticker == null ? null : sticker?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'removeFavoriteSticker';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}