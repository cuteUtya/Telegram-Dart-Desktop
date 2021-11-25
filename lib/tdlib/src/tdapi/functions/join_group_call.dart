part of '../tdapi.dart';

class JoinGroupCall extends TdFunction {

  /// Joins an active group call. Returns join response payload for tgcalls
  JoinGroupCall({this.groupCallId,
    this.participantId,
    this.audioSourceId,
    this.payload,
    this.isMuted,
    this.isMyVideoEnabled,
    this.inviteHash});

  /// [groupCallId] Group call identifier
  int? groupCallId;

  /// [participantId] Identifier of a group call participant, which will be used to join the call; pass null to join as self; video chats only
  MessageSender? participantId;

  /// [audioSourceId] Caller audio channel synchronization source identifier; received from tgcalls
  int? audioSourceId;

  /// [payload] Group call join payload; received from tgcalls
  String? payload;

  /// [isMuted] True, if the user's microphone is muted
  bool? isMuted;

  /// [isMyVideoEnabled] True, if the user's video is enabled
  bool? isMyVideoEnabled;

  /// [inviteHash] If non-empty, invite hash to be used to join the group call without being muted by administrators
  String? inviteHash;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  JoinGroupCall.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "participant_id": participantId == null ? null : participantId?.toJson(),
      "audio_source_id": audioSourceId,
      "payload": payload,
      "is_muted": isMuted,
      "is_my_video_enabled": isMyVideoEnabled,
      "invite_hash": inviteHash,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'joinGroupCall';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}