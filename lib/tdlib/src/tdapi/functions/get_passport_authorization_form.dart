part of '../tdapi.dart';

class GetPassportAuthorizationForm extends TdFunction {

  /// Returns a Telegram Passport authorization form for sharing data with a service
  GetPassportAuthorizationForm({this.botUserId,
    this.scope,
    this.publicKey,
    this.nonce});

  /// [botUserId] User identifier of the service's bot 
  int? botUserId;

  /// [scope] Telegram Passport element types requested by the service 
  String? scope;

  /// [publicKey] Service's public key 
  String? publicKey;

  /// [nonce] Unique request identifier provided by the service
  String? nonce;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetPassportAuthorizationForm.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "bot_user_id": botUserId,
      "scope": scope,
      "public_key": publicKey,
      "nonce": nonce,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getPassportAuthorizationForm';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}