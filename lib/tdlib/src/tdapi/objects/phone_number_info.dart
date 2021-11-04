part of '../tdapi.dart';

class PhoneNumberInfo extends TdObject {

  /// Contains information about a phone number
  PhoneNumberInfo({this.country,
    this.countryCallingCode,
    this.formattedPhoneNumber});

  /// [country] Information about the country to which the phone number belongs; may be null
  CountryInfo? country;

  /// [countryCallingCode] The part of the phone number denoting country calling code or its part
  String? countryCallingCode;

  /// [formattedPhoneNumber] The phone number without country calling code formatted accordingly to local rules. Expected digits are returned as '-', but even more digits might be entered by the user
  String? formattedPhoneNumber;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  PhoneNumberInfo.fromJson(Map<String, dynamic> json)  {
    country = CountryInfo.fromJson(json['country'] ?? <String, dynamic>{});
    countryCallingCode = json['country_calling_code'];
    formattedPhoneNumber = json['formatted_phone_number'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "country": country == null ? null : country?.toJson(),
      "country_calling_code": countryCallingCode,
      "formatted_phone_number": formattedPhoneNumber,
    };
  }

  static const CONSTRUCTOR = 'phoneNumberInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}