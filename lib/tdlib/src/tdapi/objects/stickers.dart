part of '../tdapi.dart';

class Stickers extends TdObject {

  /// Represents a list of stickers
  Stickers({this.stickers});

  /// [stickers] List of stickers
  List<Sticker>? stickers;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Stickers.fromJson(Map<String, dynamic> json)  {
    List<Sticker>? pre_stickers;
    try{
      pre_stickers=List<Sticker>.from((json['stickers'] ?? [])!.map((item) => Sticker.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    stickers = pre_stickers;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "stickers": stickers?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'stickers';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}