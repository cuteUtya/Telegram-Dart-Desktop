part of '../tdapi.dart';

class CheckPhoneNumberConfirmationCode extends TdFunction {

  /// Checks phone number confirmation code
  CheckPhoneNumberConfirmationCode({this.code});

  /// [code] Confirmation code to check
  String? code;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CheckPhoneNumberConfirmationCode.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "code": code,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'checkPhoneNumberConfirmationCode';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}