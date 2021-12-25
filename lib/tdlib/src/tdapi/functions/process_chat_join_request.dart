part of '../tdapi.dart';

class ProcessChatJoinRequest extends TdFunction {

  /// Handles a pending join request in a chat
  ProcessChatJoinRequest({this.chatId,
    this.userId,
    this.approve});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [userId] Identifier of the user that sent the request 
  int? userId;

  /// [approve] True, if the request is approved. Otherwise the request is declived
  bool? approve;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ProcessChatJoinRequest.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "user_id": userId,
      "approve": approve,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'processChatJoinRequest';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}