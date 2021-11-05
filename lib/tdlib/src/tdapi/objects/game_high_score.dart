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
    int? pre_position;
    try{
      pre_position=json['position'];
   }catch(_){}
    position = pre_position;
    int? pre_userId;
    try{
      pre_userId=json['user_id'];
   }catch(_){}
    userId = pre_userId;
    int? pre_score;
    try{
      pre_score=json['score'];
   }catch(_){}
    score = pre_score;
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