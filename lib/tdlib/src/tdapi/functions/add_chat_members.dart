part of '../tdapi.dart';

class AddChatMembers extends TdFunction {

  /// Adds multiple new members to a chat. Currently this method is only available for supergroups and channels. This method can't be used to join a chat. Members can't be added to a channel if it has more than 200 members
  AddChatMembers({this.chatId,
    this.userIds});

  /// [chatId] Chat identifier
  int? chatId;

  /// [userIds] Identifiers of the users to be added to the chat. The maximum number of added users is 20 for supergroups and 100 for channels
  List<int>? userIds;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  AddChatMembers.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "user_ids": userIds?.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'addChatMembers';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}