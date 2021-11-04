part of '../tdapi.dart';

class RemoveRecentHashtag extends TdFunction {

  /// Removes a hashtag from the list of recently used hashtags
  RemoveRecentHashtag({this.hashtag});

  /// [hashtag] Hashtag to delete
  String? hashtag;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  RemoveRecentHashtag.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "hashtag": hashtag,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'removeRecentHashtag';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}