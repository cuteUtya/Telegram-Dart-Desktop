part of '../tdapi.dart';

class CallId extends TdObject {

  /// Contains the call identifier
  CallId({this.id});

  /// [id] Call identifier
  int? id;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CallId.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : json['id'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
    };
  }

  static const CONSTRUCTOR = 'callId';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}