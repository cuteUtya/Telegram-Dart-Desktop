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
    int? pre_setId;
    try{
      pre_setId=int.tryParse(json['set_id'] ?? "");
   }catch(_){}
    setId = pre_setId;
    int? pre_width;
    try{
      pre_width=json['width'];
   }catch(_){}
    width = pre_width;
    int? pre_height;
    try{
      pre_height=json['height'];
   }catch(_){}
    height = pre_height;
    String? pre_emoji;
    try{
      pre_emoji=json['emoji'];
   }catch(_){}
    emoji = pre_emoji;
    bool? pre_isAnimated;
    try{
      pre_isAnimated=json['is_animated'];
   }catch(_){}
    isAnimated = pre_isAnimated;
    bool? pre_isMask;
    try{
      pre_isMask=json['is_mask'];
   }catch(_){}
    isMask = pre_isMask;
    MaskPosition? pre_maskPosition;
    try{
      pre_maskPosition=MaskPosition.fromJson(json['mask_position'] ?? <String, dynamic>{});
   }catch(_){}
    maskPosition = pre_maskPosition;
    List<ClosedVectorPath>? pre_outline;
    try{
      pre_outline=List<ClosedVectorPath>.from((json['outline'] ?? [])!.map((item) => ClosedVectorPath.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    outline = pre_outline;
    Thumbnail? pre_thumbnail;
    try{
      pre_thumbnail=Thumbnail.fromJson(json['thumbnail'] ?? <String, dynamic>{});
   }catch(_){}
    thumbnail = pre_thumbnail;
    File? pre_sticker;
    try{
      pre_sticker=File.fromJson(json['sticker'] ?? <String, dynamic>{});
   }catch(_){}
    sticker = pre_sticker;
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