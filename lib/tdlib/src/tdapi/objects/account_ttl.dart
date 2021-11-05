part of '../tdapi.dart';

class AccountTtl extends TdObject {

  /// Contains information about the period of inactivity after which the current user's account will automatically be deleted
  AccountTtl({this.days});

  /// [days] Number of days of inactivity before the account will be flagged for deletion; 30-366 days
  int? days;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  AccountTtl.fromJson(Map<String, dynamic> json)  {
    int? pre_days;
    try{
      pre_days=json['days'];
   }catch(_){}
    days = pre_days;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "days": days,
    };
  }

  static const CONSTRUCTOR = 'accountTtl';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}