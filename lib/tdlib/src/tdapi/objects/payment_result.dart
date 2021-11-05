part of '../tdapi.dart';

class PaymentResult extends TdObject {

  /// Contains the result of a payment request
  PaymentResult({this.success,
    this.verificationUrl});

  /// [success] True, if the payment request was successful; otherwise the verification_url will be non-empty 
  bool? success;

  /// [verificationUrl] URL for additional payment credentials verification
  String? verificationUrl;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  PaymentResult.fromJson(Map<String, dynamic> json)  {
    bool? pre_success;
    try{
      pre_success=json['success'];
   }catch(_){}
    success = pre_success;
    String? pre_verificationUrl;
    try{
      pre_verificationUrl=json['verification_url'];
   }catch(_){}
    verificationUrl = pre_verificationUrl;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "success": success,
      "verification_url": verificationUrl,
    };
  }

  static const CONSTRUCTOR = 'paymentResult';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}