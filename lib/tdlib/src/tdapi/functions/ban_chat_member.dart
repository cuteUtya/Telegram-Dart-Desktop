part of '../tdapi.dart';

class BanChatMember extends TdFunction {

  /// Bans a member in a chat. Members can't be banned in private or secret chats. In supergroups and channels, the user will not be able to return to the group on their own using invite links, etc., unless unbanned first
  BanChatMember({this.chatId,
    this.memberId,
    this.bannedUntilDate,
    this.revokeMessages});

  /// [chatId] Chat identifier
  int? chatId;

  /// [memberId] Member identifier
  MessageSender? memberId;

  /// [bannedUntilDate] Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days or for less than 30 seconds from the current time, the user is considered to be banned forever. Ignored in basic groups
  int? bannedUntilDate;

  /// [revokeMessages] Pass true to delete all messages in the chat for the user that is being removed. Always true for supergroups and channels
  bool? revokeMessages;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  BanChatMember.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "member_id": memberId == null ? null : memberId?.toJson(),
      "banned_until_date": bannedUntilDate,
      "revoke_messages": revokeMessages,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'banChatMember';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}