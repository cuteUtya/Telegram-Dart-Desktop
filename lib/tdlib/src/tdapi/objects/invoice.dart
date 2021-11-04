part of '../tdapi.dart';

class Invoice extends TdObject {

  /// Product invoice
  Invoice({this.currency,
    this.priceParts,
    this.maxTipAmount,
    this.suggestedTipAmounts,
    this.isTest,
    this.needName,
    this.needPhoneNumber,
    this.needEmailAddress,
    this.needShippingAddress,
    this.sendPhoneNumberToProvider,
    this.sendEmailAddressToProvider,
    this.isFlexible});

  /// [currency] ISO 4217 currency code
  String? currency;

  /// [priceParts] A list of objects used to calculate the total price of the product
  List<LabeledPricePart>? priceParts;

  /// [maxTipAmount] The maximum allowed amount of tip in the smallest units of the currency
  int? maxTipAmount;

  /// [suggestedTipAmounts] Suggested amounts of tip in the smallest units of the currency
  List<int>? suggestedTipAmounts;

  /// [isTest] True, if the payment is a test payment
  bool? isTest;

  /// [needName] True, if the user's name is needed for payment
  bool? needName;

  /// [needPhoneNumber] True, if the user's phone number is needed for payment
  bool? needPhoneNumber;

  /// [needEmailAddress] True, if the user's email address is needed for payment
  bool? needEmailAddress;

  /// [needShippingAddress] True, if the user's shipping address is needed for payment
  bool? needShippingAddress;

  /// [sendPhoneNumberToProvider] True, if the user's phone number will be sent to the provider
  bool? sendPhoneNumberToProvider;

  /// [sendEmailAddressToProvider] True, if the user's email address will be sent to the provider
  bool? sendEmailAddressToProvider;

  /// [isFlexible] True, if the total price depends on the shipping method
  bool? isFlexible;

  /// Parse from a json
  Invoice.fromJson(Map<String, dynamic> json)  {
    currency = json['currency'];
    priceParts = List<LabeledPricePart>.from((json['price_parts'] ?? [])!.map((item) => LabeledPricePart.fromJson(item ?? <String, dynamic>{})).toList());
    maxTipAmount = json['max_tip_amount'];
    suggestedTipAmounts = List<int>.from((json['suggested_tip_amounts'] ?? [])!.map((item) => item).toList());
    isTest = json['is_test'];
    needName = json['need_name'];
    needPhoneNumber = json['need_phone_number'];
    needEmailAddress = json['need_email_address'];
    needShippingAddress = json['need_shipping_address'];
    sendPhoneNumberToProvider = json['send_phone_number_to_provider'];
    sendEmailAddressToProvider = json['send_email_address_to_provider'];
    isFlexible = json['is_flexible'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "currency": currency,
      "price_parts": priceParts?.map((i) => i.toJson()).toList(),
      "max_tip_amount": maxTipAmount,
      "suggested_tip_amounts": suggestedTipAmounts?.map((i) => i).toList(),
      "is_test": isTest,
      "need_name": needName,
      "need_phone_number": needPhoneNumber,
      "need_email_address": needEmailAddress,
      "need_shipping_address": needShippingAddress,
      "send_phone_number_to_provider": sendPhoneNumberToProvider,
      "send_email_address_to_provider": sendEmailAddressToProvider,
      "is_flexible": isFlexible,
    };
  }

  static const CONSTRUCTOR = 'invoice';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}