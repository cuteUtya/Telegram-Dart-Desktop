part of '../tdapi.dart';

class StatisticalValue extends TdObject {

  /// A value with information about its recent changes
  StatisticalValue({this.value,
    this.previousValue,
    this.growthRatePercentage});

  /// [value] The current value 
  double? value;

  /// [previousValue] The value for the previous day 
  double? previousValue;

  /// [growthRatePercentage] The growth rate of the value, as a percentage
  double? growthRatePercentage;

  /// Parse from a json
  StatisticalValue.fromJson(Map<String, dynamic> json)  {
    value = json['value'];
    previousValue = json['previous_value'];
    growthRatePercentage = json['growth_rate_percentage'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "value": value,
      "previous_value": previousValue,
      "growth_rate_percentage": growthRatePercentage,
    };
  }

  static const CONSTRUCTOR = 'statisticalValue';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}