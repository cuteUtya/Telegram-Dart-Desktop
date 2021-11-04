part of '../tdapi.dart';

class AddFavoriteSticker extends TdFunction {

  /// Adds a new sticker to the list of favorite stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set can be added to this list
  AddFavoriteSticker({this.sticker});

  /// [sticker] Sticker file to add
  InputFile? sticker;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  AddFavoriteSticker.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sticker": sticker == null ? null : sticker?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'addFavoriteSticker';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}