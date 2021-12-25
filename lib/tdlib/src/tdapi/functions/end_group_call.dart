part of '../tdapi.dart';

class EndGroupCall extends TdFunction {

  /// Ends a group call. Requires groupCall.can_be_managed
  EndGroupCall({this.groupCallId});

  /// [groupCallId] Group call identifier
  int? groupCallId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  EndGroupCall.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'endGroupCall';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}