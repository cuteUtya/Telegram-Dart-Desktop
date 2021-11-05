part of '../tdapi.dart';

class TemporaryPasswordState extends TdObject {

  /// Returns information about the availability of a temporary password, which can be used for payments
  TemporaryPasswordState({this.hasPassword,
    this.validFor});

  /// [hasPassword] True, if a temporary password is available 
  bool? hasPassword;

  /// [validFor] Time left before the temporary password expires, in seconds
  int? validFor;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  TemporaryPasswordState.fromJson(Map<String, dynamic> json)  {
    bool? pre_hasPassword;
    try{
      pre_hasPassword=json['has_password'];
   }catch(_){}
    hasPassword = pre_hasPassword;
    int? pre_validFor;
    try{
      pre_validFor=json['valid_for'];
   }catch(_){}
    validFor = pre_validFor;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "has_password": hasPassword,
      "valid_for": validFor,
    };
  }

  static const CONSTRUCTOR = 'temporaryPasswordState';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}