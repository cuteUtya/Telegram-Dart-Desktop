part of '../tdapi.dart';

class DeclineChatJoinRequest extends TdFunction {

  /// Declines pending join request in a chat
  DeclineChatJoinRequest({this.chatId,
    this.userId});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [userId] Identifier of the user, which request will be declined
  int? userId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  DeclineChatJoinRequest.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "user_id": userId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'declineChatJoinRequest';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}