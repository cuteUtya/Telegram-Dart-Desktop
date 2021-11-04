part of '../tdapi.dart';

class SendPhoneNumberConfirmationCode extends TdFunction {

  /// Sends phone number confirmation code to handle links of the type internalLinkTypePhoneNumberConfirmation
  SendPhoneNumberConfirmationCode({this.hash,
    this.phoneNumber,
    this.settings});

  /// [hash] Hash value from the link 
  String? hash;

  /// [phoneNumber] Phone number value from the link 
  String? phoneNumber;

  /// [settings] Settings for the authentication of the user's phone number; pass null to use default settings
  PhoneNumberAuthenticationSettings? settings;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SendPhoneNumberConfirmationCode.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "hash": hash,
      "phone_number": phoneNumber,
      "settings": settings == null ? null : settings?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'sendPhoneNumberConfirmationCode';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}