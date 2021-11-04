part of '../tdapi.dart';

class AddProxy extends TdFunction {

  /// Adds a proxy server for network requests. Can be called before authorization
  AddProxy({this.server,
    this.port,
    this.enable,
    this.type});

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
  AddProxy.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "server": server,
      "port": port,
      "enable": enable,
      "type": type == null ? null : type?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'addProxy';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}