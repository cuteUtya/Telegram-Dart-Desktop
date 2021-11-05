part of '../tdapi.dart';

class TextEntities extends TdObject {

  /// Contains a list of text entities
  TextEntities({this.entities});

  /// [entities] List of text entities
  List<TextEntity>? entities;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  TextEntities.fromJson(Map<String, dynamic> json)  {
    List<TextEntity>? pre_entities;
    try{
      pre_entities=List<TextEntity>.from((json['entities'] ?? [])!.map((item) => TextEntity.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    entities = pre_entities;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "entities": entities?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'textEntities';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}