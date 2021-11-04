part of '../tdapi.dart';

class ChatPhotoInfo extends TdObject {

  /// Contains basic information about the photo of a chat
  ChatPhotoInfo({this.small,
    this.big,
    this.minithumbnail,
    this.hasAnimation});

  /// [small] A small (160x160) chat photo variant in JPEG format. The file can be downloaded only before the photo is changed
  File? small;

  /// [big] A big (640x640) chat photo variant in JPEG format. The file can be downloaded only before the photo is changed
  File? big;

  /// [minithumbnail] Chat photo minithumbnail; may be null
  Minithumbnail? minithumbnail;

  /// [hasAnimation] True, if the photo has animated variant
  bool? hasAnimation;

  /// Parse from a json
  ChatPhotoInfo.fromJson(Map<String, dynamic> json)  {
    small = File.fromJson(json['small'] ?? <String, dynamic>{});
    big = File.fromJson(json['big'] ?? <String, dynamic>{});
    minithumbnail = Minithumbnail.fromJson(json['minithumbnail'] ?? <String, dynamic>{});
    hasAnimation = json['has_animation'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "small": small == null ? null : small?.toJson(),
      "big": big == null ? null : big?.toJson(),
      "minithumbnail": minithumbnail == null ? null : minithumbnail?.toJson(),
      "has_animation": hasAnimation,
    };
  }

  static const CONSTRUCTOR = 'chatPhotoInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}