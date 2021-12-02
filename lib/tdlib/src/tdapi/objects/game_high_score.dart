part of '../tdapi.dart';

class GameHighScore extends TdObject {

  /// Contains one row of the game high score table
  GameHighScore({this.position,
    this.userId,
    this.score});

  /// [position] Position in the high score table 
  int? position;

  /// [userId] User identifier 
  int? userId;

  /// [score] User score
  int? score;

  /// Parse from a json
  GameHighScore.fromJson(Map<String, dynamic> json)  {
    position = json['position'] == null ? null : json['position'];
    userId = json['user_id'] == null ? null : json['user_id'];
    score = json['score'] == null ? null : json['score'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "position": position,
      "user_id": userId,
      "score": score,
    };
  }

  static const CONSTRUCTOR = 'gameHighScore';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}