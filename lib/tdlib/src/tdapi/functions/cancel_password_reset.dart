part of '../tdapi.dart';

class CancelPasswordReset extends TdFunction {

  /// Cancels reset of 2-step verification password. The method can be called if passwordState.pending_reset_date
  CancelPasswordReset();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CancelPasswordReset.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'cancelPasswordReset';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}