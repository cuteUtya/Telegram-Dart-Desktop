part of '../tdapi.dart';

class AddChatToList extends TdFunction {

  /// Adds a chat to a chat list. A chat can't be simultaneously in Main and Archive chat lists, so it is automatically removed from another one if needed
  AddChatToList({this.chatId,
    this.chatList});

  /// [chatId] Chat identifier
  int? chatId;

  /// [chatList] The chat list. Use getChatListsToAddChat to get suitable chat lists
  ChatList? chatList;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  AddChatToList.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "chat_list": chatList == null ? null : chatList?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'addChatToList';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}