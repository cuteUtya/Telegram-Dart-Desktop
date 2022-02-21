part of '../tdapi.dart';

class ToggleChatIsPinned extends TdFunction {

  /// Changes the pinned state of a chat. There can be up to GetOption("pinned_chat_count_max")/GetOption("pinned_archived_chat_count_max") pinned non-secret chats and the same number of secret chats in the main/archive chat list
  ToggleChatIsPinned({this.chatList,
    this.chatId,
    this.isPinned});

  /// [chatList] Chat list in which to change the pinned state of the chat
  ChatList? chatList;

  /// [chatId] Chat identifier 
  int? chatId;

  /// [isPinned] True, if the chat is pinned
  bool? isPinned;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ToggleChatIsPinned.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_list": chatList == null ? null : chatList?.toJson(),
      "chat_id": chatId,
      "is_pinned": isPinned,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'toggleChatIsPinned';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}