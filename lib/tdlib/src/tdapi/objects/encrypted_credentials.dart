part of '../tdapi.dart';

class EncryptedCredentials extends TdObject {

  /// Contains encrypted Telegram Passport data credentials
  EncryptedCredentials({this.data,
    this.hash,
    this.secret});

  /// [data] The encrypted credentials 
  String? data;

  /// [hash] The decrypted data hash 
  String? hash;

  /// [secret] Secret for data decryption, encrypted with the service's public key
  String? secret;

  /// Parse from a json
  EncryptedCredentials.fromJson(Map<String, dynamic> json)  {
    data = json['data'] == null ? null : json['data'];
    hash = json['hash'] == null ? null : json['hash'];
    secret = json['secret'] == null ? null : json['secret'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "data": data,
      "hash": hash,
      "secret": secret,
    };
  }

  static const CONSTRUCTOR = 'encryptedCredentials';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}