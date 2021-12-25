part of '../tdapi.dart';

class GetChatInviteLinkMembers extends TdFunction {

  /// Returns chat members joined a chat via an invite link. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
  GetChatInviteLinkMembers({this.chatId,
    this.inviteLink,
    this.offsetMember,
    this.limit});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [inviteLink] Invite link for which to return chat members
  String? inviteLink;

  /// [offsetMember] A chat member from which to return next chat members; pass null to get results from the beginning
  ChatInviteLinkMember? offsetMember;

  /// [limit] The maximum number of chat members to return; up to 100
  int? limit;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetChatInviteLinkMembers.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "invite_link": inviteLink,
      "offset_member": offsetMember == null ? null : offsetMember?.toJson(),
      "limit": limit,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getChatInviteLinkMembers';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}