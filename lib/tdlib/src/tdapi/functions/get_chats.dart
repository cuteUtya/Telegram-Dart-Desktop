part of '../tdapi.dart';

class GetChats extends TdFunction {

  /// Returns an ordered list of chats from the beginning of a chat list. For informational purposes only. Use loadChats and updates processing instead to maintain chat lists in a consistent state
  GetChats({this.chatList,
    this.limit});

  /// [chatList] The chat list in which to return chats; pass null to get chats from the main chat list
  ChatList? chatList;

  /// [limit] The maximum number of chats to be returned
  int? limit;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetChats.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_list": chatList == null ? null : chatList?.toJson(),
      "limit": limit,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getChats';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}