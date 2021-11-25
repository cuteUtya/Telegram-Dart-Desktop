part of '../tdapi.dart';

class SetVideoChatDefaultParticipant extends TdFunction {

  /// Changes default participant identifier, which can be used to join video chats in a chat
  SetVideoChatDefaultParticipant({this.chatId,
    this.defaultParticipantId});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [defaultParticipantId] Default group call participant identifier to join the video chats
  MessageSender? defaultParticipantId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetVideoChatDefaultParticipant.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "default_participant_id": defaultParticipantId == null ? null : defaultParticipantId?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setVideoChatDefaultParticipant';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}