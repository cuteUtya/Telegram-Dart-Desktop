part of '../tdapi.dart';

class GetSuggestedStickerSetName extends TdFunction {

  /// Returns a suggested name for a new sticker set with a given title
  GetSuggestedStickerSetName({this.title});

  /// [title] Sticker set title; 1-64 characters
  String? title;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetSuggestedStickerSetName.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "title": title,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getSuggestedStickerSetName';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}