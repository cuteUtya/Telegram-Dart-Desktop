part of '../tdapi.dart';

class ChatInviteLinkMember extends TdObject {

  /// Describes a chat member joined a chat via an invite link
  ChatInviteLinkMember({this.userId,
    this.joinedChatDate,
    this.approverUserId});

  /// [userId] User identifier 
  int? userId;

  /// [joinedChatDate] Point in time (Unix timestamp) when the user joined the chat 
  int? joinedChatDate;

  /// [approverUserId] User identifier of the chat administrator, approved user join request
  int? approverUserId;

  /// Parse from a json
  ChatInviteLinkMember.fromJson(Map<String, dynamic> json)  {
    userId = json['user_id'] == null ? null : json['user_id'];
    joinedChatDate = json['joined_chat_date'] == null ? null : json['joined_chat_date'];
    approverUserId = json['approver_user_id'] == null ? null : json['approver_user_id'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
      "joined_chat_date": joinedChatDate,
      "approver_user_id": approverUserId,
    };
  }

  static const CONSTRUCTOR = 'chatInviteLinkMember';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}