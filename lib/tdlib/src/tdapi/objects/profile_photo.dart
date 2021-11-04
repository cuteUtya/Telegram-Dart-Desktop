part of '../tdapi.dart';

class ProfilePhoto extends TdObject {

  /// Describes a user profile photo
  ProfilePhoto({this.id,
    this.small,
    this.big,
    this.minithumbnail,
    this.hasAnimation});

  /// [id] Photo identifier; 0 for an empty photo. Can be used to find a photo in a list of user profile photos
  int? id;

  /// [small] A small (160x160) user profile photo. The file can be downloaded only before the photo is changed
  File? small;

  /// [big] A big (640x640) user profile photo. The file can be downloaded only before the photo is changed
  File? big;

  /// [minithumbnail] User profile photo minithumbnail; may be null
  Minithumbnail? minithumbnail;

  /// [hasAnimation] True, if the photo has animated variant
  bool? hasAnimation;

  /// Parse from a json
  ProfilePhoto.fromJson(Map<String, dynamic> json)  {
    id = int.tryParse(json['id'] ?? "");
    small = File.fromJson(json['small'] ?? <String, dynamic>{});
    big = File.fromJson(json['big'] ?? <String, dynamic>{});
    minithumbnail = Minithumbnail.fromJson(json['minithumbnail'] ?? <String, dynamic>{});
    hasAnimation = json['has_animation'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "small": small == null ? null : small?.toJson(),
      "big": big == null ? null : big?.toJson(),
      "minithumbnail": minithumbnail == null ? null : minithumbnail?.toJson(),
      "has_animation": hasAnimation,
    };
  }

  static const CONSTRUCTOR = 'profilePhoto';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}