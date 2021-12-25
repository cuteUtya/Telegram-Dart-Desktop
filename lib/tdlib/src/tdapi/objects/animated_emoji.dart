part of '../tdapi.dart';

class AnimatedEmoji extends TdObject {

  /// Describes an animated representation of an emoji
  AnimatedEmoji({this.sticker,
    this.fitzpatrickType,
    this.sound});

  /// [sticker] Animated sticker for the emoji
  Sticker? sticker;

  /// [fitzpatrickType] Emoji modifier fitzpatrick type; 0-6; 0 if none
  int? fitzpatrickType;

  /// [sound] File containing the sound to be played when the animated emoji is clicked if any; may be null. The sound is encoded with the Opus codec, and stored inside an OGG container
  File? sound;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  AnimatedEmoji.fromJson(Map<String, dynamic> json)  {
    sticker = json['sticker'] == null ? null : Sticker.fromJson(json['sticker'] ?? <String, dynamic>{});
    fitzpatrickType = json['fitzpatrick_type'] == null ? null : json['fitzpatrick_type'];
    sound = json['sound'] == null ? null : File.fromJson(json['sound'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sticker": sticker == null ? null : sticker?.toJson(),
      "fitzpatrick_type": fitzpatrickType,
      "sound": sound == null ? null : sound?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'animatedEmoji';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}