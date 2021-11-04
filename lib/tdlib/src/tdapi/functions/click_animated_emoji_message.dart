part of '../tdapi.dart';

class ClickAnimatedEmojiMessage extends TdFunction {

  /// Informs TDLib that a message with an animated emoji was clicked by the user. Returns a big animated sticker to be played or a 404 error if usual animation needs to be played
  ClickAnimatedEmojiMessage({this.chatId,
    this.messageId});

  /// [chatId] Chat identifier of the message 
  int? chatId;

  /// [messageId] Identifier of the clicked message
  int? messageId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ClickAnimatedEmojiMessage.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'clickAnimatedEmojiMessage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}