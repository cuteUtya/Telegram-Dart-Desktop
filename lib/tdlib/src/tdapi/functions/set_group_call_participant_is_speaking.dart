part of '../tdapi.dart';

class SetGroupCallParticipantIsSpeaking extends TdFunction {

  /// Informs TDLib that speaking state of a participant of an active group has changed
  SetGroupCallParticipantIsSpeaking({this.groupCallId,
    this.audioSource,
    this.isSpeaking});

  /// [groupCallId] Group call identifier
  int? groupCallId;

  /// [audioSource] Group call participant's synchronization audio source identifier, or 0 for the current user
  int? audioSource;

  /// [isSpeaking] True, if the user is speaking
  bool? isSpeaking;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetGroupCallParticipantIsSpeaking.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "audio_source": audioSource,
      "is_speaking": isSpeaking,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setGroupCallParticipantIsSpeaking';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}