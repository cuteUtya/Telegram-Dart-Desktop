part of '../tdapi.dart';

class StartScheduledGroupCall extends TdFunction {

  /// Starts a scheduled group call
  StartScheduledGroupCall({this.groupCallId});

  /// [groupCallId] Group call identifier
  int? groupCallId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  StartScheduledGroupCall.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'startScheduledGroupCall';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}