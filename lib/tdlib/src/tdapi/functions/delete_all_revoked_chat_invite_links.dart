part of '../tdapi.dart';

class DeleteAllRevokedChatInviteLinks extends TdFunction {

  /// Deletes all revoked chat invite links created by a given chat administrator. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
  DeleteAllRevokedChatInviteLinks({this.chatId,
    this.creatorUserId});

  /// [chatId] Chat identifier
  int? chatId;

  /// [creatorUserId] User identifier of a chat administrator, which links will be deleted. Must be an identifier of the current user for non-owner
  int? creatorUserId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  DeleteAllRevokedChatInviteLinks.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "creator_user_id": creatorUserId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'deleteAllRevokedChatInviteLinks';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}