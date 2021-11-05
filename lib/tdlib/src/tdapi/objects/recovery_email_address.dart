part of '../tdapi.dart';

class RecoveryEmailAddress extends TdObject {

  /// Contains information about the current recovery email address
  RecoveryEmailAddress({this.recoveryEmailAddress});

  /// [recoveryEmailAddress] Recovery email address
  String? recoveryEmailAddress;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  RecoveryEmailAddress.fromJson(Map<String, dynamic> json)  {
    String? pre_recoveryEmailAddress;
    try{
      pre_recoveryEmailAddress=json['recovery_email_address'];
   }catch(_){}
    recoveryEmailAddress = pre_recoveryEmailAddress;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "recovery_email_address": recoveryEmailAddress,
    };
  }

  static const CONSTRUCTOR = 'recoveryEmailAddress';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}