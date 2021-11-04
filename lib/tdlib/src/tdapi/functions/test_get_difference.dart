part of '../tdapi.dart';

class TestGetDifference extends TdFunction {

  /// Forces an updates.getDifference call to the Telegram servers; for testing only
  TestGetDifference();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  TestGetDifference.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'testGetDifference';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}