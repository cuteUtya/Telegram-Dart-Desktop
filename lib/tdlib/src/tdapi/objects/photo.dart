part of '../tdapi.dart';

class Photo extends TdObject {

  /// Describes a photo
  Photo({this.hasStickers,
    this.minithumbnail,
    this.sizes});

  /// [hasStickers] True, if stickers were added to the photo. The list of corresponding sticker sets can be received using getAttachedStickerSets
  bool? hasStickers;

  /// [minithumbnail] Photo minithumbnail; may be null
  Minithumbnail? minithumbnail;

  /// [sizes] Available variants of the photo, in different sizes
  List<PhotoSize>? sizes;

  /// Parse from a json
  Photo.fromJson(Map<String, dynamic> json)  {
    hasStickers = json['has_stickers'] == null ? null : json['has_stickers'];
    minithumbnail = json['minithumbnail'] == null ? null : Minithumbnail.fromJson(json['minithumbnail'] ?? <String, dynamic>{});
    sizes = json['sizes'] == null ? null : List<PhotoSize>.from((json['sizes'] ?? [])!.map((item) => PhotoSize.fromJson(item ?? <String, dynamic>{})).toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "has_stickers": hasStickers,
      "minithumbnail": minithumbnail == null ? null : minithumbnail?.toJson(),
      "sizes": sizes?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'photo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}