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
    int? pre_id;
    try{
      pre_id=int.tryParse(json['id'] ?? "");
   }catch(_){}
    id = pre_id;
    Invoice? pre_invoice;
    try{
      pre_invoice=Invoice.fromJson(json['invoice'] ?? <String, dynamic>{});
   }catch(_){}
    invoice = pre_invoice;
    String? pre_url;
    try{
      pre_url=json['url'];
   }catch(_){}
    url = pre_url;
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
    PaymentsProviderStripe? pre_paymentsProvider;
    try{
      pre_paymentsProvider=PaymentsProviderStripe.fromJson(json['payments_provider'] ?? <String, dynamic>{});
   }catch(_){}
    paymentsProvider = pre_paymentsProvider;
    OrderInfo? pre_savedOrderInfo;
    try{
      pre_savedOrderInfo=OrderInfo.fromJson(json['saved_order_info'] ?? <String, dynamic>{});
   }catch(_){}
    savedOrderInfo = pre_savedOrderInfo;
    SavedCredentials? pre_savedCredentials;
    try{
      pre_savedCredentials=SavedCredentials.fromJson(json['saved_credentials'] ?? <String, dynamic>{});
   }catch(_){}
    savedCredentials = pre_savedCredentials;
    bool? pre_canSaveCredentials;
    try{
      pre_canSaveCredentials=json['can_save_credentials'];
   }catch(_){}
    canSaveCredentials = pre_canSaveCredentials;
    bool? pre_needPassword;
    try{
      pre_needPassword=json['need_password'];
   }catch(_){}
    needPassword = pre_needPassword;
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