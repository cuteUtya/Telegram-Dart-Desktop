part of '../tdapi.dart';

class EndGroupCallRecording extends TdFunction {

  /// Ends recording of an active group call. Requires groupCall.can_be_managed group call flag
  EndGroupCallRecording({this.groupCallId});

  /// [groupCallId] Group call identifier
  int? groupCallId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  EndGroupCallRecording.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'endGroupCallRecording';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}