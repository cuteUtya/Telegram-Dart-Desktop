part of '../tdapi.dart';

class TestInt extends TdObject {

  /// A simple object containing a number; for testing only
  TestInt({this.value});

  /// [value] Number
  int? value;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  TestInt.fromJson(Map<String, dynamic> json)  {
    value = json['value'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "value": value,
    };
  }

  static const CONSTRUCTOR = 'testInt';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}