part of '../tdapi.dart';

class GetPhoneNumberInfoSync extends TdFunction {

  /// Returns information about a phone number by its prefix synchronously. getCountries must be called at least once after changing localization to the specified language if properly localized country information is expected. Can be called synchronously
  GetPhoneNumberInfoSync({this.languageCode,
    this.phoneNumberPrefix});

  /// [languageCode] A two-letter ISO 639-1 language code for country information localization
  String? languageCode;

  /// [phoneNumberPrefix] The phone number prefix
  String? phoneNumberPrefix;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetPhoneNumberInfoSync.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "language_code": languageCode,
      "phone_number_prefix": phoneNumberPrefix,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getPhoneNumberInfoSync';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}