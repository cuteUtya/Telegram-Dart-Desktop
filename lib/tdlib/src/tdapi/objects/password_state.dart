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
    bool? pre_hasPassword;
    try{
      pre_hasPassword=json['has_password'];
   }catch(_){}
    hasPassword = pre_hasPassword;
    String? pre_passwordHint;
    try{
      pre_passwordHint=json['password_hint'];
   }catch(_){}
    passwordHint = pre_passwordHint;
    bool? pre_hasRecoveryEmailAddress;
    try{
      pre_hasRecoveryEmailAddress=json['has_recovery_email_address'];
   }catch(_){}
    hasRecoveryEmailAddress = pre_hasRecoveryEmailAddress;
    bool? pre_hasPassportData;
    try{
      pre_hasPassportData=json['has_passport_data'];
   }catch(_){}
    hasPassportData = pre_hasPassportData;
    EmailAddressAuthenticationCodeInfo? pre_recoveryEmailAddressCodeInfo;
    try{
      pre_recoveryEmailAddressCodeInfo=EmailAddressAuthenticationCodeInfo.fromJson(json['recovery_email_address_code_info'] ?? <String, dynamic>{});
   }catch(_){}
    recoveryEmailAddressCodeInfo = pre_recoveryEmailAddressCodeInfo;
    int? pre_pendingResetDate;
    try{
      pre_pendingResetDate=json['pending_reset_date'];
   }catch(_){}
    pendingResetDate = pre_pendingResetDate;
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