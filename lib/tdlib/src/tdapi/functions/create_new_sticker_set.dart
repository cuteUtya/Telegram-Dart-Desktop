part of '../tdapi.dart';

class CreateNewStickerSet extends TdFunction {

  /// Creates a new sticker set. Returns the newly created sticker set
  CreateNewStickerSet({this.userId,
    this.title,
    this.name,
    this.isMasks,
    this.stickers,
    this.source});

  /// [userId] Sticker set owner; ignored for regular users
  int? userId;

  /// [title] Sticker set title; 1-64 characters
  String? title;

  /// [name] Sticker set name. Can contain only English letters, digits and underscores. Must end with *"_by_
  String? name;

  /// [isMasks] True, if stickers are masks. Animated stickers can't be masks
  bool? isMasks;

  /// [stickers] List of stickers to be added to the set; must be non-empty. All stickers must be of the same type. For animated stickers, uploadStickerFile must be used before the sticker is shown
  List<InputSticker>? stickers;

  /// [source] Source of the sticker set; may be empty if unknown
  String? source;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CreateNewStickerSet.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
      "title": title,
      "name": name,
      "is_masks": isMasks,
      "stickers": stickers?.map((i) => i.toJson()).toList(),
      "source": source,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'createNewStickerSet';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}