part of '../tdapi.dart';

class TestVectorInt extends TdObject {

  /// A simple object containing a vector of numbers; for testing only
  TestVectorInt({this.value});

  /// [value] Vector of numbers
  List<int>? value;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  TestVectorInt.fromJson(Map<String, dynamic> json)  {
    value = List<int>.from((json['value'] ?? [])!.map((item) => item).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "value": value?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'testVectorInt';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}