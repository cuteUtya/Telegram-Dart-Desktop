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
    int? pre_id;
    try{
      pre_id=int.tryParse(json['id'] ?? "");
   }catch(_){}
    id = pre_id;
    File? pre_small;
    try{
      pre_small=File.fromJson(json['small'] ?? <String, dynamic>{});
   }catch(_){}
    small = pre_small;
    File? pre_big;
    try{
      pre_big=File.fromJson(json['big'] ?? <String, dynamic>{});
   }catch(_){}
    big = pre_big;
    Minithumbnail? pre_minithumbnail;
    try{
      pre_minithumbnail=Minithumbnail.fromJson(json['minithumbnail'] ?? <String, dynamic>{});
   }catch(_){}
    minithumbnail = pre_minithumbnail;
    bool? pre_hasAnimation;
    try{
      pre_hasAnimation=json['has_animation'];
   }catch(_){}
    hasAnimation = pre_hasAnimation;
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