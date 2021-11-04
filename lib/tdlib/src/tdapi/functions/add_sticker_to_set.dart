part of '../tdapi.dart';

class AddStickerToSet extends TdFunction {

  /// Adds a new sticker to a set; for bots only. Returns the sticker set
  AddStickerToSet({this.userId,
    this.name,
    this.sticker});

  /// [userId] Sticker set owner
  int? userId;

  /// [name] Sticker set name 
  String? name;

  /// [sticker] Sticker to add to the set
  InputSticker? sticker;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  AddStickerToSet.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
      "name": name,
      "sticker": sticker == null ? null : sticker?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'addStickerToSet';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}