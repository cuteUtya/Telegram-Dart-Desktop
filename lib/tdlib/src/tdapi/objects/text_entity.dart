part of '../tdapi.dart';

class TextEntity extends TdObject {

  /// Represents a part of the text that needs to be formatted in some unusual way
  TextEntity({this.offset,
    this.length,
    this.type});

  /// [offset] Offset of the entity, in UTF-16 code units 
  int? offset;

  /// [length] Length of the entity, in UTF-16 code units 
  int? length;

  /// [type] Type of the entity
  TextEntityType? type;

  /// Parse from a json
  TextEntity.fromJson(Map<String, dynamic> json)  {
    offset = json['offset'] == null ? null : json['offset'];
    length = json['length'] == null ? null : json['length'];
    type = json['type'] == null ? null : TextEntityType.fromJson(json['type'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "offset": offset,
      "length": length,
      "type": type == null ? null : type?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'textEntity';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}