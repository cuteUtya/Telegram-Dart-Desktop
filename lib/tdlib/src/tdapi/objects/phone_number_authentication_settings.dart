part of '../tdapi.dart';

class PhoneNumberAuthenticationSettings extends TdObject {

  /// Contains settings for the authentication of the user's phone number
  PhoneNumberAuthenticationSettings({this.allowFlashCall,
    this.allowMissedCall,
    this.isCurrentPhoneNumber,
    this.allowSmsRetrieverApi,
    this.authenticationTokens});

  /// [allowFlashCall] Pass true if the authentication code may be sent via a flash call to the specified phone number
  bool? allowFlashCall;

  /// [allowMissedCall] Pass true if the authentication code may be sent via a missed call to the specified phone number
  bool? allowMissedCall;

  /// [isCurrentPhoneNumber] Pass true if the authenticated phone number is used on the current device
  bool? isCurrentPhoneNumber;

  /// [allowSmsRetrieverApi] For official applications only. True, if the application can use Android SMS Retriever API (requires Google Play Services
  bool? allowSmsRetrieverApi;

  /// [authenticationTokens] List of up to 20 authentication tokens, recently received in updateOption("authentication_token") in previously logged out sessions
  List<String>? authenticationTokens;

  /// Parse from a json
  PhoneNumberAuthenticationSettings.fromJson(Map<String, dynamic> json)  {
    allowFlashCall = json['allow_flash_call'] == null ? null : json['allow_flash_call'];
    allowMissedCall = json['allow_missed_call'] == null ? null : json['allow_missed_call'];
    isCurrentPhoneNumber = json['is_current_phone_number'] == null ? null : json['is_current_phone_number'];
    allowSmsRetrieverApi = json['allow_sms_retriever_api'] == null ? null : json['allow_sms_retriever_api'];
    authenticationTokens = json['authentication_tokens'] == null ? null : List<String>.from((json['authentication_tokens'] ?? [])!.map((item) => item).toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "allow_flash_call": allowFlashCall,
      "allow_missed_call": allowMissedCall,
      "is_current_phone_number": isCurrentPhoneNumber,
      "allow_sms_retriever_api": allowSmsRetrieverApi,
      "authentication_tokens": authenticationTokens?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'phoneNumberAuthenticationSettings';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}