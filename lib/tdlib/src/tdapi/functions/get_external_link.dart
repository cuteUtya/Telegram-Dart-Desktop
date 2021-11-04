part of '../tdapi.dart';

class GetExternalLink extends TdFunction {

  /// Returns an HTTP URL which can be used to automatically authorize the current user on a website after clicking an HTTP link. Use the method getExternalLinkInfo to find whether a prior user confirmation is needed
  GetExternalLink({this.link,
    this.allowWriteAccess});

  /// [link] The HTTP link
  String? link;

  /// [allowWriteAccess] True, if the current user allowed the bot, returned in getExternalLinkInfo, to send them messages
  bool? allowWriteAccess;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetExternalLink.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "link": link,
      "allow_write_access": allowWriteAccess,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getExternalLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}