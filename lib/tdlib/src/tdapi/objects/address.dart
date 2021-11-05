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
    String? pre_countryCode;
    try{
      pre_countryCode=json['country_code'];
   }catch(_){}
    countryCode = pre_countryCode;
    String? pre_state;
    try{
      pre_state=json['state'];
   }catch(_){}
    state = pre_state;
    String? pre_city;
    try{
      pre_city=json['city'];
   }catch(_){}
    city = pre_city;
    String? pre_streetLine1;
    try{
      pre_streetLine1=json['street_line1'];
   }catch(_){}
    streetLine1 = pre_streetLine1;
    String? pre_streetLine2;
    try{
      pre_streetLine2=json['street_line2'];
   }catch(_){}
    streetLine2 = pre_streetLine2;
    String? pre_postalCode;
    try{
      pre_postalCode=json['postal_code'];
   }catch(_){}
    postalCode = pre_postalCode;
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