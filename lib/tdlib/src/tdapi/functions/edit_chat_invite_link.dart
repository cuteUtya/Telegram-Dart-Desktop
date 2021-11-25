part of '../tdapi.dart';

class EditChatInviteLink extends TdFunction {

  /// Edits a non-primary invite link for a chat. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
  EditChatInviteLink({this.chatId,
    this.inviteLink,
    this.name,
    this.expireDate,
    this.memberLimit,
    this.createsJoinRequest});

  /// [chatId] Chat identifier
  int? chatId;

  /// [inviteLink] Invite link to be edited
  String? inviteLink;

  /// [name] Invite link name; 0-32 characters
  String? name;

  /// [expireDate] Point in time (Unix timestamp) when the link will expire; pass 0 if never
  int? expireDate;

  /// [memberLimit] The maximum number of chat members that can join the chat by the link simultaneously; 0-99999; pass 0 if not limited
  int? memberLimit;

  /// [createsJoinRequest] True, if the link only creates join request. If true, member_limit must not be specified
  bool? createsJoinRequest;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  EditChatInviteLink.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "invite_link": inviteLink,
      "name": name,
      "expire_date": expireDate,
      "member_limit": memberLimit,
      "creates_join_request": createsJoinRequest,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'editChatInviteLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}