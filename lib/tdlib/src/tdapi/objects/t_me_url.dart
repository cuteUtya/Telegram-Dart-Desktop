part of '../tdapi.dart';

class TMeUrl extends TdObject {

  /// Represents a URL linking to an internal Telegram entity
  TMeUrl({this.url,
    this.type});

  /// [url] URL 
  String? url;

  /// [type] Type of the URL
  TMeUrlType? type;

  /// Parse from a json
  TMeUrl.fromJson(Map<String, dynamic> json)  {
    url = json['url'];
    type = TMeUrlType.fromJson(json['type'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "url": url,
      "type": type == null ? null : type?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'tMeUrl';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}