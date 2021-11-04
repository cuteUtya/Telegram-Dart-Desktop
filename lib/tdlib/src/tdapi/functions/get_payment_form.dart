part of '../tdapi.dart';

class GetPaymentForm extends TdFunction {

  /// Returns an invoice payment form. This method must be called when the user presses inlineKeyboardButtonBuy
  GetPaymentForm({this.chatId,
    this.messageId,
    this.theme});

  /// [chatId] Chat identifier of the Invoice message
  int? chatId;

  /// [messageId] Message identifier
  int? messageId;

  /// [theme] Preferred payment form theme; pass null to use the default theme
  PaymentFormTheme? theme;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetPaymentForm.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "theme": theme == null ? null : theme?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getPaymentForm';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}