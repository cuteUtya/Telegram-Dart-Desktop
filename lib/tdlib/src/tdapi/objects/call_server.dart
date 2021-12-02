part of '../tdapi.dart';

class CallServer extends TdObject {

  /// Describes a server for relaying call data
  CallServer({this.id,
    this.ipAddress,
    this.ipv6Address,
    this.port,
    this.type});

  /// [id] Server identifier 
  int? id;

  /// [ipAddress] Server IPv4 address 
  String? ipAddress;

  /// [ipv6Address] Server IPv6 address 
  String? ipv6Address;

  /// [port] Server port number 
  int? port;

  /// [type] Server type
  CallServerType? type;

  /// Parse from a json
  CallServer.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : int.tryParse(json['id'] ?? "");
    ipAddress = json['ip_address'] == null ? null : json['ip_address'];
    ipv6Address = json['ipv6_address'] == null ? null : json['ipv6_address'];
    port = json['port'] == null ? null : json['port'];
    type = json['type'] == null ? null : CallServerType.fromJson(json['type'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "ip_address": ipAddress,
      "ipv6_address": ipv6Address,
      "port": port,
      "type": type == null ? null : type?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'callServer';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}