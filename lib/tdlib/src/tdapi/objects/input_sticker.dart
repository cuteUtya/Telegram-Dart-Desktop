part of '../tdapi.dart';

class InputSticker extends TdObject {

  /// A sticker to be added to a sticker set
  InputSticker({this.sticker,
    this.emojis,
    this.type});

  /// [sticker] File with the sticker; must fit in a 512x512 square. For WEBP stickers and masks the file must be in PNG format, which will be converted to WEBP server-side. Otherwise, the file must be local or uploaded within a week. See https://core.telegram.org/animated_stickers#technical-requirements for technical requirements
  InputFile? sticker;

  /// [emojis] Emojis corresponding to the sticker
  String? emojis;

  /// [type] Sticker type
  StickerType? type;

  /// Parse from a json
  InputSticker.fromJson(Map<String, dynamic> json)  {
    sticker = json['sticker'] == null ? null : InputFile.fromJson(json['sticker'] ?? <String, dynamic>{});
    emojis = json['emojis'] == null ? null : json['emojis'];
    type = json['type'] == null ? null : StickerType.fromJson(json['type'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sticker": sticker == null ? null : sticker?.toJson(),
      "emojis": emojis,
      "type": type == null ? null : type?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputSticker';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}