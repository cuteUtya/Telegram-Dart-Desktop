part of '../tdapi.dart';

class PasswordState extends TdObject {

  /// Represents the current state of 2-step verification
  PasswordState({this.hasPassword,
    this.passwordHint,
    this.hasRecoveryEmailAddress,
    this.hasPassportData,
    this.recoveryEmailAddressCodeInfo,
    this.pendingResetDate});

  /// [hasPassword] True, if a 2-step verification password is set 
  bool? hasPassword;

  /// [passwordHint] Hint for the password; may be empty
  String? passwordHint;

  /// [hasRecoveryEmailAddress] True, if a recovery email is set
  bool? hasRecoveryEmailAddress;

  /// [hasPassportData] True, if some Telegram Passport elements were saved
  bool? hasPassportData;

  /// [recoveryEmailAddressCodeInfo] Information about the recovery email address to which the confirmation email was sent; may be null
  EmailAddressAuthenticationCodeInfo? recoveryEmailAddressCodeInfo;

  /// [pendingResetDate] If not 0, point in time (Unix timestamp) after which the password can be reset immediately using resetPassword
  int? pendingResetDate;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  PasswordState.fromJson(Map<String, dynamic> json)  {
    hasPassword = json['has_password'];
    passwordHint = json['password_hint'];
    hasRecoveryEmailAddress = json['has_recovery_email_address'];
    hasPassportData = json['has_passport_data'];
    recoveryEmailAddressCodeInfo = EmailAddressAuthenticationCodeInfo.fromJson(json['recovery_email_address_code_info'] ?? <String, dynamic>{});
    pendingResetDate = json['pending_reset_date'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "has_password": hasPassword,
      "password_hint": passwordHint,
      "has_recovery_email_address": hasRecoveryEmailAddress,
      "has_passport_data": hasPassportData,
      "recovery_email_address_code_info": recoveryEmailAddressCodeInfo == null ? null : recoveryEmailAddressCodeInfo?.toJson(),
      "pending_reset_date": pendingResetDate,
    };
  }

  static const CONSTRUCTOR = 'passwordState';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}