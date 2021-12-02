part of '../tdapi.dart';

class Background extends TdObject {

  /// Describes a chat background
  Background({this.id,
    this.isDefault,
    this.isDark,
    this.name,
    this.document,
    this.type});

  /// [id] Unique background identifier
  int? id;

  /// [isDefault] True, if this is one of default backgrounds
  bool? isDefault;

  /// [isDark] True, if the background is dark and is recommended to be used with dark theme
  bool? isDark;

  /// [name] Unique background name
  String? name;

  /// [document] Document with the background; may be null. Null only for filled backgrounds
  Document? document;

  /// [type] Type of the background
  BackgroundType? type;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Background.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : int.tryParse(json['id'] ?? "");
    isDefault = json['is_default'] == null ? null : json['is_default'];
    isDark = json['is_dark'] == null ? null : json['is_dark'];
    name = json['name'] == null ? null : json['name'];
    document = json['document'] == null ? null : Document.fromJson(json['document'] ?? <String, dynamic>{});
    type = json['type'] == null ? null : BackgroundType.fromJson(json['type'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "is_default": isDefault,
      "is_dark": isDark,
      "name": name,
      "document": document == null ? null : document?.toJson(),
      "type": type == null ? null : type?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'background';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}