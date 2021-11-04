part of '../tdapi.dart';

class GetActiveLiveLocationMessages extends TdFunction {

  /// Returns all active live locations that need to be updated by the application. The list is persistent across application restarts only if the message database is used
  GetActiveLiveLocationMessages();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetActiveLiveLocationMessages.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getActiveLiveLocationMessages';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}