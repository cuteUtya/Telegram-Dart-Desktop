part of '../tdapi.dart';

class OrderInfo extends TdObject {

  /// Order information
  OrderInfo({this.name,
    this.phoneNumber,
    this.emailAddress,
    this.shippingAddress});

  /// [name] Name of the user 
  String? name;

  /// [phoneNumber] Phone number of the user 
  String? phoneNumber;

  /// [emailAddress] Email address of the user 
  String? emailAddress;

  /// [shippingAddress] Shipping address for this order; may be null
  Address? shippingAddress;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  OrderInfo.fromJson(Map<String, dynamic> json)  {
    name = json['name'];
    phoneNumber = json['phone_number'];
    emailAddress = json['email_address'];
    shippingAddress = Address.fromJson(json['shipping_address'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "name": name,
      "phone_number": phoneNumber,
      "email_address": emailAddress,
      "shipping_address": shippingAddress == null ? null : shippingAddress?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'orderInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}