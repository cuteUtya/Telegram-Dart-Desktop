part of '../tdapi.dart';

class CustomRequestResult extends TdObject {

  /// Contains the result of a custom request
  CustomRequestResult({this.result});

  /// [result] A JSON-serialized result
  String? result;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CustomRequestResult.fromJson(Map<String, dynamic> json)  {
    String? pre_result;
    try{
      pre_result=json['result'];
   }catch(_){}
    result = pre_result;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "result": result,
    };
  }

  static const CONSTRUCTOR = 'customRequestResult';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}