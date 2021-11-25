part of '../tdapi.dart';

class GetChatJoinRequests extends TdFunction {

  /// Returns pending join requests in a chat
  GetChatJoinRequests({this.chatId,
    this.inviteLink,
    this.query,
    this.offsetRequest,
    this.limit});

  /// [chatId] Chat identifier
  int? chatId;

  /// [inviteLink] Invite link for which to return join requests. If empty, all join requests will be returned. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
  String? inviteLink;

  /// [query] A query to search for in the first names, last names and usernames of the users to return
  String? query;

  /// [offsetRequest] A chat join request from which to return next requests; pass null to get results from the beginning
  ChatJoinRequest? offsetRequest;

  /// [limit] The maximum number of chat join requests to return
  int? limit;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetChatJoinRequests.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "invite_link": inviteLink,
      "query": query,
      "offset_request": offsetRequest == null ? null : offsetRequest?.toJson(),
      "limit": limit,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getChatJoinRequests';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}