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
    Sticker? pre_sticker;
    try{
      pre_sticker=Sticker.fromJson(json['sticker'] ?? <String, dynamic>{});
   }catch(_){}
    sticker = pre_sticker;
    List<ColorReplacement>? pre_colorReplacements;
    try{
      pre_colorReplacements=List<ColorReplacement>.from((json['color_replacements'] ?? [])!.map((item) => ColorReplacement.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    colorReplacements = pre_colorReplacements;
    File? pre_sound;
    try{
      pre_sound=File.fromJson(json['sound'] ?? <String, dynamic>{});
   }catch(_){}
    sound = pre_sound;
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