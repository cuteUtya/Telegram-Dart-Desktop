part of '../tdapi.dart';

class CheckAuthenticationPassword extends TdFunction {

  /// Checks the authentication password for correctness. Works only when the current authorization state is authorizationStateWaitPassword
  CheckAuthenticationPassword({this.password});

  /// [password] The password to check
  String? password;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CheckAuthenticationPassword.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "password": password,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'checkAuthenticationPassword';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}