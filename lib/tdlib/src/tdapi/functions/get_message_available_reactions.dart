part of '../tdapi.dart';

class GetMessageAvailableReactions extends TdFunction {

  /// Returns reactions, which can be added to a message. The list can change after updateReactions, updateChatAvailableReactions for the chat, or updateMessageInteractionInfo for the message
  GetMessageAvailableReactions({this.chatId,
    this.messageId});

  /// [chatId] Identifier of the chat to which the message belongs
  int? chatId;

  /// [messageId] Identifier of the message
  int? messageId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetMessageAvailableReactions.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getMessageAvailableReactions';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}