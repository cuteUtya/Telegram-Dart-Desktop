part of '../tdapi.dart';

class MessageLinkInfo extends TdObject {

  /// Contains information about a link to a message in a chat
  MessageLinkInfo({this.isPublic,
    this.chatId,
    this.message,
    this.mediaTimestamp,
    this.forAlbum,
    this.forComment});

  /// [isPublic] True, if the link is a public link for a message in a chat
  bool? isPublic;

  /// [chatId] If found, identifier of the chat to which the message belongs, 0 otherwise
  int? chatId;

  /// [message] If found, the linked message; may be null
  Message? message;

  /// [mediaTimestamp] Timestamp from which the video/audio/video note/voice note playing must start, in seconds; 0 if not specified. The media can be in the message content or in its web page preview
  int? mediaTimestamp;

  /// [forAlbum] True, if the whole media album to which the message belongs is linked
  bool? forAlbum;

  /// [forComment] True, if the message is linked as a channel post comment or from a message thread
  bool? forComment;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  MessageLinkInfo.fromJson(Map<String, dynamic> json)  {
    isPublic = json['is_public'] == null ? null : json['is_public'];
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    message = json['message'] == null ? null : Message.fromJson(json['message'] ?? <String, dynamic>{});
    mediaTimestamp = json['media_timestamp'] == null ? null : json['media_timestamp'];
    forAlbum = json['for_album'] == null ? null : json['for_album'];
    forComment = json['for_comment'] == null ? null : json['for_comment'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "is_public": isPublic,
      "chat_id": chatId,
      "message": message == null ? null : message?.toJson(),
      "media_timestamp": mediaTimestamp,
      "for_album": forAlbum,
      "for_comment": forComment,
    };
  }

  static const CONSTRUCTOR = 'messageLinkInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}