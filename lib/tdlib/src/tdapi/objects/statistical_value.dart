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
    double? pre_value;
    try{
      pre_value=json['value'];
   }catch(_){}
    value = pre_value;
    double? pre_previousValue;
    try{
      pre_previousValue=json['previous_value'];
   }catch(_){}
    previousValue = pre_previousValue;
    double? pre_growthRatePercentage;
    try{
      pre_growthRatePercentage=json['growth_rate_percentage'];
   }catch(_){}
    growthRatePercentage = pre_growthRatePercentage;
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