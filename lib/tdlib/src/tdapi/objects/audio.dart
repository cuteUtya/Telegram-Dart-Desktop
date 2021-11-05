part of '../tdapi.dart';

class Audio extends TdObject {

  /// Describes an audio file. Audio is usually in MP3 or M4A format
  Audio({this.duration,
    this.title,
    this.performer,
    this.fileName,
    this.mimeType,
    this.albumCoverMinithumbnail,
    this.albumCoverThumbnail,
    this.audio});

  /// [duration] Duration of the audio, in seconds; as defined by the sender 
  int? duration;

  /// [title] Title of the audio; as defined by the sender 
  String? title;

  /// [performer] Performer of the audio; as defined by the sender
  String? performer;

  /// [fileName] Original name of the file; as defined by the sender
  String? fileName;

  /// [mimeType] The MIME type of the file; as defined by the sender 
  String? mimeType;

  /// [albumCoverMinithumbnail] The minithumbnail of the album cover; may be null
  Minithumbnail? albumCoverMinithumbnail;

  /// [albumCoverThumbnail] The thumbnail of the album cover in JPEG format; as defined by the sender. The full size thumbnail is supposed to be extracted from the downloaded file; may be null
  Thumbnail? albumCoverThumbnail;

  /// [audio] File containing the audio
  File? audio;

  /// Parse from a json
  Audio.fromJson(Map<String, dynamic> json)  {
    int? pre_duration;
    try{
      pre_duration=json['duration'];
   }catch(_){}
    duration = pre_duration;
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
    String? pre_performer;
    try{
      pre_performer=json['performer'];
   }catch(_){}
    performer = pre_performer;
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
    Minithumbnail? pre_albumCoverMinithumbnail;
    try{
      pre_albumCoverMinithumbnail=Minithumbnail.fromJson(json['album_cover_minithumbnail'] ?? <String, dynamic>{});
   }catch(_){}
    albumCoverMinithumbnail = pre_albumCoverMinithumbnail;
    Thumbnail? pre_albumCoverThumbnail;
    try{
      pre_albumCoverThumbnail=Thumbnail.fromJson(json['album_cover_thumbnail'] ?? <String, dynamic>{});
   }catch(_){}
    albumCoverThumbnail = pre_albumCoverThumbnail;
    File? pre_audio;
    try{
      pre_audio=File.fromJson(json['audio'] ?? <String, dynamic>{});
   }catch(_){}
    audio = pre_audio;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "duration": duration,
      "title": title,
      "performer": performer,
      "file_name": fileName,
      "mime_type": mimeType,
      "album_cover_minithumbnail": albumCoverMinithumbnail == null ? null : albumCoverMinithumbnail?.toJson(),
      "album_cover_thumbnail": albumCoverThumbnail == null ? null : albumCoverThumbnail?.toJson(),
      "audio": audio == null ? null : audio?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'audio';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}