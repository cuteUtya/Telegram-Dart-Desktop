part of '../tdapi.dart';

class SetStickerPositionInSet extends TdFunction {

  /// Changes the position of a sticker in the set to which it belongs; for bots only. The sticker set must have been created by the bot
  SetStickerPositionInSet({this.sticker,
    this.position});

  /// [sticker] Sticker
  InputFile? sticker;

  /// [position] New position of the sticker in the set, zero-based
  int? position;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetStickerPositionInSet.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sticker": sticker == null ? null : sticker?.toJson(),
      "position": position,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setStickerPositionInSet';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}