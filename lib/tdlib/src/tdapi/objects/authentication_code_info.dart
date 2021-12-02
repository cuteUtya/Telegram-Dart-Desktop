part of '../tdapi.dart';

class AuthenticationCodeInfo extends TdObject {

  /// Information about the authentication code that was sent
  AuthenticationCodeInfo({this.phoneNumber,
    this.type,
    this.nextType,
    this.timeout});

  /// [phoneNumber] A phone number that is being authenticated 
  String? phoneNumber;

  /// [type] The way the code was sent to the user 
  AuthenticationCodeType? type;

  /// [nextType] The way the next code will be sent to the user; may be null 
  AuthenticationCodeType? nextType;

  /// [timeout] Timeout before the code can be re-sent, in seconds
  int? timeout;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  AuthenticationCodeInfo.fromJson(Map<String, dynamic> json)  {
    phoneNumber = json['phone_number'] == null ? null : json['phone_number'];
    type = json['type'] == null ? null : AuthenticationCodeType.fromJson(json['type'] ?? <String, dynamic>{});
    nextType = json['next_type'] == null ? null : AuthenticationCodeType.fromJson(json['next_type'] ?? <String, dynamic>{});
    timeout = json['timeout'] == null ? null : json['timeout'];
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