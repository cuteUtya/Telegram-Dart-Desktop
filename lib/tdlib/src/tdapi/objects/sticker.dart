part of '../tdapi.dart';

class Sticker extends TdObject {

  /// Describes a sticker
  Sticker({this.setId,
    this.width,
    this.height,
    this.emoji,
    this.type,
    this.outline,
    this.thumbnail,
    this.sticker});

  /// [setId] The identifier of the sticker set to which the sticker belongs; 0 if none 
  int? setId;

  /// [width] Sticker width; as defined by the sender 
  int? width;

  /// [height] Sticker height; as defined by the sender
  int? height;

  /// [emoji] Emoji corresponding to the sticker
  String? emoji;

  /// [type] Sticker type 
  StickerType? type;

  /// [outline] Sticker's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
  List<ClosedVectorPath>? outline;

  /// [thumbnail] Sticker thumbnail in WEBP or JPEG format; may be null
  Thumbnail? thumbnail;

  /// [sticker] File containing the sticker
  File? sticker;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Sticker.fromJson(Map<String, dynamic> json)  {
    setId = json['set_id'] == null ? null : int.tryParse(json['set_id'] ?? "");
    width = json['width'] == null ? null : json['width'];
    height = json['height'] == null ? null : json['height'];
    emoji = json['emoji'] == null ? null : json['emoji'];
    type = json['type'] == null ? null : StickerType.fromJson(json['type'] ?? <String, dynamic>{});
    outline = json['outline'] == null ? null : List<ClosedVectorPath>.from((json['outline'] ?? [])!.map((item) => ClosedVectorPath.fromJson(item ?? <String, dynamic>{})).toList());
    thumbnail = json['thumbnail'] == null ? null : Thumbnail.fromJson(json['thumbnail'] ?? <String, dynamic>{});
    sticker = json['sticker'] == null ? null : File.fromJson(json['sticker'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "set_id": setId,
      "width": width,
      "height": height,
      "emoji": emoji,
      "type": type == null ? null : type?.toJson(),
      "outline": outline?.map((i) => i.toJson()).toList(),
      "thumbnail": thumbnail == null ? null : thumbnail?.toJson(),
      "sticker": sticker == null ? null : sticker?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'sticker';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}