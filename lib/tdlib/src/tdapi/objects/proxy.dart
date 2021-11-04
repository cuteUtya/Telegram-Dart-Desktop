part of '../tdapi.dart';

class Proxy extends TdObject {

  /// Contains information about a proxy server
  Proxy({this.id,
    this.server,
    this.port,
    this.lastUsedDate,
    this.isEnabled,
    this.type});

  /// [id] Unique identifier of the proxy 
  int? id;

  /// [server] Proxy server IP address 
  String? server;

  /// [port] Proxy server port 
  int? port;

  /// [lastUsedDate] Point in time (Unix timestamp) when the proxy was last used; 0 if never 
  int? lastUsedDate;

  /// [isEnabled] True, if the proxy is enabled now 
  bool? isEnabled;

  /// [type] Type of the proxy
  ProxyType? type;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Proxy.fromJson(Map<String, dynamic> json)  {
    id = json['id'];
    server = json['server'];
    port = json['port'];
    lastUsedDate = json['last_used_date'];
    isEnabled = json['is_enabled'];
    type = ProxyType.fromJson(json['type'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "server": server,
      "port": port,
      "last_used_date": lastUsedDate,
      "is_enabled": isEnabled,
      "type": type == null ? null : type?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'proxy';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}