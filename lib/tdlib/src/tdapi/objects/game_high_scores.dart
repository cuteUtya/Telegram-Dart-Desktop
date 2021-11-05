part of '../tdapi.dart';

class GameHighScores extends TdObject {

  /// Contains a list of game high scores
  GameHighScores({this.scores});

  /// [scores] A list of game high scores
  List<GameHighScore>? scores;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GameHighScores.fromJson(Map<String, dynamic> json)  {
    List<GameHighScore>? pre_scores;
    try{
      pre_scores=List<GameHighScore>.from((json['scores'] ?? [])!.map((item) => GameHighScore.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    scores = pre_scores;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "scores": scores?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'gameHighScores';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}