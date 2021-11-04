part of '../tdapi.dart';

class GetChatMember extends TdFunction {

  /// Returns information about a single member of a chat
  GetChatMember({this.chatId,
    this.memberId});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [memberId] Member identifier
  MessageSender? memberId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetChatMember.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "member_id": memberId == null ? null : memberId?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getChatMember';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}