part of '../tdapi.dart';

class Thumbnail extends TdObject {

  /// Represents a thumbnail
  Thumbnail({this.format,
    this.width,
    this.height,
    this.file});

  /// [format] Thumbnail format 
  ThumbnailFormat? format;

  /// [width] Thumbnail width 
  int? width;

  /// [height] Thumbnail height 
  int? height;

  /// [file] The thumbnail
  File? file;

  /// Parse from a json
  Thumbnail.fromJson(Map<String, dynamic> json)  {
    ThumbnailFormat? pre_format;
    try{
      pre_format=ThumbnailFormat.fromJson(json['format'] ?? <String, dynamic>{});
   }catch(_){}
    format = pre_format;
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
    File? pre_file;
    try{
      pre_file=File.fromJson(json['file'] ?? <String, dynamic>{});
   }catch(_){}
    file = pre_file;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "format": format == null ? null : format?.toJson(),
      "width": width,
      "height": height,
      "file": file == null ? null : file?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'thumbnail';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}