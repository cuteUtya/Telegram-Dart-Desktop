part of '../tdapi.dart';

class GetArchivedStickerSets extends TdFunction {

  /// Returns a list of archived sticker sets
  GetArchivedStickerSets({this.isMasks,
    this.offsetStickerSetId,
    this.limit});

  /// [isMasks] Pass true to return mask stickers sets; pass false to return ordinary sticker sets 
  bool? isMasks;

  /// [offsetStickerSetId] Identifier of the sticker set from which to return the result 
  int? offsetStickerSetId;

  /// [limit] The maximum number of sticker sets to return; up to 100
  int? limit;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetArchivedStickerSets.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "is_masks": isMasks,
      "offset_sticker_set_id": offsetStickerSetId,
      "limit": limit,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getArchivedStickerSets';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}