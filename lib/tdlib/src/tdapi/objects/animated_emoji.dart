part of '../tdapi.dart';

class AnimatedEmoji extends TdObject {

  /// Describes an animated representation of an emoji
  AnimatedEmoji({this.sticker,
    this.colorReplacements,
    this.sound});

  /// [sticker] Animated sticker for the emoji
  Sticker? sticker;

  /// [colorReplacements] List of colors to be replaced while the sticker is rendered
  List<ColorReplacement>? colorReplacements;

  /// [sound] File containing the sound to be played when the animated emoji is clicked if any; may be null. The sound is encoded with the Opus codec, and stored inside an OGG container
  File? sound;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  AnimatedEmoji.fromJson(Map<String, dynamic> json)  {
    sticker = json['sticker'] == null ? null : Sticker.fromJson(json['sticker'] ?? <String, dynamic>{});
    colorReplacements = json['color_replacements'] == null ? null : List<ColorReplacement>.from((json['color_replacements'] ?? [])!.map((item) => ColorReplacement.fromJson(item ?? <String, dynamic>{})).toList());
    sound = json['sound'] == null ? null : File.fromJson(json['sound'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sticker": sticker == null ? null : sticker?.toJson(),
      "color_replacements": colorReplacements?.map((i) => i.toJson()).toList(),
      "sound": sound == null ? null : sound?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'animatedEmoji';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}