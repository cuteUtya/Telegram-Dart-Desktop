part of '../tdapi.dart';

class GroupCallId extends TdObject {

  /// Contains the group call identifier
  GroupCallId({this.id});

  /// [id] Group call identifier
  int? id;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GroupCallId.fromJson(Map<String, dynamic> json)  {
    id = json['id'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
    };
  }

  static const CONSTRUCTOR = 'groupCallId';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}