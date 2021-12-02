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
    success = json['success'] == null ? null : json['success'];
    verificationUrl = json['verification_url'] == null ? null : json['verification_url'];
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