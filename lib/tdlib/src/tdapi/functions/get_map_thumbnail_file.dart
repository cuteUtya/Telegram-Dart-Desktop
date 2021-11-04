part of '../tdapi.dart';

class GetMapThumbnailFile extends TdFunction {

  /// Returns information about a file with a map thumbnail in PNG format. Only map thumbnail files with size less than 1MB can be downloaded
  GetMapThumbnailFile({this.location,
    this.zoom,
    this.width,
    this.height,
    this.scale,
    this.chatId});

  /// [location] Location of the map center 
  Location? location;

  /// [zoom] Map zoom level; 13-20 
  int? zoom;

  /// [width] Map width in pixels before applying scale; 16-1024 
  int? width;

  /// [height] Map height in pixels before applying scale; 16-1024 
  int? height;

  /// [scale] Map scale; 1-3 
  int? scale;

  /// [chatId] Identifier of a chat, in which the thumbnail will be shown. Use 0 if unknown
  int? chatId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetMapThumbnailFile.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "location": location == null ? null : location?.toJson(),
      "zoom": zoom,
      "width": width,
      "height": height,
      "scale": scale,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getMapThumbnailFile';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}