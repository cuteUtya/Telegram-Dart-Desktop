part of '../tdapi.dart';

class PaymentReceipt extends TdObject {

  /// Contains information about a successful payment
  PaymentReceipt({this.title,
    this.description,
    this.photo,
    this.date,
    this.sellerBotUserId,
    this.paymentsProviderUserId,
    this.invoice,
    this.orderInfo,
    this.shippingOption,
    this.credentialsTitle,
    this.tipAmount});

  /// [title] Product title
  String? title;

  /// [description] Product description
  String? description;

  /// [photo] Product photo; may be null
  Photo? photo;

  /// [date] Point in time (Unix timestamp) when the payment was made
  int? date;

  /// [sellerBotUserId] User identifier of the seller bot
  int? sellerBotUserId;

  /// [paymentsProviderUserId] User identifier of the payment provider bot
  int? paymentsProviderUserId;

  /// [invoice] Information about the invoice
  Invoice? invoice;

  /// [orderInfo] Order information; may be null
  OrderInfo? orderInfo;

  /// [shippingOption] Chosen shipping option; may be null
  ShippingOption? shippingOption;

  /// [credentialsTitle] Title of the saved credentials chosen by the buyer
  String? credentialsTitle;

  /// [tipAmount] The amount of tip chosen by the buyer in the smallest units of the currency
  int? tipAmount;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  PaymentReceipt.fromJson(Map<String, dynamic> json)  {
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
    String? pre_description;
    try{
      pre_description=json['description'];
   }catch(_){}
    description = pre_description;
    Photo? pre_photo;
    try{
      pre_photo=Photo.fromJson(json['photo'] ?? <String, dynamic>{});
   }catch(_){}
    photo = pre_photo;
    int? pre_date;
    try{
      pre_date=json['date'];
   }catch(_){}
    date = pre_date;
    int? pre_sellerBotUserId;
    try{
      pre_sellerBotUserId=json['seller_bot_user_id'];
   }catch(_){}
    sellerBotUserId = pre_sellerBotUserId;
    int? pre_paymentsProviderUserId;
    try{
      pre_paymentsProviderUserId=json['payments_provider_user_id'];
   }catch(_){}
    paymentsProviderUserId = pre_paymentsProviderUserId;
    Invoice? pre_invoice;
    try{
      pre_invoice=Invoice.fromJson(json['invoice'] ?? <String, dynamic>{});
   }catch(_){}
    invoice = pre_invoice;
    OrderInfo? pre_orderInfo;
    try{
      pre_orderInfo=OrderInfo.fromJson(json['order_info'] ?? <String, dynamic>{});
   }catch(_){}
    orderInfo = pre_orderInfo;
    ShippingOption? pre_shippingOption;
    try{
      pre_shippingOption=ShippingOption.fromJson(json['shipping_option'] ?? <String, dynamic>{});
   }catch(_){}
    shippingOption = pre_shippingOption;
    String? pre_credentialsTitle;
    try{
      pre_credentialsTitle=json['credentials_title'];
   }catch(_){}
    credentialsTitle = pre_credentialsTitle;
    int? pre_tipAmount;
    try{
      pre_tipAmount=json['tip_amount'];
   }catch(_){}
    tipAmount = pre_tipAmount;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "title": title,
      "description": description,
      "photo": photo == null ? null : photo?.toJson(),
      "date": date,
      "seller_bot_user_id": sellerBotUserId,
      "payments_provider_user_id": paymentsProviderUserId,
      "invoice": invoice == null ? null : invoice?.toJson(),
      "order_info": orderInfo == null ? null : orderInfo?.toJson(),
      "shipping_option": shippingOption == null ? null : shippingOption?.toJson(),
      "credentials_title": credentialsTitle,
      "tip_amount": tipAmount,
    };
  }

  static const CONSTRUCTOR = 'paymentReceipt';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}