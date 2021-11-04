part of '../tdapi.dart';

class SetGameScore extends TdFunction {

  /// Updates the game score of the specified user in the game; for bots only
  SetGameScore({this.chatId,
    this.messageId,
    this.editMessage,
    this.userId,
    this.score,
    this.force});

  /// [chatId] The chat to which the message with the game belongs 
  int? chatId;

  /// [messageId] Identifier of the message 
  int? messageId;

  /// [editMessage] True, if the message needs to be edited 
  bool? editMessage;

  /// [userId] User identifier 
  int? userId;

  /// [score] The new score
  int? score;

  /// [force] Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
  bool? force;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetGameScore.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "edit_message": editMessage,
      "user_id": userId,
      "score": score,
      "force": force,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setGameScore';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}