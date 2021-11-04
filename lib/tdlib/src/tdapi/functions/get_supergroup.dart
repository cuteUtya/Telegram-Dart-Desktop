part of '../tdapi.dart';

class GetSupergroup extends TdFunction {

  /// Returns information about a supergroup or a channel by its identifier. This is an offline request if the current user is not a bot
  GetSupergroup({this.supergroupId});

  /// [supergroupId] Supergroup or channel identifier
  int? supergroupId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetSupergroup.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "supergroup_id": supergroupId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getSupergroup';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}