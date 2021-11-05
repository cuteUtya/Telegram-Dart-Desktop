part of '../tdapi.dart';

class VideoNote extends TdObject {

  /// Describes a video note. The video must be equal in width and height, cropped to a circle, and stored in MPEG4 format
  VideoNote({this.duration,
    this.length,
    this.minithumbnail,
    this.thumbnail,
    this.video});

  /// [duration] Duration of the video, in seconds; as defined by the sender
  int? duration;

  /// [length] Video width and height; as defined by the sender
  int? length;

  /// [minithumbnail] Video minithumbnail; may be null
  Minithumbnail? minithumbnail;

  /// [thumbnail] Video thumbnail in JPEG format; as defined by the sender; may be null
  Thumbnail? thumbnail;

  /// [video] File containing the video
  File? video;

  /// Parse from a json
  VideoNote.fromJson(Map<String, dynamic> json)  {
    int? pre_duration;
    try{
      pre_duration=json['duration'];
   }catch(_){}
    duration = pre_duration;
    int? pre_length;
    try{
      pre_length=json['length'];
   }catch(_){}
    length = pre_length;
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
      "length": length,
      "minithumbnail": minithumbnail == null ? null : minithumbnail?.toJson(),
      "thumbnail": thumbnail == null ? null : thumbnail?.toJson(),
      "video": video == null ? null : video?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'videoNote';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}