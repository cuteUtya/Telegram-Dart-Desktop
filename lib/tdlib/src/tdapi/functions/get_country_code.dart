part of '../tdapi.dart';

class GetCountryCode extends TdFunction {

  /// Uses the current IP address to find the current country. Returns two-letter ISO 3166-1 alpha-2 country code. Can be called before authorization
  GetCountryCode();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetCountryCode.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getCountryCode';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}