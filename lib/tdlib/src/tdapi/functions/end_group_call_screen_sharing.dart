part of '../tdapi.dart';

class EndGroupCallScreenSharing extends TdFunction {

  /// Ends screen sharing in a joined group call
  EndGroupCallScreenSharing({this.groupCallId});

  /// [groupCallId] Group call identifier
  int? groupCallId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  EndGroupCallScreenSharing.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'endGroupCallScreenSharing';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}