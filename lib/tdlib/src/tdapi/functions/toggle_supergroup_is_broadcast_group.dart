part of '../tdapi.dart';

class ToggleSupergroupIsBroadcastGroup extends TdFunction {

  /// Upgrades supergroup to a broadcast group; requires owner privileges in the supergroup
  ToggleSupergroupIsBroadcastGroup({this.supergroupId});

  /// [supergroupId] Identifier of the supergroup
  int? supergroupId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ToggleSupergroupIsBroadcastGroup.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "supergroup_id": supergroupId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'toggleSupergroupIsBroadcastGroup';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}