part of '../tdapi.dart';

class GetChatAvailableMessageSenders extends TdFunction {

  /// Returns list of message sender identifiers, which can be used to send messages in a chat
  GetChatAvailableMessageSenders({this.chatId});

  /// [chatId] Chat identifier
  int? chatId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetChatAvailableMessageSenders.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getChatAvailableMessageSenders';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}