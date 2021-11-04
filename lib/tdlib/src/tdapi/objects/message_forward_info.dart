part of '../tdapi.dart';

class MessageForwardInfo extends TdObject {

  /// Contains information about a forwarded message
  MessageForwardInfo({this.origin,
    this.date,
    this.publicServiceAnnouncementType,
    this.fromChatId,
    this.fromMessageId});

  /// [origin] Origin of a forwarded message
  MessageForwardOrigin? origin;

  /// [date] Point in time (Unix timestamp) when the message was originally sent
  int? date;

  /// [publicServiceAnnouncementType] The type of a public service announcement for the forwarded message
  String? publicServiceAnnouncementType;

  /// [fromChatId] For messages forwarded to the chat with the current user (Saved Messages), to the Replies bot chat, or to the channel's discussion group, the identifier of the chat from which the message was forwarded last time; 0 if unknown
  int? fromChatId;

  /// [fromMessageId] For messages forwarded to the chat with the current user (Saved Messages), to the Replies bot chat, or to the channel's discussion group, the identifier of the original message from which the new message was forwarded last time; 0 if unknown
  int? fromMessageId;

  /// Parse from a json
  MessageForwardInfo.fromJson(Map<String, dynamic> json)  {
    origin = MessageForwardOrigin.fromJson(json['origin'] ?? <String, dynamic>{});
    date = json['date'];
    publicServiceAnnouncementType = json['public_service_announcement_type'];
    fromChatId = json['from_chat_id'];
    fromMessageId = json['from_message_id'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "origin": origin == null ? null : origin?.toJson(),
      "date": date,
      "public_service_announcement_type": publicServiceAnnouncementType,
      "from_chat_id": fromChatId,
      "from_message_id": fromMessageId,
    };
  }

  static const CONSTRUCTOR = 'messageForwardInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}