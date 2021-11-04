part of '../tdapi.dart';

class TestBytes extends TdObject {

  /// A simple object containing a sequence of bytes; for testing only
  TestBytes({this.value});

  /// [value] Bytes
  String? value;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  TestBytes.fromJson(Map<String, dynamic> json)  {
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

  static const CONSTRUCTOR = 'testBytes';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}