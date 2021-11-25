part of '../tdapi.dart';

class ApproveChatJoinRequest extends TdFunction {

  /// Approves pending join request in a chat
  ApproveChatJoinRequest({this.chatId,
    this.userId});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [userId] Identifier of the user, which request will be approved
  int? userId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ApproveChatJoinRequest.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "user_id": userId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'approveChatJoinRequest';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}