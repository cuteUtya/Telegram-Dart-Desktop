part of '../tdapi.dart';

class GetMessageLinkInfo extends TdFunction {

  /// Returns information about a public or private message link. Can be called for any internal link of the type internalLinkTypeMessage
  GetMessageLinkInfo({this.url});

  /// [url] The message link
  String? url;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetMessageLinkInfo.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "url": url,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getMessageLinkInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}