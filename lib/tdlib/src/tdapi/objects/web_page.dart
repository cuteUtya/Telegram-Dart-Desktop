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
    url = json['url'] == null ? null : json['url'];
    displayUrl = json['display_url'] == null ? null : json['display_url'];
    type = json['type'] == null ? null : json['type'];
    siteName = json['site_name'] == null ? null : json['site_name'];
    title = json['title'] == null ? null : json['title'];
    description = json['description'] == null ? null : FormattedText.fromJson(json['description'] ?? <String, dynamic>{});
    photo = json['photo'] == null ? null : Photo.fromJson(json['photo'] ?? <String, dynamic>{});
    embedUrl = json['embed_url'] == null ? null : json['embed_url'];
    embedType = json['embed_type'] == null ? null : json['embed_type'];
    embedWidth = json['embed_width'] == null ? null : json['embed_width'];
    embedHeight = json['embed_height'] == null ? null : json['embed_height'];
    duration = json['duration'] == null ? null : json['duration'];
    author = json['author'] == null ? null : json['author'];
    animation = json['animation'] == null ? null : Animation.fromJson(json['animation'] ?? <String, dynamic>{});
    audio = json['audio'] == null ? null : Audio.fromJson(json['audio'] ?? <String, dynamic>{});
    document = json['document'] == null ? null : Document.fromJson(json['document'] ?? <String, dynamic>{});
    sticker = json['sticker'] == null ? null : Sticker.fromJson(json['sticker'] ?? <String, dynamic>{});
    video = json['video'] == null ? null : Video.fromJson(json['video'] ?? <String, dynamic>{});
    videoNote = json['video_note'] == null ? null : VideoNote.fromJson(json['video_note'] ?? <String, dynamic>{});
    voiceNote = json['voice_note'] == null ? null : VoiceNote.fromJson(json['voice_note'] ?? <String, dynamic>{});
    instantViewVersion = json['instant_view_version'] == null ? null : json['instant_view_version'];
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