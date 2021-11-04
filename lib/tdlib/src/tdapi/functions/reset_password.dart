part of '../tdapi.dart';

class ResetPassword extends TdFunction {

  /// Removes 2-step verification password without previous password and access to recovery email address. The password can't be reset immediately and the request needs to be repeated after the specified time
  ResetPassword();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ResetPassword.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'resetPassword';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}