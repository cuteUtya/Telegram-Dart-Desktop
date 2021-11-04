part of '../tdapi.dart';

class CallProtocol extends TdObject {

  /// Specifies the supported call protocols
  CallProtocol({this.udpP2p,
    this.udpReflector,
    this.minLayer,
    this.maxLayer,
    this.libraryVersions});

  /// [udpP2p] True, if UDP peer-to-peer connections are supported
  bool? udpP2p;

  /// [udpReflector] True, if connection through UDP reflectors is supported
  bool? udpReflector;

  /// [minLayer] The minimum supported API layer; use 65
  int? minLayer;

  /// [maxLayer] The maximum supported API layer; use 65
  int? maxLayer;

  /// [libraryVersions] List of supported tgcalls versions
  List<String>? libraryVersions;

  /// Parse from a json
  CallProtocol.fromJson(Map<String, dynamic> json)  {
    udpP2p = json['udp_p2p'];
    udpReflector = json['udp_reflector'];
    minLayer = json['min_layer'];
    maxLayer = json['max_layer'];
    libraryVersions = List<String>.from((json['library_versions'] ?? [])!.map((item) => item).toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "udp_p2p": udpP2p,
      "udp_reflector": udpReflector,
      "min_layer": minLayer,
      "max_layer": maxLayer,
      "library_versions": libraryVersions?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'callProtocol';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}