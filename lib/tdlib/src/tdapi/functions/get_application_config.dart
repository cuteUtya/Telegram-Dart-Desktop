part of '../tdapi.dart';

class GetApplicationConfig extends TdFunction {

  /// Returns application config, provided by the server. Can be called before authorization
  GetApplicationConfig();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetApplicationConfig.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getApplicationConfig';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}