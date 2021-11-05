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
    int? pre_id;
    try{
      pre_id=int.tryParse(json['id'] ?? "");
   }catch(_){}
    id = pre_id;
    bool? pre_isDefault;
    try{
      pre_isDefault=json['is_default'];
   }catch(_){}
    isDefault = pre_isDefault;
    bool? pre_isDark;
    try{
      pre_isDark=json['is_dark'];
   }catch(_){}
    isDark = pre_isDark;
    String? pre_name;
    try{
      pre_name=json['name'];
   }catch(_){}
    name = pre_name;
    Document? pre_document;
    try{
      pre_document=Document.fromJson(json['document'] ?? <String, dynamic>{});
   }catch(_){}
    document = pre_document;
    BackgroundType? pre_type;
    try{
      pre_type=BackgroundType.fromJson(json['type'] ?? <String, dynamic>{});
   }catch(_){}
    type = pre_type;
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