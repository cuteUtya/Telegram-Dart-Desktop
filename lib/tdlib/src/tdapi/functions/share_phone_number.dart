part of '../tdapi.dart';

class SharePhoneNumber extends TdFunction {

  /// Shares the phone number of the current user with a mutual contact. Supposed to be called when the user clicks on chatActionBarSharePhoneNumber
  SharePhoneNumber({this.userId});

  /// [userId] Identifier of the user with whom to share the phone number. The user must be a mutual contact
  int? userId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SharePhoneNumber.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'sharePhoneNumber';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}