part of '../tdapi.dart';

class WebPage extends TdObject {

  /// Describes a web page preview
  WebPage({this.url,
    this.displayUrl,
    this.type,
    this.siteName,
    this.title,
    this.description,
    this.photo,
    this.embedUrl,
    this.embedType,
    this.embedWidth,
    this.embedHeight,
    this.duration,
    this.author,
    this.animation,
    this.audio,
    this.document,
    this.sticker,
    this.video,
    this.videoNote,
    this.voiceNote,
    this.instantViewVersion});

  /// [url] Original URL of the link
  String? url;

  /// [displayUrl] URL to display
  String? displayUrl;

  /// [type] Type of the web page. Can be: article, photo, audio, video, document, profile, app, or something else
  String? type;

  /// [siteName] Short name of the site (e.g., Google Docs, App Store)
  String? siteName;

  /// [title] Title of the content
  String? title;

  /// [description] Description of the content
  FormattedText? description;

  /// [photo] Image representing the content; may be null
  Photo? photo;

  /// [embedUrl] URL to show in the embedded preview
  String? embedUrl;

  /// [embedType] MIME type of the embedded preview, (e.g., text/html or video/mp4)
  String? embedType;

  /// [embedWidth] Width of the embedded preview
  int? embedWidth;

  /// [embedHeight] Height of the embedded preview
  int? embedHeight;

  /// [duration] Duration of the content, in seconds
  int? duration;

  /// [author] Author of the content
  String? author;

  /// [animation] Preview of the content as an animation, if available; may be null
  Animation? animation;

  /// [audio] Preview of the content as an audio file, if available; may be null
  Audio? audio;

  /// [document] Preview of the content as a document, if available (currently only available for small PDF files and ZIP archives); may be null
  Document? document;

  /// [sticker] Preview of the content as a sticker for small WEBP files, if available; may be null
  Sticker? sticker;

  /// [video] Preview of the content as a video, if available; may be null
  Video? video;

  /// [videoNote] Preview of the content as a video note, if available; may be null
  VideoNote? videoNote;

  /// [voiceNote] Preview of the content as a voice note, if available; may be null
  VoiceNote? voiceNote;

  /// [instantViewVersion] Version of instant view, available for the web page (currently can be 1 or 2), 0 if none
  int? instantViewVersion;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  WebPage.fromJson(Map<String, dynamic> json)  {
    String? pre_url;
    try{
      pre_url=json['url'];
   }catch(_){}
    url = pre_url;
    String? pre_displayUrl;
    try{
      pre_displayUrl=json['display_url'];
   }catch(_){}
    displayUrl = pre_displayUrl;
    String? pre_type;
    try{
      pre_type=json['type'];
   }catch(_){}
    type = pre_type;
    String? pre_siteName;
    try{
      pre_siteName=json['site_name'];
   }catch(_){}
    siteName = pre_siteName;
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
    FormattedText? pre_description;
    try{
      pre_description=FormattedText.fromJson(json['description'] ?? <String, dynamic>{});
   }catch(_){}
    description = pre_description;
    Photo? pre_photo;
    try{
      pre_photo=Photo.fromJson(json['photo'] ?? <String, dynamic>{});
   }catch(_){}
    photo = pre_photo;
    String? pre_embedUrl;
    try{
      pre_embedUrl=json['embed_url'];
   }catch(_){}
    embedUrl = pre_embedUrl;
    String? pre_embedType;
    try{
      pre_embedType=json['embed_type'];
   }catch(_){}
    embedType = pre_embedType;
    int? pre_embedWidth;
    try{
      pre_embedWidth=json['embed_width'];
   }catch(_){}
    embedWidth = pre_embedWidth;
    int? pre_embedHeight;
    try{
      pre_embedHeight=json['embed_height'];
   }catch(_){}
    embedHeight = pre_embedHeight;
    int? pre_duration;
    try{
      pre_duration=json['duration'];
   }catch(_){}
    duration = pre_duration;
    String? pre_author;
    try{
      pre_author=json['author'];
   }catch(_){}
    author = pre_author;
    Animation? pre_animation;
    try{
      pre_animation=Animation.fromJson(json['animation'] ?? <String, dynamic>{});
   }catch(_){}
    animation = pre_animation;
    Audio? pre_audio;
    try{
      pre_audio=Audio.fromJson(json['audio'] ?? <String, dynamic>{});
   }catch(_){}
    audio = pre_audio;
    Document? pre_document;
    try{
      pre_document=Document.fromJson(json['document'] ?? <String, dynamic>{});
   }catch(_){}
    document = pre_document;
    Sticker? pre_sticker;
    try{
      pre_sticker=Sticker.fromJson(json['sticker'] ?? <String, dynamic>{});
   }catch(_){}
    sticker = pre_sticker;
    Video? pre_video;
    try{
      pre_video=Video.fromJson(json['video'] ?? <String, dynamic>{});
   }catch(_){}
    video = pre_video;
    VideoNote? pre_videoNote;
    try{
      pre_videoNote=VideoNote.fromJson(json['video_note'] ?? <String, dynamic>{});
   }catch(_){}
    videoNote = pre_videoNote;
    VoiceNote? pre_voiceNote;
    try{
      pre_voiceNote=VoiceNote.fromJson(json['voice_note'] ?? <String, dynamic>{});
   }catch(_){}
    voiceNote = pre_voiceNote;
    int? pre_instantViewVersion;
    try{
      pre_instantViewVersion=json['instant_view_version'];
   }catch(_){}
    instantViewVersion = pre_instantViewVersion;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "url": url,
      "display_url": displayUrl,
      "type": type,
      "site_name": siteName,
      "title": title,
      "description": description == null ? null : description?.toJson(),
      "photo": photo == null ? null : photo?.toJson(),
      "embed_url": embedUrl,
      "embed_type": embedType,
      "embed_width": embedWidth,
      "embed_height": embedHeight,
      "duration": duration,
      "author": author,
      "animation": animation == null ? null : animation?.toJson(),
      "audio": audio == null ? null : audio?.toJson(),
      "document": document == null ? null : document?.toJson(),
      "sticker": sticker == null ? null : sticker?.toJson(),
      "video": video == null ? null : video?.toJson(),
      "video_note": videoNote == null ? null : videoNote?.toJson(),
      "voice_note": voiceNote == null ? null : voiceNote?.toJson(),
      "instant_view_version": instantViewVersion,
    };
  }

  static const CONSTRUCTOR = 'webPage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}