part of '../tdapi.dart';

class AuthenticationCodeType extends TdObject {

  /// Provides information about the method by which an authentication code is delivered to the user
  AuthenticationCodeType();

  

  /// a AuthenticationCodeType return type can be :
  /// * AuthenticationCodeTypeTelegramMessage
  /// * AuthenticationCodeTypeSms
  /// * AuthenticationCodeTypeCall
  /// * AuthenticationCodeTypeFlashCall
  /// * AuthenticationCodeTypeMissedCall
  factory AuthenticationCodeType.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case AuthenticationCodeTypeTelegramMessage.CONSTRUCTOR:
        return AuthenticationCodeTypeTelegramMessage.fromJson(json);
      case AuthenticationCodeTypeSms.CONSTRUCTOR:
        return AuthenticationCodeTypeSms.fromJson(json);
      case AuthenticationCodeTypeCall.CONSTRUCTOR:
        return AuthenticationCodeTypeCall.fromJson(json);
      case AuthenticationCodeTypeFlashCall.CONSTRUCTOR:
        return AuthenticationCodeTypeFlashCall.fromJson(json);
      case AuthenticationCodeTypeMissedCall.CONSTRUCTOR:
        return AuthenticationCodeTypeMissedCall.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'authenticationCodeType';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class AuthenticationCodeTypeTelegramMessage extends AuthenticationCodeType {

  /// An authentication code is delivered via a private Telegram message, which can be viewed from another active session
  AuthenticationCodeTypeTelegramMessage({this.length});

  /// [length] Length of the code
  int? length;

  /// Parse from a json
  AuthenticationCodeTypeTelegramMessage.fromJson(Map<String, dynamic> json)  {
    length = json['length'] == null ? null : json['length'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "length": length,
    };
  }

  static const CONSTRUCTOR = 'authenticationCodeTypeTelegramMessage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class AuthenticationCodeTypeSms extends AuthenticationCodeType {

  /// An authentication code is delivered via an SMS message to the specified phone number
  AuthenticationCodeTypeSms({this.length});

  /// [length] Length of the code
  int? length;

  /// Parse from a json
  AuthenticationCodeTypeSms.fromJson(Map<String, dynamic> json)  {
    length = json['length'] == null ? null : json['length'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "length": length,
    };
  }

  static const CONSTRUCTOR = 'authenticationCodeTypeSms';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class AuthenticationCodeTypeCall extends AuthenticationCodeType {

  /// An authentication code is delivered via a phone call to the specified phone number
  AuthenticationCodeTypeCall({this.length});

  /// [length] Length of the code
  int? length;

  /// Parse from a json
  AuthenticationCodeTypeCall.fromJson(Map<String, dynamic> json)  {
    length = json['length'] == null ? null : json['length'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "length": length,
    };
  }

  static const CONSTRUCTOR = 'authenticationCodeTypeCall';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class AuthenticationCodeTypeFlashCall extends AuthenticationCodeType {

  /// An authentication code is delivered by an immediately canceled call to the specified phone number. The phone number that calls is the code that must be entered automatically
  AuthenticationCodeTypeFlashCall({this.pattern});

  /// [pattern] Pattern of the phone number from which the call will be made
  String? pattern;

  /// Parse from a json
  AuthenticationCodeTypeFlashCall.fromJson(Map<String, dynamic> json)  {
    pattern = json['pattern'] == null ? null : json['pattern'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "pattern": pattern,
    };
  }

  static const CONSTRUCTOR = 'authenticationCodeTypeFlashCall';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class AuthenticationCodeTypeMissedCall extends AuthenticationCodeType {

  /// An authentication code is delivered by an immediately canceled call to the specified phone number. The last digits of the phone number that calls are the code that must be entered manually by the user
  AuthenticationCodeTypeMissedCall({this.phoneNumberPrefix,
    this.length});

  /// [phoneNumberPrefix] Prefix of the phone number from which the call will be made 
  String? phoneNumberPrefix;

  /// [length] Number of digits in the code, excluding the prefix
  int? length;

  /// Parse from a json
  AuthenticationCodeTypeMissedCall.fromJson(Map<String, dynamic> json)  {
    phoneNumberPrefix = json['phone_number_prefix'] == null ? null : json['phone_number_prefix'];
    length = json['length'] == null ? null : json['length'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "phone_number_prefix": phoneNumberPrefix,
      "length": length,
    };
  }

  static const CONSTRUCTOR = 'authenticationCodeTypeMissedCall';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}