part of '../tdapi.dart';

class CloseChat extends TdFunction {

  /// Informs TDLib that the chat is closed by the user. Many useful activities depend on the chat being opened or closed
  CloseChat({this.chatId});

  /// [chatId] Chat identifier
  int? chatId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CloseChat.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'closeChat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}