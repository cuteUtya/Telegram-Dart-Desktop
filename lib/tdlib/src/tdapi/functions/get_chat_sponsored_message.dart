part of '../tdapi.dart';

class GetChatSponsoredMessage extends TdFunction {

  /// Returns sponsored message to be shown in a chat; for channel chats only. Returns a 404 error if there is no sponsored message in the chat
  GetChatSponsoredMessage({this.chatId});

  /// [chatId] Identifier of the chat
  int? chatId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetChatSponsoredMessage.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getChatSponsoredMessage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}