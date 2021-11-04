part of '../tdapi.dart';

class DeleteSavedCredentials extends TdFunction {

  /// Deletes saved credentials for all payment provider bots
  DeleteSavedCredentials();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  DeleteSavedCredentials.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'deleteSavedCredentials';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}