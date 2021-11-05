part of '../tdapi.dart';

class ChatAdministrators extends TdObject {

  /// Represents a list of chat administrators
  ChatAdministrators({this.administrators});

  /// [administrators] A list of chat administrators
  List<ChatAdministrator>? administrators;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ChatAdministrators.fromJson(Map<String, dynamic> json)  {
    List<ChatAdministrator>? pre_administrators;
    try{
      pre_administrators=List<ChatAdministrator>.from((json['administrators'] ?? [])!.map((item) => ChatAdministrator.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    administrators = pre_administrators;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "administrators": administrators?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'chatAdministrators';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}