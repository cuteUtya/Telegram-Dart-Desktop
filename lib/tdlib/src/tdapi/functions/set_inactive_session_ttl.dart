part of '../tdapi.dart';

class SetInactiveSessionTtl extends TdFunction {

  /// Changes the period of inactivity after which sessions will automatically be terminated
  SetInactiveSessionTtl({this.inactiveSessionTtlDays});

  /// [inactiveSessionTtlDays] New number of days of inactivity before sessions will be automatically terminated; 1-366 days
  int? inactiveSessionTtlDays;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetInactiveSessionTtl.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "inactive_session_ttl_days": inactiveSessionTtlDays,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setInactiveSessionTtl';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}