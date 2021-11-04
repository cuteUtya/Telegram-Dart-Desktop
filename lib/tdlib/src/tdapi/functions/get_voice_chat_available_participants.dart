part of '../tdapi.dart';

class GetVoiceChatAvailableParticipants extends TdFunction {

  /// Returns list of participant identifiers, which can be used to join voice chats in a chat
  GetVoiceChatAvailableParticipants({this.chatId});

  /// [chatId] Chat identifier
  int? chatId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetVoiceChatAvailableParticipants.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getVoiceChatAvailableParticipants';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}