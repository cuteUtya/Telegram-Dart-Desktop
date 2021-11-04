part of '../tdapi.dart';

class SetChatDiscussionGroup extends TdFunction {

  /// Changes the discussion group of a channel chat; requires can_change_info administrator right in the channel if it is specified
  SetChatDiscussionGroup({this.chatId,
    this.discussionChatId});

  /// [chatId] Identifier of the channel chat. Pass 0 to remove a link from the supergroup passed in the second argument to a linked channel chat (requires can_pin_messages rights in the supergroup) 
  int? chatId;

  /// [discussionChatId] Identifier of a new channel's discussion group. Use 0 to remove the discussion group.. Use the method getSuitableDiscussionChats to find all suitable groups. Basic group chats must be first upgraded to supergroup chats. If new chat members don't have access to old messages in the supergroup, then toggleSupergroupIsAllHistoryAvailable must be used first to change that
  int? discussionChatId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetChatDiscussionGroup.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "discussion_chat_id": discussionChatId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setChatDiscussionGroup';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}