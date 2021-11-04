part of '../tdapi.dart';

class GetMessageViewers extends TdFunction {

  /// Returns viewers of a recent outgoing message in a basic group or a supergroup chat. For video notes and voice notes only users, opened content of the message, are returned. The method can be called if message.can_get_viewers == true
  GetMessageViewers({this.chatId,
    this.messageId});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [messageId] Identifier of the message
  int? messageId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetMessageViewers.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getMessageViewers';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}