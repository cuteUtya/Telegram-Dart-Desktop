part of '../tdapi.dart';

class TestUseUpdate extends TdFunction {

  /// Does nothing and ensures that the Update object is used; for testing only. This is an offline method. Can be called before authorization
  TestUseUpdate();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  TestUseUpdate.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'testUseUpdate';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}