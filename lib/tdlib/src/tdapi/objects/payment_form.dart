part of '../tdapi.dart';

class PaymentForm extends TdObject {

  /// Contains information about an invoice payment form
  PaymentForm({this.id,
    this.invoice,
    this.url,
    this.sellerBotUserId,
    this.paymentsProviderUserId,
    this.paymentsProvider,
    this.savedOrderInfo,
    this.savedCredentials,
    this.canSaveCredentials,
    this.needPassword});

  /// [id] The payment form identifier
  int? id;

  /// [invoice] Full information of the invoice
  Invoice? invoice;

  /// [url] Payment form URL
  String? url;

  /// [sellerBotUserId] User identifier of the seller bot
  int? sellerBotUserId;

  /// [paymentsProviderUserId] User identifier of the payment provider bot
  int? paymentsProviderUserId;

  /// [paymentsProvider] Information about the payment provider, if available, to support it natively without the need for opening the URL; may be null
  PaymentsProviderStripe? paymentsProvider;

  /// [savedOrderInfo] Saved server-side order information; may be null
  OrderInfo? savedOrderInfo;

  /// [savedCredentials] Information about saved card credentials; may be null
  SavedCredentials? savedCredentials;

  /// [canSaveCredentials] True, if the user can choose to save credentials
  bool? canSaveCredentials;

  /// [needPassword] True, if the user will be able to save credentials protected by a password they set up
  bool? needPassword;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  PaymentForm.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : int.tryParse(json['id'] ?? "");
    invoice = json['invoice'] == null ? null : Invoice.fromJson(json['invoice'] ?? <String, dynamic>{});
    url = json['url'] == null ? null : json['url'];
    sellerBotUserId = json['seller_bot_user_id'] == null ? null : json['seller_bot_user_id'];
    paymentsProviderUserId = json['payments_provider_user_id'] == null ? null : json['payments_provider_user_id'];
    paymentsProvider = json['payments_provider'] == null ? null : PaymentsProviderStripe.fromJson(json['payments_provider'] ?? <String, dynamic>{});
    savedOrderInfo = json['saved_order_info'] == null ? null : OrderInfo.fromJson(json['saved_order_info'] ?? <String, dynamic>{});
    savedCredentials = json['saved_credentials'] == null ? null : SavedCredentials.fromJson(json['saved_credentials'] ?? <String, dynamic>{});
    canSaveCredentials = json['can_save_credentials'] == null ? null : json['can_save_credentials'];
    needPassword = json['need_password'] == null ? null : json['need_password'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "invoice": invoice == null ? null : invoice?.toJson(),
      "url": url,
      "seller_bot_user_id": sellerBotUserId,
      "payments_provider_user_id": paymentsProviderUserId,
      "payments_provider": paymentsProvider == null ? null : paymentsProvider?.toJson(),
      "saved_order_info": savedOrderInfo == null ? null : savedOrderInfo?.toJson(),
      "saved_credentials": savedCredentials == null ? null : savedCredentials?.toJson(),
      "can_save_credentials": canSaveCredentials,
      "need_password": needPassword,
    };
  }

  static const CONSTRUCTOR = 'paymentForm';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}