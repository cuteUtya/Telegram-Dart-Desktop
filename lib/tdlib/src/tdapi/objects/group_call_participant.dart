part of '../tdapi.dart';

class GroupCallParticipant extends TdObject {

  /// Represents a group call participant
  GroupCallParticipant({this.participantId,
    this.audioSourceId,
    this.screenSharingAudioSourceId,
    this.videoInfo,
    this.screenSharingVideoInfo,
    this.bio,
    this.isCurrentUser,
    this.isSpeaking,
    this.isHandRaised,
    this.canBeMutedForAllUsers,
    this.canBeUnmutedForAllUsers,
    this.canBeMutedForCurrentUser,
    this.canBeUnmutedForCurrentUser,
    this.isMutedForAllUsers,
    this.isMutedForCurrentUser,
    this.canUnmuteSelf,
    this.volumeLevel,
    this.order});

  /// [participantId] Identifier of the group call participant
  MessageSender? participantId;

  /// [audioSourceId] User's audio channel synchronization source identifier
  int? audioSourceId;

  /// [screenSharingAudioSourceId] User's screen sharing audio channel synchronization source identifier
  int? screenSharingAudioSourceId;

  /// [videoInfo] Information about user's video channel; may be null if there is no active video
  GroupCallParticipantVideoInfo? videoInfo;

  /// [screenSharingVideoInfo] Information about user's screen sharing video channel; may be null if there is no active screen sharing video
  GroupCallParticipantVideoInfo? screenSharingVideoInfo;

  /// [bio] The participant user's bio or the participant chat's description
  String? bio;

  /// [isCurrentUser] True, if the participant is the current user
  bool? isCurrentUser;

  /// [isSpeaking] True, if the participant is speaking as set by setGroupCallParticipantIsSpeaking
  bool? isSpeaking;

  /// [isHandRaised] True, if the participant hand is raised
  bool? isHandRaised;

  /// [canBeMutedForAllUsers] True, if the current user can mute the participant for all other group call participants
  bool? canBeMutedForAllUsers;

  /// [canBeUnmutedForAllUsers] True, if the current user can allow the participant to unmute themselves or unmute the participant (if the participant is the current user)
  bool? canBeUnmutedForAllUsers;

  /// [canBeMutedForCurrentUser] True, if the current user can mute the participant only for self
  bool? canBeMutedForCurrentUser;

  /// [canBeUnmutedForCurrentUser] True, if the current user can unmute the participant for self
  bool? canBeUnmutedForCurrentUser;

  /// [isMutedForAllUsers] True, if the participant is muted for all users
  bool? isMutedForAllUsers;

  /// [isMutedForCurrentUser] True, if the participant is muted for the current user
  bool? isMutedForCurrentUser;

  /// [canUnmuteSelf] True, if the participant is muted for all users, but can unmute themselves
  bool? canUnmuteSelf;

  /// [volumeLevel] Participant's volume level; 1-20000 in hundreds of percents
  int? volumeLevel;

  /// [order] User's order in the group call participant list. Orders must be compared lexicographically. The bigger is order, the higher is user in the list. If order is empty, the user must be removed from the participant list
  String? order;

  /// Parse from a json
  GroupCallParticipant.fromJson(Map<String, dynamic> json)  {
    MessageSender? pre_participantId;
    try{
      pre_participantId=MessageSender.fromJson(json['participant_id'] ?? <String, dynamic>{});
   }catch(_){}
    participantId = pre_participantId;
    int? pre_audioSourceId;
    try{
      pre_audioSourceId=json['audio_source_id'];
   }catch(_){}
    audioSourceId = pre_audioSourceId;
    int? pre_screenSharingAudioSourceId;
    try{
      pre_screenSharingAudioSourceId=json['screen_sharing_audio_source_id'];
   }catch(_){}
    screenSharingAudioSourceId = pre_screenSharingAudioSourceId;
    GroupCallParticipantVideoInfo? pre_videoInfo;
    try{
      pre_videoInfo=GroupCallParticipantVideoInfo.fromJson(json['video_info'] ?? <String, dynamic>{});
   }catch(_){}
    videoInfo = pre_videoInfo;
    GroupCallParticipantVideoInfo? pre_screenSharingVideoInfo;
    try{
      pre_screenSharingVideoInfo=GroupCallParticipantVideoInfo.fromJson(json['screen_sharing_video_info'] ?? <String, dynamic>{});
   }catch(_){}
    screenSharingVideoInfo = pre_screenSharingVideoInfo;
    String? pre_bio;
    try{
      pre_bio=json['bio'];
   }catch(_){}
    bio = pre_bio;
    bool? pre_isCurrentUser;
    try{
      pre_isCurrentUser=json['is_current_user'];
   }catch(_){}
    isCurrentUser = pre_isCurrentUser;
    bool? pre_isSpeaking;
    try{
      pre_isSpeaking=json['is_speaking'];
   }catch(_){}
    isSpeaking = pre_isSpeaking;
    bool? pre_isHandRaised;
    try{
      pre_isHandRaised=json['is_hand_raised'];
   }catch(_){}
    isHandRaised = pre_isHandRaised;
    bool? pre_canBeMutedForAllUsers;
    try{
      pre_canBeMutedForAllUsers=json['can_be_muted_for_all_users'];
   }catch(_){}
    canBeMutedForAllUsers = pre_canBeMutedForAllUsers;
    bool? pre_canBeUnmutedForAllUsers;
    try{
      pre_canBeUnmutedForAllUsers=json['can_be_unmuted_for_all_users'];
   }catch(_){}
    canBeUnmutedForAllUsers = pre_canBeUnmutedForAllUsers;
    bool? pre_canBeMutedForCurrentUser;
    try{
      pre_canBeMutedForCurrentUser=json['can_be_muted_for_current_user'];
   }catch(_){}
    canBeMutedForCurrentUser = pre_canBeMutedForCurrentUser;
    bool? pre_canBeUnmutedForCurrentUser;
    try{
      pre_canBeUnmutedForCurrentUser=json['can_be_unmuted_for_current_user'];
   }catch(_){}
    canBeUnmutedForCurrentUser = pre_canBeUnmutedForCurrentUser;
    bool? pre_isMutedForAllUsers;
    try{
      pre_isMutedForAllUsers=json['is_muted_for_all_users'];
   }catch(_){}
    isMutedForAllUsers = pre_isMutedForAllUsers;
    bool? pre_isMutedForCurrentUser;
    try{
      pre_isMutedForCurrentUser=json['is_muted_for_current_user'];
   }catch(_){}
    isMutedForCurrentUser = pre_isMutedForCurrentUser;
    bool? pre_canUnmuteSelf;
    try{
      pre_canUnmuteSelf=json['can_unmute_self'];
   }catch(_){}
    canUnmuteSelf = pre_canUnmuteSelf;
    int? pre_volumeLevel;
    try{
      pre_volumeLevel=json['volume_level'];
   }catch(_){}
    volumeLevel = pre_volumeLevel;
    String? pre_order;
    try{
      pre_order=json['order'];
   }catch(_){}
    order = pre_order;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "participant_id": participantId == null ? null : participantId?.toJson(),
      "audio_source_id": audioSourceId,
      "screen_sharing_audio_source_id": screenSharingAudioSourceId,
      "video_info": videoInfo == null ? null : videoInfo?.toJson(),
      "screen_sharing_video_info": screenSharingVideoInfo == null ? null : screenSharingVideoInfo?.toJson(),
      "bio": bio,
      "is_current_user": isCurrentUser,
      "is_speaking": isSpeaking,
      "is_hand_raised": isHandRaised,
      "can_be_muted_for_all_users": canBeMutedForAllUsers,
      "can_be_unmuted_for_all_users": canBeUnmutedForAllUsers,
      "can_be_muted_for_current_user": canBeMutedForCurrentUser,
      "can_be_unmuted_for_current_user": canBeUnmutedForCurrentUser,
      "is_muted_for_all_users": isMutedForAllUsers,
      "is_muted_for_current_user": isMutedForCurrentUser,
      "can_unmute_self": canUnmuteSelf,
      "volume_level": volumeLevel,
      "order": order,
    };
  }

  static const CONSTRUCTOR = 'groupCallParticipant';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}