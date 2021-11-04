part of '../tdapi.dart';

class ReorderInstalledStickerSets extends TdFunction {

  /// Changes the order of installed sticker sets
  ReorderInstalledStickerSets({this.isMasks,
    this.stickerSetIds});

  /// [isMasks] Pass true to change the order of mask sticker sets; pass false to change the order of ordinary sticker sets 
  bool? isMasks;

  /// [stickerSetIds] Identifiers of installed sticker sets in the new correct order
  List<int>? stickerSetIds;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ReorderInstalledStickerSets.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "is_masks": isMasks,
      "sticker_set_ids": stickerSetIds?.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'reorderInstalledStickerSets';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}