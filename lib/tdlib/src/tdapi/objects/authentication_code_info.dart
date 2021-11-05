part of '../tdapi.dart';

class AuthenticationCodeInfo extends TdObject {

  /// Information about the authentication code that was sent
  AuthenticationCodeInfo({this.phoneNumber,
    this.type,
    this.nextType,
    this.timeout});

  /// [phoneNumber] A phone number that is being authenticated 
  String? phoneNumber;

  /// [type] Describes the way the code was sent to the user 
  AuthenticationCodeType? type;

  /// [nextType] Describes the way the next code will be sent to the user; may be null 
  AuthenticationCodeType? nextType;

  /// [timeout] Timeout before the code can be re-sent, in seconds
  int? timeout;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  AuthenticationCodeInfo.fromJson(Map<String, dynamic> json)  {
    String? pre_phoneNumber;
    try{
      pre_phoneNumber=json['phone_number'];
   }catch(_){}
    phoneNumber = pre_phoneNumber;
    AuthenticationCodeType? pre_type;
    try{
      pre_type=AuthenticationCodeType.fromJson(json['type'] ?? <String, dynamic>{});
   }catch(_){}
    type = pre_type;
    AuthenticationCodeType? pre_nextType;
    try{
      pre_nextType=AuthenticationCodeType.fromJson(json['next_type'] ?? <String, dynamic>{});
   }catch(_){}
    nextType = pre_nextType;
    int? pre_timeout;
    try{
      pre_timeout=json['timeout'];
   }catch(_){}
    timeout = pre_timeout;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "phone_number": phoneNumber,
      "type": type == null ? null : type?.toJson(),
      "next_type": nextType == null ? null : nextType?.toJson(),
      "timeout": timeout,
    };
  }

  static const CONSTRUCTOR = 'authenticationCodeInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}