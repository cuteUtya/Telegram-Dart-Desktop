part of '../tdapi.dart';

class ToggleGroupCallParticipantIsMuted extends TdFunction {

  /// Toggles whether a participant of an active group call is muted, unmuted, or allowed to unmute themselves
  ToggleGroupCallParticipantIsMuted({this.groupCallId,
    this.participantId,
    this.isMuted});

  /// [groupCallId] Group call identifier
  int? groupCallId;

  /// [participantId] Participant identifier 
  MessageSender? participantId;

  /// [isMuted] Pass true if the user must be muted and false otherwise
  bool? isMuted;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ToggleGroupCallParticipantIsMuted.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "participant_id": participantId == null ? null : participantId?.toJson(),
      "is_muted": isMuted,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'toggleGroupCallParticipantIsMuted';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}