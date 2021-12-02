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
    duration = json['duration'] == null ? null : json['duration'];
    width = json['width'] == null ? null : json['width'];
    height = json['height'] == null ? null : json['height'];
    fileName = json['file_name'] == null ? null : json['file_name'];
    mimeType = json['mime_type'] == null ? null : json['mime_type'];
    hasStickers = json['has_stickers'] == null ? null : json['has_stickers'];
    minithumbnail = json['minithumbnail'] == null ? null : Minithumbnail.fromJson(json['minithumbnail'] ?? <String, dynamic>{});
    thumbnail = json['thumbnail'] == null ? null : Thumbnail.fromJson(json['thumbnail'] ?? <String, dynamic>{});
    animation = json['animation'] == null ? null : File.fromJson(json['animation'] ?? <String, dynamic>{});
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