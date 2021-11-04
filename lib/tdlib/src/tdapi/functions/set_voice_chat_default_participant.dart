part of '../tdapi.dart';

class SetVoiceChatDefaultParticipant extends TdFunction {

  /// Changes default participant identifier, which can be used to join voice chats in a chat
  SetVoiceChatDefaultParticipant({this.chatId,
    this.defaultParticipantId});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [defaultParticipantId] Default group call participant identifier to join the voice chats
  MessageSender? defaultParticipantId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetVoiceChatDefaultParticipant.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "default_participant_id": defaultParticipantId == null ? null : defaultParticipantId?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setVoiceChatDefaultParticipant';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}