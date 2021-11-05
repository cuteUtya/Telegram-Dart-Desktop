part of '../tdapi.dart';

class Animation extends TdObject {

  /// Describes an animation file. The animation must be encoded in GIF or MPEG4 format
  Animation({this.duration,
    this.width,
    this.height,
    this.fileName,
    this.mimeType,
    this.hasStickers,
    this.minithumbnail,
    this.thumbnail,
    this.animation});

  /// [duration] Duration of the animation, in seconds; as defined by the sender 
  int? duration;

  /// [width] Width of the animation 
  int? width;

  /// [height] Height of the animation
  int? height;

  /// [fileName] Original name of the file; as defined by the sender
  String? fileName;

  /// [mimeType] MIME type of the file, usually "image/gif" or "video/mp4"
  String? mimeType;

  /// [hasStickers] True, if stickers were added to the animation. The list of corresponding sticker set can be received using getAttachedStickerSets
  bool? hasStickers;

  /// [minithumbnail] Animation minithumbnail; may be null
  Minithumbnail? minithumbnail;

  /// [thumbnail] Animation thumbnail in JPEG or MPEG4 format; may be null 
  Thumbnail? thumbnail;

  /// [animation] File containing the animation
  File? animation;

  /// Parse from a json
  Animation.fromJson(Map<String, dynamic> json)  {
    int? pre_duration;
    try{
      pre_duration=json['duration'];
   }catch(_){}
    duration = pre_duration;
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
    String? pre_fileName;
    try{
      pre_fileName=json['file_name'];
   }catch(_){}
    fileName = pre_fileName;
    String? pre_mimeType;
    try{
      pre_mimeType=json['mime_type'];
   }catch(_){}
    mimeType = pre_mimeType;
    bool? pre_hasStickers;
    try{
      pre_hasStickers=json['has_stickers'];
   }catch(_){}
    hasStickers = pre_hasStickers;
    Minithumbnail? pre_minithumbnail;
    try{
      pre_minithumbnail=Minithumbnail.fromJson(json['minithumbnail'] ?? <String, dynamic>{});
   }catch(_){}
    minithumbnail = pre_minithumbnail;
    Thumbnail? pre_thumbnail;
    try{
      pre_thumbnail=Thumbnail.fromJson(json['thumbnail'] ?? <String, dynamic>{});
   }catch(_){}
    thumbnail = pre_thumbnail;
    File? pre_animation;
    try{
      pre_animation=File.fromJson(json['animation'] ?? <String, dynamic>{});
   }catch(_){}
    animation = pre_animation;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "duration": duration,
      "width": width,
      "height": height,
      "file_name": fileName,
      "mime_type": mimeType,
      "has_stickers": hasStickers,
      "minithumbnail": minithumbnail == null ? null : minithumbnail?.toJson(),
      "thumbnail": thumbnail == null ? null : thumbnail?.toJson(),
      "animation": animation == null ? null : animation?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'animation';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}