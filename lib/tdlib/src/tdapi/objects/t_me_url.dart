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
    String? pre_url;
    try{
      pre_url=json['url'];
   }catch(_){}
    url = pre_url;
    TMeUrlType? pre_type;
    try{
      pre_type=TMeUrlType.fromJson(json['type'] ?? <String, dynamic>{});
   }catch(_){}
    type = pre_type;
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