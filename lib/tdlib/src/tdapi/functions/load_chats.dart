part of '../tdapi.dart';

class LoadChats extends TdFunction {

  /// Loads more chats from a chat list. The loaded chats and their positions in the chat list will be sent through updates. Chats are sorted by the pair (chat.position.order, chat.id) in descending order. Returns a 404 error if all chats have been loaded
  LoadChats({this.chatList,
    this.limit});

  /// [chatList] The chat list in which to load chats; pass null to load chats from the main chat list
  ChatList? chatList;

  /// [limit] The maximum number of chats to be loaded. For optimal performance, the number of loaded chats is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached
  int? limit;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  LoadChats.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_list": chatList == null ? null : chatList?.toJson(),
      "limit": limit,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'loadChats';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}