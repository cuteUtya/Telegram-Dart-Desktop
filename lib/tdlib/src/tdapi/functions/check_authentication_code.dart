part of '../tdapi.dart';

class CheckAuthenticationCode extends TdFunction {

  /// Checks the authentication code. Works only when the current authorization state is authorizationStateWaitCode
  CheckAuthenticationCode({this.code});

  /// [code] Authentication code to check
  String? code;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CheckAuthenticationCode.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "code": code,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'checkAuthenticationCode';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}