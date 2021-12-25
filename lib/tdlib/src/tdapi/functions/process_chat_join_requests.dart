part of '../tdapi.dart';

class ProcessChatJoinRequests extends TdFunction {

  /// Handles all pending join requests for a given link in a chat
  ProcessChatJoinRequests({this.chatId,
    this.inviteLink,
    this.approve});

  /// [chatId] Chat identifier
  int? chatId;

  /// [inviteLink] Invite link for which to process join requests. If empty, all join requests will be processed. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
  String? inviteLink;

  /// [approve] True, if the requests are approved. Otherwise the requests are declived
  bool? approve;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ProcessChatJoinRequests.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "invite_link": inviteLink,
      "approve": approve,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'processChatJoinRequests';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}