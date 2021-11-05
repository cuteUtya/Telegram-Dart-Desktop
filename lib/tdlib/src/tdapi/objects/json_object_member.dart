part of '../tdapi.dart';

class JsonObjectMember extends TdObject {

  /// Represents one member of a JSON object
  JsonObjectMember({this.key,
    this.value});

  /// [key] Member's key 
  String? key;

  /// [value] Member's value
  JsonValue? value;

  /// Parse from a json
  JsonObjectMember.fromJson(Map<String, dynamic> json)  {
    String? pre_key;
    try{
      pre_key=json['key'];
   }catch(_){}
    key = pre_key;
    JsonValue? pre_value;
    try{
      pre_value=JsonValue.fromJson(json['value'] ?? <String, dynamic>{});
   }catch(_){}
    value = pre_value;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "key": key,
      "value": value == null ? null : value?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'jsonObjectMember';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}