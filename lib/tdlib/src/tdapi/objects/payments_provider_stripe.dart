part of '../tdapi.dart';

class PaymentsProviderStripe extends TdObject {

  /// Stripe payment provider
  PaymentsProviderStripe({this.publishableKey,
    this.needCountry,
    this.needPostalCode,
    this.needCardholderName});

  /// [publishableKey] Stripe API publishable key 
  String? publishableKey;

  /// [needCountry] True, if the user country must be provided 
  bool? needCountry;

  /// [needPostalCode] True, if the user ZIP/postal code must be provided 
  bool? needPostalCode;

  /// [needCardholderName] True, if the cardholder name must be provided
  bool? needCardholderName;

  /// Parse from a json
  PaymentsProviderStripe.fromJson(Map<String, dynamic> json)  {
    String? pre_publishableKey;
    try{
      pre_publishableKey=json['publishable_key'];
   }catch(_){}
    publishableKey = pre_publishableKey;
    bool? pre_needCountry;
    try{
      pre_needCountry=json['need_country'];
   }catch(_){}
    needCountry = pre_needCountry;
    bool? pre_needPostalCode;
    try{
      pre_needPostalCode=json['need_postal_code'];
   }catch(_){}
    needPostalCode = pre_needPostalCode;
    bool? pre_needCardholderName;
    try{
      pre_needCardholderName=json['need_cardholder_name'];
   }catch(_){}
    needCardholderName = pre_needCardholderName;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "publishable_key": publishableKey,
      "need_country": needCountry,
      "need_postal_code": needPostalCode,
      "need_cardholder_name": needCardholderName,
    };
  }

  static const CONSTRUCTOR = 'paymentsProviderStripe';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}