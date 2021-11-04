part of '../tdapi.dart';

class GetGameHighScores extends TdFunction {

  /// Returns the high scores for a game and some part of the high score table in the range of the specified user; for bots only
  GetGameHighScores({this.chatId,
    this.messageId,
    this.userId});

  /// [chatId] The chat that contains the message with the game 
  int? chatId;

  /// [messageId] Identifier of the message 
  int? messageId;

  /// [userId] User identifier
  int? userId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetGameHighScores.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "user_id": userId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getGameHighScores';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}