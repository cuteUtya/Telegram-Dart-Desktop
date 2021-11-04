part of '../tdapi.dart';

class SetChatMemberStatus extends TdFunction {

  /// Changes the status of a chat member, needs appropriate privileges. This function is currently not suitable for transferring chat ownership; use transferChatOwnership instead. Use addChatMember or banChatMember if some additional parameters needs to be passed
  SetChatMemberStatus({this.chatId,
    this.memberId,
    this.status});

  /// [chatId] Chat identifier
  int? chatId;

  /// [memberId] Member identifier. Chats can be only banned and unbanned in supergroups and channels 
  MessageSender? memberId;

  /// [status] The new status of the member in the chat
  ChatMemberStatus? status;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetChatMemberStatus.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "member_id": memberId == null ? null : memberId?.toJson(),
      "status": status == null ? null : status?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setChatMemberStatus';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}