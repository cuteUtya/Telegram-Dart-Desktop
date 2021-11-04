part of '../tdapi.dart';

class GetCallbackQueryMessage extends TdFunction {

  /// Returns information about a message with the callback button that originated a callback query; for bots only
  GetCallbackQueryMessage({this.chatId,
    this.messageId,
    this.callbackQueryId});

  /// [chatId] Identifier of the chat the message belongs to 
  int? chatId;

  /// [messageId] Message identifier 
  int? messageId;

  /// [callbackQueryId] Identifier of the callback query
  int? callbackQueryId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetCallbackQueryMessage.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "callback_query_id": callbackQueryId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getCallbackQueryMessage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}