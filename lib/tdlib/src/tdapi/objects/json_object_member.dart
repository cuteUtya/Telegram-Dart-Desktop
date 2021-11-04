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
    key = json['key'];
    value = JsonValue.fromJson(json['value'] ?? <String, dynamic>{});
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