part of '../tdapi.dart';

class GetChatSponsoredMessages extends TdFunction {

  /// Returns sponsored messages to be shown in a chat; for channel chats only
  GetChatSponsoredMessages({this.chatId});

  /// [chatId] Identifier of the chat
  int? chatId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetChatSponsoredMessages.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getChatSponsoredMessages';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}