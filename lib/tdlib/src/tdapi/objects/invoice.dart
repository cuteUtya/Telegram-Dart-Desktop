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
    String? pre_currency;
    try{
      pre_currency=json['currency'];
   }catch(_){}
    currency = pre_currency;
    List<LabeledPricePart>? pre_priceParts;
    try{
      pre_priceParts=List<LabeledPricePart>.from((json['price_parts'] ?? [])!.map((item) => LabeledPricePart.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    priceParts = pre_priceParts;
    int? pre_maxTipAmount;
    try{
      pre_maxTipAmount=json['max_tip_amount'];
   }catch(_){}
    maxTipAmount = pre_maxTipAmount;
    List<int>? pre_suggestedTipAmounts;
    try{
      pre_suggestedTipAmounts=List<int>.from((json['suggested_tip_amounts'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    suggestedTipAmounts = pre_suggestedTipAmounts;
    bool? pre_isTest;
    try{
      pre_isTest=json['is_test'];
   }catch(_){}
    isTest = pre_isTest;
    bool? pre_needName;
    try{
      pre_needName=json['need_name'];
   }catch(_){}
    needName = pre_needName;
    bool? pre_needPhoneNumber;
    try{
      pre_needPhoneNumber=json['need_phone_number'];
   }catch(_){}
    needPhoneNumber = pre_needPhoneNumber;
    bool? pre_needEmailAddress;
    try{
      pre_needEmailAddress=json['need_email_address'];
   }catch(_){}
    needEmailAddress = pre_needEmailAddress;
    bool? pre_needShippingAddress;
    try{
      pre_needShippingAddress=json['need_shipping_address'];
   }catch(_){}
    needShippingAddress = pre_needShippingAddress;
    bool? pre_sendPhoneNumberToProvider;
    try{
      pre_sendPhoneNumberToProvider=json['send_phone_number_to_provider'];
   }catch(_){}
    sendPhoneNumberToProvider = pre_sendPhoneNumberToProvider;
    bool? pre_sendEmailAddressToProvider;
    try{
      pre_sendEmailAddressToProvider=json['send_email_address_to_provider'];
   }catch(_){}
    sendEmailAddressToProvider = pre_sendEmailAddressToProvider;
    bool? pre_isFlexible;
    try{
      pre_isFlexible=json['is_flexible'];
   }catch(_){}
    isFlexible = pre_isFlexible;
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