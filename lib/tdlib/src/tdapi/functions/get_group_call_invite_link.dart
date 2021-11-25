part of '../tdapi.dart';

class GetGroupCallInviteLink extends TdFunction {

  /// Returns invite link to a video chat in a public chat
  GetGroupCallInviteLink({this.groupCallId,
    this.canSelfUnmute});

  /// [groupCallId] Group call identifier
  int? groupCallId;

  /// [canSelfUnmute] Pass true if the invite link needs to contain an invite hash, passing which to joinGroupCall would allow the invited user to unmute themselves. Requires groupCall.can_be_managed group call flag
  bool? canSelfUnmute;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetGroupCallInviteLink.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "can_self_unmute": canSelfUnmute,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getGroupCallInviteLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}