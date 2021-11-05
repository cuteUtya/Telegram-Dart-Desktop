part of '../tdapi.dart';

class TestVectorIntObject extends TdObject {

  /// A simple object containing a vector of objects that hold a number; for testing only
  TestVectorIntObject({this.value});

  /// [value] Vector of objects
  List<TestInt>? value;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  TestVectorIntObject.fromJson(Map<String, dynamic> json)  {
    List<TestInt>? pre_value;
    try{
      pre_value=List<TestInt>.from((json['value'] ?? [])!.map((item) => TestInt.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    value = pre_value;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "value": value?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'testVectorIntObject';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}