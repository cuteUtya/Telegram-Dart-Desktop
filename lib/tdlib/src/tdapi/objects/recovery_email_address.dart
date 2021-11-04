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
    recoveryEmailAddress = json['recovery_email_address'];
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