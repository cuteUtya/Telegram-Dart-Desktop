part of '../tdapi.dart';

class PhoneNumberAuthenticationSettings extends TdObject {

  /// Contains settings for the authentication of the user's phone number
  PhoneNumberAuthenticationSettings({this.allowFlashCall,
    this.isCurrentPhoneNumber,
    this.allowSmsRetrieverApi});

  /// [allowFlashCall] Pass true if the authentication code may be sent via flash call to the specified phone number
  bool? allowFlashCall;

  /// [isCurrentPhoneNumber] Pass true if the authenticated phone number is used on the current device
  bool? isCurrentPhoneNumber;

  /// [allowSmsRetrieverApi] For official applications only. True, if the application can use Android SMS Retriever API (requires Google Play Services
  bool? allowSmsRetrieverApi;

  /// Parse from a json
  PhoneNumberAuthenticationSettings.fromJson(Map<String, dynamic> json)  {
    allowFlashCall = json['allow_flash_call'];
    isCurrentPhoneNumber = json['is_current_phone_number'];
    allowSmsRetrieverApi = json['allow_sms_retriever_api'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "allow_flash_call": allowFlashCall,
      "is_current_phone_number": isCurrentPhoneNumber,
      "allow_sms_retriever_api": allowSmsRetrieverApi,
    };
  }

  static const CONSTRUCTOR = 'phoneNumberAuthenticationSettings';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}