part of '../tdapi.dart';

class CheckPasswordRecoveryCode extends TdFunction {

  /// Checks whether a 2-step verification password recovery code sent to an email address is valid
  CheckPasswordRecoveryCode({this.recoveryCode});

  /// [recoveryCode] Recovery code to check
  String? recoveryCode;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CheckPasswordRecoveryCode.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "recovery_code": recoveryCode,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'checkPasswordRecoveryCode';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}