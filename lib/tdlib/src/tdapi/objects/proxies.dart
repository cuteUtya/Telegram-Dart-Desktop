part of '../tdapi.dart';

class Proxies extends TdObject {

  /// Represents a list of proxy servers
  Proxies({this.proxies});

  /// [proxies] List of proxy servers
  List<Proxy>? proxies;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Proxies.fromJson(Map<String, dynamic> json)  {
    List<Proxy>? pre_proxies;
    try{
      pre_proxies=List<Proxy>.from((json['proxies'] ?? [])!.map((item) => Proxy.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    proxies = pre_proxies;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "proxies": proxies?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'proxies';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}