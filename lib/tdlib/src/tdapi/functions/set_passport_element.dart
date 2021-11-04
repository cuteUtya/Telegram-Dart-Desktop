part of '../tdapi.dart';

class SetPassportElement extends TdFunction {

  /// Adds an element to the user's Telegram Passport. May return an error with a message "PHONE_VERIFICATION_NEEDED" or "EMAIL_VERIFICATION_NEEDED" if the chosen phone number or the chosen email address must be verified first
  SetPassportElement({this.element,
    this.password});

  /// [element] Input Telegram Passport element 
  InputPassportElement? element;

  /// [password] Password of the current user
  String? password;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetPassportElement.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "element": element == null ? null : element?.toJson(),
      "password": password,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setPassportElement';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}