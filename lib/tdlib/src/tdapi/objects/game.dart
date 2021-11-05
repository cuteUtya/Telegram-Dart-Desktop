part of '../tdapi.dart';

class Game extends TdObject {

  /// Describes a game
  Game({this.id,
    this.shortName,
    this.title,
    this.text,
    this.description,
    this.photo,
    this.animation});

  /// [id] Game game 
  int? id;

  /// [shortName] Game short name. To share a game use the URL https://t.me/{bot_username}?game={game_short_name} 
  String? shortName;

  /// [title] Game title 
  String? title;

  /// [text] Game text, usually containing scoreboards for a game
  FormattedText? text;

  /// [description] Game description
  String? description;

  /// [photo] Game photo 
  Photo? photo;

  /// [animation] Game animation; may be null
  Animation? animation;

  /// Parse from a json
  Game.fromJson(Map<String, dynamic> json)  {
    int? pre_id;
    try{
      pre_id=int.tryParse(json['id'] ?? "");
   }catch(_){}
    id = pre_id;
    String? pre_shortName;
    try{
      pre_shortName=json['short_name'];
   }catch(_){}
    shortName = pre_shortName;
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
    FormattedText? pre_text;
    try{
      pre_text=FormattedText.fromJson(json['text'] ?? <String, dynamic>{});
   }catch(_){}
    text = pre_text;
    String? pre_description;
    try{
      pre_description=json['description'];
   }catch(_){}
    description = pre_description;
    Photo? pre_photo;
    try{
      pre_photo=Photo.fromJson(json['photo'] ?? <String, dynamic>{});
   }catch(_){}
    photo = pre_photo;
    Animation? pre_animation;
    try{
      pre_animation=Animation.fromJson(json['animation'] ?? <String, dynamic>{});
   }catch(_){}
    animation = pre_animation;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "short_name": shortName,
      "title": title,
      "text": text == null ? null : text?.toJson(),
      "description": description,
      "photo": photo == null ? null : photo?.toJson(),
      "animation": animation == null ? null : animation?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'game';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}