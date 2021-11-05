part of '../tdapi.dart';

class ChatInviteLinkMember extends TdObject {

  /// Describes a chat member joined a chat by an invite link
  ChatInviteLinkMember({this.userId,
    this.joinedChatDate});

  /// [userId] User identifier 
  int? userId;

  /// [joinedChatDate] Point in time (Unix timestamp) when the user joined the chat
  int? joinedChatDate;

  /// Parse from a json
  ChatInviteLinkMember.fromJson(Map<String, dynamic> json)  {
    int? pre_userId;
    try{
      pre_userId=json['user_id'];
   }catch(_){}
    userId = pre_userId;
    int? pre_joinedChatDate;
    try{
      pre_joinedChatDate=json['joined_chat_date'];
   }catch(_){}
    joinedChatDate = pre_joinedChatDate;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
      "joined_chat_date": joinedChatDate,
    };
  }

  static const CONSTRUCTOR = 'chatInviteLinkMember';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}