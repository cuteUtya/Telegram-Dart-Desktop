part of '../tdapi.dart';

class Count extends TdObject {

  /// Contains a counter
  Count({this.count});

  /// [count] Count
  int? count;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Count.fromJson(Map<String, dynamic> json)  {
    int? pre_count;
    try{
      pre_count=json['count'];
   }catch(_){}
    count = pre_count;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "count": count,
    };
  }

  static const CONSTRUCTOR = 'count';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}