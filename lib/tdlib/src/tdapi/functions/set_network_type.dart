part of '../tdapi.dart';

class SetNetworkType extends TdFunction {

  /// Sets the current network type. Can be called before authorization. Calling this method forces all network connections to reopen, mitigating the delay in switching between different networks, so it must be called whenever the network is changed, even if the network type remains the same.. Network type is used to check whether the library can use the network at all and also for collecting detailed network data usage statistics
  SetNetworkType({this.type});

  /// [type] The new network type; pass null to set network type to networkTypeOther
  NetworkType? type;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetNetworkType.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "type": type == null ? null : type?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setNetworkType';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}