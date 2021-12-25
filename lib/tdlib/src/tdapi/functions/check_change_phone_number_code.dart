part of '../tdapi.dart';

class CheckChangePhoneNumberCode extends TdFunction {

  /// Checks the authentication code sent to confirm a new phone number of the user
  CheckChangePhoneNumberCode({this.code});

  /// [code] Authentication code to check
  String? code;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CheckChangePhoneNumberCode.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "code": code,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'checkChangePhoneNumberCode';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}