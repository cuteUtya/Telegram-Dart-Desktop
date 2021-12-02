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
    title = json['title'] == null ? null : json['title'];
    description = json['description'] == null ? null : json['description'];
    photo = json['photo'] == null ? null : Photo.fromJson(json['photo'] ?? <String, dynamic>{});
    date = json['date'] == null ? null : json['date'];
    sellerBotUserId = json['seller_bot_user_id'] == null ? null : json['seller_bot_user_id'];
    paymentsProviderUserId = json['payments_provider_user_id'] == null ? null : json['payments_provider_user_id'];
    invoice = json['invoice'] == null ? null : Invoice.fromJson(json['invoice'] ?? <String, dynamic>{});
    orderInfo = json['order_info'] == null ? null : OrderInfo.fromJson(json['order_info'] ?? <String, dynamic>{});
    shippingOption = json['shipping_option'] == null ? null : ShippingOption.fromJson(json['shipping_option'] ?? <String, dynamic>{});
    credentialsTitle = json['credentials_title'] == null ? null : json['credentials_title'];
    tipAmount = json['tip_amount'] == null ? null : json['tip_amount'];
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