part of '../tdapi.dart';

class Video extends TdObject {

  /// Describes a video file
  Video({this.duration,
    this.width,
    this.height,
    this.fileName,
    this.mimeType,
    this.hasStickers,
    this.supportsStreaming,
    this.minithumbnail,
    this.thumbnail,
    this.video});

  /// [duration] Duration of the video, in seconds; as defined by the sender 
  int? duration;

  /// [width] Video width; as defined by the sender 
  int? width;

  /// [height] Video height; as defined by the sender
  int? height;

  /// [fileName] Original name of the file; as defined by the sender
  String? fileName;

  /// [mimeType] MIME type of the file; as defined by the sender
  String? mimeType;

  /// [hasStickers] True, if stickers were added to the video. The list of corresponding sticker sets can be received using getAttachedStickerSets
  bool? hasStickers;

  /// [supportsStreaming] True, if the video is supposed to be streamed
  bool? supportsStreaming;

  /// [minithumbnail] Video minithumbnail; may be null
  Minithumbnail? minithumbnail;

  /// [thumbnail] Video thumbnail in JPEG or MPEG4 format; as defined by the sender; may be null
  Thumbnail? thumbnail;

  /// [video] File containing the video
  File? video;

  /// Parse from a json
  Video.fromJson(Map<String, dynamic> json)  {
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
    bool? pre_supportsStreaming;
    try{
      pre_supportsStreaming=json['supports_streaming'];
   }catch(_){}
    supportsStreaming = pre_supportsStreaming;
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
    File? pre_video;
    try{
      pre_video=File.fromJson(json['video'] ?? <String, dynamic>{});
   }catch(_){}
    video = pre_video;
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
      "supports_streaming": supportsStreaming,
      "minithumbnail": minithumbnail == null ? null : minithumbnail?.toJson(),
      "thumbnail": thumbnail == null ? null : thumbnail?.toJson(),
      "video": video == null ? null : video?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'video';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}