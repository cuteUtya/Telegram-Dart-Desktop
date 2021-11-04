part of '../tdapi.dart';

class GetChatInviteLinks extends TdFunction {

  /// Returns invite links for a chat created by specified administrator. Requires administrator privileges and can_invite_users right in the chat to get own links and owner privileges to get other links
  GetChatInviteLinks({this.chatId,
    this.creatorUserId,
    this.isRevoked,
    this.offsetDate,
    this.offsetInviteLink,
    this.limit});

  /// [chatId] Chat identifier
  int? chatId;

  /// [creatorUserId] User identifier of a chat administrator. Must be an identifier of the current user for non-owner
  int? creatorUserId;

  /// [isRevoked] Pass true if revoked links needs to be returned instead of active or expired
  bool? isRevoked;

  /// [offsetDate] Creation date of an invite link starting after which to return invite links; use 0 to get results from the beginning
  int? offsetDate;

  /// [offsetInviteLink] Invite link starting after which to return invite links; use empty string to get results from the beginning
  String? offsetInviteLink;

  /// [limit] The maximum number of invite links to return; up to 100
  int? limit;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetChatInviteLinks.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "creator_user_id": creatorUserId,
      "is_revoked": isRevoked,
      "offset_date": offsetDate,
      "offset_invite_link": offsetInviteLink,
      "limit": limit,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getChatInviteLinks';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}