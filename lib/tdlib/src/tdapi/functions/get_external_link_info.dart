part of '../tdapi.dart';

class GetExternalLinkInfo extends TdFunction {

  /// Returns information about an action to be done when the current user clicks an external link. Don't use this method for links from secret chats if web page preview is disabled in secret chats
  GetExternalLinkInfo({this.link});

  /// [link] The link
  String? link;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetExternalLinkInfo.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "link": link,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getExternalLinkInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}