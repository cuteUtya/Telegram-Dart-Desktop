part of '../tdapi.dart';

class SetChatMessageSender extends TdFunction {

  /// Selects a message sender to send messages in a chat
  SetChatMessageSender({this.chatId,
    this.messageSenderId});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [messageSenderId] New message sender for the chat
  MessageSender? messageSenderId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetChatMessageSender.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_sender_id": messageSenderId == null ? null : messageSenderId?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setChatMessageSender';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}