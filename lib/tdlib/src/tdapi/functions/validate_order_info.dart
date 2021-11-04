part of '../tdapi.dart';

class ValidateOrderInfo extends TdFunction {

  /// Validates the order information provided by a user and returns the available shipping options for a flexible invoice
  ValidateOrderInfo({this.chatId,
    this.messageId,
    this.orderInfo,
    this.allowSave});

  /// [chatId] Chat identifier of the Invoice message
  int? chatId;

  /// [messageId] Message identifier
  int? messageId;

  /// [orderInfo] The order information, provided by the user; pass null if empty
  OrderInfo? orderInfo;

  /// [allowSave] True, if the order information can be saved
  bool? allowSave;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ValidateOrderInfo.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "order_info": orderInfo == null ? null : orderInfo?.toJson(),
      "allow_save": allowSave,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'validateOrderInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}