part of '../tdapi.dart';

class TMeUrls extends TdObject {

  /// Contains a list of t.me URLs
  TMeUrls({this.urls});

  /// [urls] List of URLs
  List<TMeUrl>? urls;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  TMeUrls.fromJson(Map<String, dynamic> json)  {
    urls = List<TMeUrl>.from((json['urls'] ?? [])!.map((item) => TMeUrl.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "urls": urls?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'tMeUrls';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}