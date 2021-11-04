part of '../tdapi.dart';

class SetSupergroupStickerSet extends TdFunction {

  /// Changes the sticker set of a supergroup; requires can_change_info administrator right
  SetSupergroupStickerSet({this.supergroupId,
    this.stickerSetId});

  /// [supergroupId] Identifier of the supergroup 
  int? supergroupId;

  /// [stickerSetId] New value of the supergroup sticker set identifier. Use 0 to remove the supergroup sticker set
  int? stickerSetId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetSupergroupStickerSet.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "supergroup_id": supergroupId,
      "sticker_set_id": stickerSetId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setSupergroupStickerSet';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}