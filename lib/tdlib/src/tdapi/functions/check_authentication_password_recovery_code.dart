part of '../tdapi.dart';

class CheckAuthenticationPasswordRecoveryCode extends TdFunction {

  /// Checks whether a password recovery code sent to an email address is valid. Works only when the current authorization state is authorizationStateWaitPassword
  CheckAuthenticationPasswordRecoveryCode({this.recoveryCode});

  /// [recoveryCode] Recovery code to check
  String? recoveryCode;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CheckAuthenticationPasswordRecoveryCode.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "recovery_code": recoveryCode,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'checkAuthenticationPasswordRecoveryCode';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}