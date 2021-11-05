part of '../tdapi.dart';

class PhotoSize extends TdObject {

  /// Describes an image in JPEG format
  PhotoSize({this.type,
    this.photo,
    this.width,
    this.height,
    this.progressiveSizes});

  /// [type] Image type (see https://core.telegram.org/constructor/photoSize)
  String? type;

  /// [photo] Information about the image file
  File? photo;

  /// [width] Image width 
  int? width;

  /// [height] Image height
  int? height;

  /// [progressiveSizes] Sizes of progressive JPEG file prefixes, which can be used to preliminarily show the image; in bytes
  List<int>? progressiveSizes;

  /// Parse from a json
  PhotoSize.fromJson(Map<String, dynamic> json)  {
    String? pre_type;
    try{
      pre_type=json['type'];
   }catch(_){}
    type = pre_type;
    File? pre_photo;
    try{
      pre_photo=File.fromJson(json['photo'] ?? <String, dynamic>{});
   }catch(_){}
    photo = pre_photo;
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
    List<int>? pre_progressiveSizes;
    try{
      pre_progressiveSizes=List<int>.from((json['progressive_sizes'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    progressiveSizes = pre_progressiveSizes;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "type": type,
      "photo": photo == null ? null : photo?.toJson(),
      "width": width,
      "height": height,
      "progressive_sizes": progressiveSizes?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'photoSize';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}