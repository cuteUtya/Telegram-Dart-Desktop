part of '../tdapi.dart';

class GetInternalLinkType extends TdFunction {

  /// Returns information about the type of an internal link. Returns a 404 error if the link is not internal. Can be called before authorization
  GetInternalLinkType({this.link});

  /// [link] The link
  String? link;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetInternalLinkType.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "link": link,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getInternalLinkType';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}