part of '../tdapi.dart';

class ChatAdministrator extends TdObject {

  /// Contains information about a chat administrator
  ChatAdministrator({this.userId,
    this.customTitle,
    this.isOwner});

  /// [userId] User identifier of the administrator 
  int? userId;

  /// [customTitle] Custom title of the administrator 
  String? customTitle;

  /// [isOwner] True, if the user is the owner of the chat
  bool? isOwner;

  /// Parse from a json
  ChatAdministrator.fromJson(Map<String, dynamic> json)  {
    userId = json['user_id'] == null ? null : json['user_id'];
    customTitle = json['custom_title'] == null ? null : json['custom_title'];
    isOwner = json['is_owner'] == null ? null : json['is_owner'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
      "custom_title": customTitle,
      "is_owner": isOwner,
    };
  }

  static const CONSTRUCTOR = 'chatAdministrator';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}