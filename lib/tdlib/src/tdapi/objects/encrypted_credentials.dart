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
    String? pre_data;
    try{
      pre_data=json['data'];
   }catch(_){}
    data = pre_data;
    String? pre_hash;
    try{
      pre_hash=json['hash'];
   }catch(_){}
    hash = pre_hash;
    String? pre_secret;
    try{
      pre_secret=json['secret'];
   }catch(_){}
    secret = pre_secret;
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