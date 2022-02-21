part of '../tdapi.dart';

class SetMessageReaction extends TdFunction {

  /// Changes chosen reaction for a message
  SetMessageReaction({this.chatId,
    this.messageId,
    this.reaction,
    this.isBig});

  /// [chatId] Identifier of the chat to which the message belongs
  int? chatId;

  /// [messageId] Identifier of the message
  int? messageId;

  /// [reaction] Text representation of the new chosen reaction. Can be an empty string or the currently chosen reaction to remove the reaction
  String? reaction;

  /// [isBig] True, if the reaction is added with a big animation
  bool? isBig;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetMessageReaction.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "reaction": reaction,
      "is_big": isBig,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setMessageReaction';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}