part of '../tdapi.dart';

class ValidatedOrderInfo extends TdObject {

  /// Contains a temporary identifier of validated order information, which is stored for one hour. Also contains the available shipping options
  ValidatedOrderInfo({this.orderInfoId,
    this.shippingOptions});

  /// [orderInfoId] Temporary identifier of the order information 
  String? orderInfoId;

  /// [shippingOptions] Available shipping options
  List<ShippingOption>? shippingOptions;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ValidatedOrderInfo.fromJson(Map<String, dynamic> json)  {
    orderInfoId = json['order_info_id'] == null ? null : json['order_info_id'];
    shippingOptions = json['shipping_options'] == null ? null : List<ShippingOption>.from((json['shipping_options'] ?? [])!.map((item) => ShippingOption.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "order_info_id": orderInfoId,
      "shipping_options": shippingOptions?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'validatedOrderInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}