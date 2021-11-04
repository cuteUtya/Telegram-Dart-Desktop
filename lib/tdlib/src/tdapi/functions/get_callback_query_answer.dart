part of '../tdapi.dart';

class GetCallbackQueryAnswer extends TdFunction {

  /// Sends a callback query to a bot and returns an answer. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires
  GetCallbackQueryAnswer({this.chatId,
    this.messageId,
    this.payload});

  /// [chatId] Identifier of the chat with the message 
  int? chatId;

  /// [messageId] Identifier of the message from which the query originated 
  int? messageId;

  /// [payload] Query payload
  CallbackQueryPayload? payload;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetCallbackQueryAnswer.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "payload": payload == null ? null : payload?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getCallbackQueryAnswer';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}