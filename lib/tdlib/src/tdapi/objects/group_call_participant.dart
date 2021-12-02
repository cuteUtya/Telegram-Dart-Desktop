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
    participantId = json['participant_id'] == null ? null : MessageSender.fromJson(json['participant_id'] ?? <String, dynamic>{});
    audioSourceId = json['audio_source_id'] == null ? null : json['audio_source_id'];
    screenSharingAudioSourceId = json['screen_sharing_audio_source_id'] == null ? null : json['screen_sharing_audio_source_id'];
    videoInfo = json['video_info'] == null ? null : GroupCallParticipantVideoInfo.fromJson(json['video_info'] ?? <String, dynamic>{});
    screenSharingVideoInfo = json['screen_sharing_video_info'] == null ? null : GroupCallParticipantVideoInfo.fromJson(json['screen_sharing_video_info'] ?? <String, dynamic>{});
    bio = json['bio'] == null ? null : json['bio'];
    isCurrentUser = json['is_current_user'] == null ? null : json['is_current_user'];
    isSpeaking = json['is_speaking'] == null ? null : json['is_speaking'];
    isHandRaised = json['is_hand_raised'] == null ? null : json['is_hand_raised'];
    canBeMutedForAllUsers = json['can_be_muted_for_all_users'] == null ? null : json['can_be_muted_for_all_users'];
    canBeUnmutedForAllUsers = json['can_be_unmuted_for_all_users'] == null ? null : json['can_be_unmuted_for_all_users'];
    canBeMutedForCurrentUser = json['can_be_muted_for_current_user'] == null ? null : json['can_be_muted_for_current_user'];
    canBeUnmutedForCurrentUser = json['can_be_unmuted_for_current_user'] == null ? null : json['can_be_unmuted_for_current_user'];
    isMutedForAllUsers = json['is_muted_for_all_users'] == null ? null : json['is_muted_for_all_users'];
    isMutedForCurrentUser = json['is_muted_for_current_user'] == null ? null : json['is_muted_for_current_user'];
    canUnmuteSelf = json['can_unmute_self'] == null ? null : json['can_unmute_self'];
    volumeLevel = json['volume_level'] == null ? null : json['volume_level'];
    order = json['order'] == null ? null : json['order'];
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