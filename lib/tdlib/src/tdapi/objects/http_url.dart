part of '../tdapi.dart';

class HttpUrl extends TdObject {

  /// Contains an HTTP URL
  HttpUrl({this.url});

  /// [url] The URL
  String? url;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  HttpUrl.fromJson(Map<String, dynamic> json)  {
    url = json['url'] == null ? null : json['url'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "url": url,
    };
  }

  static const CONSTRUCTOR = 'httpUrl';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}