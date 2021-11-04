part of '../tdapi.dart';

class ChangePhoneNumber extends TdFunction {

  /// Changes the phone number of the user and sends an authentication code to the user's new phone number. On success, returns information about the sent code
  ChangePhoneNumber({this.phoneNumber,
    this.settings});

  /// [phoneNumber] The new phone number of the user in international format
  String? phoneNumber;

  /// [settings] Settings for the authentication of the user's phone number; pass null to use default settings
  PhoneNumberAuthenticationSettings? settings;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ChangePhoneNumber.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "phone_number": phoneNumber,
      "settings": settings == null ? null : settings?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'changePhoneNumber';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}