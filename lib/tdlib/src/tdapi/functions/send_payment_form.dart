part of '../tdapi.dart';

class SendPaymentForm extends TdFunction {

  /// Sends a filled-out payment form to the bot for final verification
  SendPaymentForm({this.chatId,
    this.messageId,
    this.paymentFormId,
    this.orderInfoId,
    this.shippingOptionId,
    this.credentials,
    this.tipAmount});

  /// [chatId] Chat identifier of the Invoice message 
  int? chatId;

  /// [messageId] Message identifier
  int? messageId;

  /// [paymentFormId] Payment form identifier returned by getPaymentForm
  int? paymentFormId;

  /// [orderInfoId] Identifier returned by validateOrderInfo, or an empty string 
  String? orderInfoId;

  /// [shippingOptionId] Identifier of a chosen shipping option, if applicable
  String? shippingOptionId;

  /// [credentials] The credentials chosen by user for payment
  InputCredentials? credentials;

  /// [tipAmount] Chosen by the user amount of tip in the smallest units of the currency
  int? tipAmount;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SendPaymentForm.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "payment_form_id": paymentFormId,
      "order_info_id": orderInfoId,
      "shipping_option_id": shippingOptionId,
      "credentials": credentials == null ? null : credentials?.toJson(),
      "tip_amount": tipAmount,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'sendPaymentForm';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}