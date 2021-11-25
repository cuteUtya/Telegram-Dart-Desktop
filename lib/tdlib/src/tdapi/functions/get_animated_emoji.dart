part of '../tdapi.dart';

class GetAnimatedEmoji extends TdFunction {

  /// Returns an animated emoji corresponding to a given emoji. Returns a 404 error if the emoji has no animated emoji
  GetAnimatedEmoji({this.emoji});

  /// [emoji] The emoji
  String? emoji;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetAnimatedEmoji.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "emoji": emoji,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getAnimatedEmoji';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}