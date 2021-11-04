part of '../tdapi.dart';

class SetRecoveryEmailAddress extends TdFunction {

  /// Changes the 2-step verification recovery email address of the user. If a new recovery email address is specified, then the change will not be applied until the new recovery email address is confirmed.. If new_recovery_email_address is the same as the email address that is currently set up, this call succeeds immediately and aborts all other requests waiting for an email confirmation
  SetRecoveryEmailAddress({this.password,
    this.newRecoveryEmailAddress});

  /// [password] Password of the current user 
  String? password;

  /// [newRecoveryEmailAddress] New recovery email address
  String? newRecoveryEmailAddress;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetRecoveryEmailAddress.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "password": password,
      "new_recovery_email_address": newRecoveryEmailAddress,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setRecoveryEmailAddress';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}