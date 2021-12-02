part of '../tdapi.dart';

class Address extends TdObject {

  /// Describes an address
  Address({this.countryCode,
    this.state,
    this.city,
    this.streetLine1,
    this.streetLine2,
    this.postalCode});

  /// [countryCode] A two-letter ISO 3166-1 alpha-2 country code 
  String? countryCode;

  /// [state] State, if applicable 
  String? state;

  /// [city] City 
  String? city;

  /// [streetLine1] First line of the address 
  String? streetLine1;

  /// [streetLine2] Second line of the address 
  String? streetLine2;

  /// [postalCode] Address postal code
  String? postalCode;

  /// Parse from a json
  Address.fromJson(Map<String, dynamic> json)  {
    countryCode = json['country_code'] == null ? null : json['country_code'];
    state = json['state'] == null ? null : json['state'];
    city = json['city'] == null ? null : json['city'];
    streetLine1 = json['street_line1'] == null ? null : json['street_line1'];
    streetLine2 = json['street_line2'] == null ? null : json['street_line2'];
    postalCode = json['postal_code'] == null ? null : json['postal_code'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "country_code": countryCode,
      "state": state,
      "city": city,
      "street_line1": streetLine1,
      "street_line2": streetLine2,
      "postal_code": postalCode,
    };
  }

  static const CONSTRUCTOR = 'address';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}