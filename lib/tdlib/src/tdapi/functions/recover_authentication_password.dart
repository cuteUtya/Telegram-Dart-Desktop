part of '../tdapi.dart';

class RecoverAuthenticationPassword extends TdFunction {

  /// Recovers the password with a password recovery code sent to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword
  RecoverAuthenticationPassword({this.recoveryCode,
    this.newPassword,
    this.newHint});

  /// [recoveryCode] Recovery code to check
  String? recoveryCode;

  /// [newPassword] New password of the user; may be empty to remove the password 
  String? newPassword;

  /// [newHint] New password hint; may be empty
  String? newHint;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  RecoverAuthenticationPassword.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "recovery_code": recoveryCode,
      "new_password": newPassword,
      "new_hint": newHint,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'recoverAuthenticationPassword';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}