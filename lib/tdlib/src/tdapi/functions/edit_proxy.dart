part of '../tdapi.dart';

class EditProxy extends TdFunction {

  /// Edits an existing proxy server for network requests. Can be called before authorization
  EditProxy({this.proxyId,
    this.server,
    this.port,
    this.enable,
    this.type});

  /// [proxyId] Proxy identifier 
  int? proxyId;

  /// [server] Proxy server IP address 
  String? server;

  /// [port] Proxy server port 
  int? port;

  /// [enable] True, if the proxy needs to be enabled 
  bool? enable;

  /// [type] Proxy type
  ProxyType? type;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  EditProxy.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "proxy_id": proxyId,
      "server": server,
      "port": port,
      "enable": enable,
      "type": type == null ? null : type?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'editProxy';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}