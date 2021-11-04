part of '../tdapi.dart';

class AddChatMember extends TdFunction {

  /// Adds a new member to a chat. Members can't be added to private or secret chats
  AddChatMember({this.chatId,
    this.userId,
    this.forwardLimit});

  /// [chatId] Chat identifier
  int? chatId;

  /// [userId] Identifier of the user 
  int? userId;

  /// [forwardLimit] The number of earlier messages from the chat to be forwarded to the new member; up to 100. Ignored for supergroups and channels, or if the added user is a bot
  int? forwardLimit;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  AddChatMember.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "user_id": userId,
      "forward_limit": forwardLimit,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'addChatMember';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}