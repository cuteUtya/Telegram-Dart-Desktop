part of '../tdapi.dart';

class GetProxyLink extends TdFunction {

  /// Returns an HTTPS link, which can be used to add a proxy. Available only for SOCKS5 and MTProto proxies. Can be called before authorization
  GetProxyLink({this.proxyId});

  /// [proxyId] Proxy identifier
  int? proxyId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetProxyLink.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "proxy_id": proxyId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getProxyLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}