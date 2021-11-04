part of '../tdapi.dart';

class ResetPasswordResult extends TdObject {

  /// Represents result of 2-step verification password reset
  ResetPasswordResult();

  

  /// a ResetPasswordResult return type can be :
  /// * ResetPasswordResultOk
  /// * ResetPasswordResultPending
  /// * ResetPasswordResultDeclined
  factory ResetPasswordResult.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case ResetPasswordResultOk.CONSTRUCTOR:
        return ResetPasswordResultOk.fromJson(json);
      case ResetPasswordResultPending.CONSTRUCTOR:
        return ResetPasswordResultPending.fromJson(json);
      case ResetPasswordResultDeclined.CONSTRUCTOR:
        return ResetPasswordResultDeclined.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'resetPasswordResult';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ResetPasswordResultOk extends ResetPasswordResult {

  /// The password was reset
  ResetPasswordResultOk();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ResetPasswordResultOk.fromJson(Map<String, dynamic> json)  {
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'resetPasswordResultOk';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ResetPasswordResultPending extends ResetPasswordResult {

  /// The password reset request is pending
  ResetPasswordResultPending({this.pendingResetDate});

  /// [pendingResetDate] Point in time (Unix timestamp) after which the password can be reset immediately using resetPassword
  int? pendingResetDate;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ResetPasswordResultPending.fromJson(Map<String, dynamic> json)  {
    pendingResetDate = json['pending_reset_date'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "pending_reset_date": pendingResetDate,
    };
  }

  static const CONSTRUCTOR = 'resetPasswordResultPending';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ResetPasswordResultDeclined extends ResetPasswordResult {

  /// The password reset request was declined
  ResetPasswordResultDeclined({this.retryDate});

  /// [retryDate] Point in time (Unix timestamp) when the password reset can be retried
  int? retryDate;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ResetPasswordResultDeclined.fromJson(Map<String, dynamic> json)  {
    retryDate = json['retry_date'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "retry_date": retryDate,
    };
  }

  static const CONSTRUCTOR = 'resetPasswordResultDeclined';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}