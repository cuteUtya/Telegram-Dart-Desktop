part of '../tdapi.dart';

class TestCallVectorInt extends TdFunction {

  /// Returns the received vector of numbers; for testing only. This is an offline method. Can be called before authorization
  TestCallVectorInt({this.x});

  /// [x] Vector of numbers to return
  List<int>? x;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  TestCallVectorInt.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "x": x?.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'testCallVectorInt';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}