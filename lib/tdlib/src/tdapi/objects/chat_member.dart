part of '../tdapi.dart';

class ChatMember extends TdObject {

  /// Describes a user or a chat as a member of another chat
  ChatMember({this.memberId,
    this.inviterUserId,
    this.joinedChatDate,
    this.status});

  /// [memberId] Identifier of the chat member. Currently, other chats can be only Left or Banned. Only supergroups and channels can have other chats as Left or Banned members and these chats must be supergroups or channels
  MessageSender? memberId;

  /// [inviterUserId] Identifier of a user that invited/promoted/banned this member in the chat; 0 if unknown
  int? inviterUserId;

  /// [joinedChatDate] Point in time (Unix timestamp) when the user joined the chat
  int? joinedChatDate;

  /// [status] Status of the member in the chat
  ChatMemberStatus? status;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ChatMember.fromJson(Map<String, dynamic> json)  {
    memberId = json['member_id'] == null ? null : MessageSender.fromJson(json['member_id'] ?? <String, dynamic>{});
    inviterUserId = json['inviter_user_id'] == null ? null : json['inviter_user_id'];
    joinedChatDate = json['joined_chat_date'] == null ? null : json['joined_chat_date'];
    status = json['status'] == null ? null : ChatMemberStatus.fromJson(json['status'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "member_id": memberId == null ? null : memberId?.toJson(),
      "inviter_user_id": inviterUserId,
      "joined_chat_date": joinedChatDate,
      "status": status == null ? null : status?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatMember';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}