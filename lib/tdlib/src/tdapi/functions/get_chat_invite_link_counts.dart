part of '../tdapi.dart';

class GetChatInviteLinkCounts extends TdFunction {

  /// Returns list of chat administrators with number of their invite links. Requires owner privileges in the chat
  GetChatInviteLinkCounts({this.chatId});

  /// [chatId] Chat identifier
  int? chatId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetChatInviteLinkCounts.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getChatInviteLinkCounts';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}