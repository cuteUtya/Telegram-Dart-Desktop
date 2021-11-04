part of '../tdapi.dart';

class EmailAddressAuthenticationCodeInfo extends TdObject {

  /// Information about the email address authentication code that was sent
  EmailAddressAuthenticationCodeInfo({this.emailAddressPattern,
    this.length});

  /// [emailAddressPattern] Pattern of the email address to which an authentication code was sent 
  String? emailAddressPattern;

  /// [length] Length of the code; 0 if unknown
  int? length;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  EmailAddressAuthenticationCodeInfo.fromJson(Map<String, dynamic> json)  {
    emailAddressPattern = json['email_address_pattern'];
    length = json['length'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "email_address_pattern": emailAddressPattern,
      "length": length,
    };
  }

  static const CONSTRUCTOR = 'emailAddressAuthenticationCodeInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}