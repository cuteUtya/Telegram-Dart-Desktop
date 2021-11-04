part of '../tdapi.dart';

class Sticker extends TdObject {

  /// Describes a sticker
  Sticker({this.setId,
    this.width,
    this.height,
    this.emoji,
    this.isAnimated,
    this.isMask,
    this.maskPosition,
    this.outline,
    this.thumbnail,
    this.sticker});

  /// [setId] The identifier of the sticker set to which the sticker belongs; 0 if none 
  int? setId;

  /// [width] Sticker width; as defined by the sender 
  int? width;

  /// [height] Sticker height; as defined by the sender
  int? height;

  /// [emoji] Emoji corresponding to the sticker
  String? emoji;

  /// [isAnimated] True, if the sticker is an animated sticker in TGS format 
  bool? isAnimated;

  /// [isMask] True, if the sticker is a mask 
  bool? isMask;

  /// [maskPosition] Position where the mask is placed; may be null
  MaskPosition? maskPosition;

  /// [outline] Sticker's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
  List<ClosedVectorPath>? outline;

  /// [thumbnail] Sticker thumbnail in WEBP or JPEG format; may be null 
  Thumbnail? thumbnail;

  /// [sticker] File containing the sticker
  File? sticker;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Sticker.fromJson(Map<String, dynamic> json)  {
    setId = int.tryParse(json['set_id'] ?? "");
    width = json['width'];
    height = json['height'];
    emoji = json['emoji'];
    isAnimated = json['is_animated'];
    isMask = json['is_mask'];
    maskPosition = MaskPosition.fromJson(json['mask_position'] ?? <String, dynamic>{});
    outline = List<ClosedVectorPath>.from((json['outline'] ?? [])!.map((item) => ClosedVectorPath.fromJson(item ?? <String, dynamic>{})).toList());
    thumbnail = Thumbnail.fromJson(json['thumbnail'] ?? <String, dynamic>{});
    sticker = File.fromJson(json['sticker'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "set_id": setId,
      "width": width,
      "height": height,
      "emoji": emoji,
      "is_animated": isAnimated,
      "is_mask": isMask,
      "mask_position": maskPosition == null ? null : maskPosition?.toJson(),
      "outline": outline?.map((i) => i.toJson()).toList(),
      "thumbnail": thumbnail == null ? null : thumbnail?.toJson(),
      "sticker": sticker == null ? null : sticker?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'sticker';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}