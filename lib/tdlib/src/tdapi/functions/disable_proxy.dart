part of '../tdapi.dart';

class DisableProxy extends TdFunction {

  /// Disables the currently enabled proxy. Can be called before authorization
  DisableProxy();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  DisableProxy.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'disableProxy';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}