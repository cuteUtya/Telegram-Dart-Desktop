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
    int? pre_userId;
    try{
      pre_userId=json['user_id'];
   }catch(_){}
    userId = pre_userId;
    String? pre_customTitle;
    try{
      pre_customTitle=json['custom_title'];
   }catch(_){}
    customTitle = pre_customTitle;
    bool? pre_isOwner;
    try{
      pre_isOwner=json['is_owner'];
   }catch(_){}
    isOwner = pre_isOwner;
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