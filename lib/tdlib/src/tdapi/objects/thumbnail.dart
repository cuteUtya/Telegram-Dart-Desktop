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
    format = ThumbnailFormat.fromJson(json['format'] ?? <String, dynamic>{});
    width = json['width'];
    height = json['height'];
    file = File.fromJson(json['file'] ?? <String, dynamic>{});
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