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
    id = json['id'] == null ? null : int.tryParse(json['id'] ?? "");
    shortName = json['short_name'] == null ? null : json['short_name'];
    title = json['title'] == null ? null : json['title'];
    text = json['text'] == null ? null : FormattedText.fromJson(json['text'] ?? <String, dynamic>{});
    description = json['description'] == null ? null : json['description'];
    photo = json['photo'] == null ? null : Photo.fromJson(json['photo'] ?? <String, dynamic>{});
    animation = json['animation'] == null ? null : Animation.fromJson(json['animation'] ?? <String, dynamic>{});
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