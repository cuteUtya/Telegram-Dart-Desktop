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
    type = json['type'] == null ? null : json['type'];
    photo = json['photo'] == null ? null : File.fromJson(json['photo'] ?? <String, dynamic>{});
    width = json['width'] == null ? null : json['width'];
    height = json['height'] == null ? null : json['height'];
    progressiveSizes = json['progressive_sizes'] == null ? null : List<int>.from((json['progressive_sizes'] ?? [])!.map((item) => item).toList());
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