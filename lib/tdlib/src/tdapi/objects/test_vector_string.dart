part of '../tdapi.dart';

class TestVectorString extends TdObject {

  /// A simple object containing a vector of strings; for testing only
  TestVectorString({this.value});

  /// [value] Vector of strings
  List<String>? value;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  TestVectorString.fromJson(Map<String, dynamic> json)  {
    List<String>? pre_value;
    try{
      pre_value=List<String>.from((json['value'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    value = pre_value;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "value": value?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'testVectorString';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}