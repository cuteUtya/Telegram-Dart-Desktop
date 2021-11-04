part of '../tdapi.dart';

class LabeledPricePart extends TdObject {

  /// Portion of the price of a product (e.g., "delivery cost", "tax amount")
  LabeledPricePart({this.label,
    this.amount});

  /// [label] Label for this portion of the product price 
  String? label;

  /// [amount] Currency amount in the smallest units of the currency
  int? amount;

  /// Parse from a json
  LabeledPricePart.fromJson(Map<String, dynamic> json)  {
    label = json['label'];
    amount = json['amount'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "label": label,
      "amount": amount,
    };
  }

  static const CONSTRUCTOR = 'labeledPricePart';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}