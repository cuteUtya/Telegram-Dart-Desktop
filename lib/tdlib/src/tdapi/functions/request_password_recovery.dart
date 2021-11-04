part of '../tdapi.dart';

class RequestPasswordRecovery extends TdFunction {

  /// Requests to send a 2-step verification password recovery code to an email address that was previously set up
  RequestPasswordRecovery();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  RequestPasswordRecovery.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'requestPasswordRecovery';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}