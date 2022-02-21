part of '../tdapi.dart';

class SetChatAvailableReactions extends TdFunction {

  /// Changes reactions, available in a chat. Available for basic groups, supergroups, and channels. Requires can_change_info administrator right
  SetChatAvailableReactions({this.chatId,
    this.availableReactions});

  /// [chatId] Identifier of the chat 
  int? chatId;

  /// [availableReactions] New list of reactions, available in the chat. All reactions must be active and order of the reactions must be the same as in updateReactions
  List<String>? availableReactions;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetChatAvailableReactions.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "available_reactions": availableReactions?.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setChatAvailableReactions';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}