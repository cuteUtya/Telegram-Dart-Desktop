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
    int? pre_id;
    try{
      pre_id=int.tryParse(json['id'] ?? "");
   }catch(_){}
    id = pre_id;
    String? pre_ipAddress;
    try{
      pre_ipAddress=json['ip_address'];
   }catch(_){}
    ipAddress = pre_ipAddress;
    String? pre_ipv6Address;
    try{
      pre_ipv6Address=json['ipv6_address'];
   }catch(_){}
    ipv6Address = pre_ipv6Address;
    int? pre_port;
    try{
      pre_port=json['port'];
   }catch(_){}
    port = pre_port;
    CallServerType? pre_type;
    try{
      pre_type=CallServerType.fromJson(json['type'] ?? <String, dynamic>{});
   }catch(_){}
    type = pre_type;
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