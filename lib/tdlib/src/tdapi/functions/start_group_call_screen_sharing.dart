part of '../tdapi.dart';

class StartGroupCallScreenSharing extends TdFunction {

  /// Starts screen sharing in a joined group call. Returns join response payload for tgcalls
  StartGroupCallScreenSharing({this.groupCallId,
    this.audioSourceId,
    this.payload});

  /// [groupCallId] Group call identifier
  int? groupCallId;

  /// [audioSourceId] Screen sharing audio channel synchronization source identifier; received from tgcalls
  int? audioSourceId;

  /// [payload] Group call join payload; received from tgcalls
  String? payload;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  StartGroupCallScreenSharing.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "audio_source_id": audioSourceId,
      "payload": payload,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'startGroupCallScreenSharing';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}