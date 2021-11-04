part of '../tdapi.dart';

class GetMessageLink extends TdFunction {

  /// Returns an HTTPS link to a message in a chat. Available only for already sent messages in supergroups and channels, or if message.can_get_media_timestamp_links and a media timestamp link is generated. This is an offline request
  GetMessageLink({this.chatId,
    this.messageId,
    this.mediaTimestamp,
    this.forAlbum,
    this.forComment});

  /// [chatId] Identifier of the chat to which the message belongs
  int? chatId;

  /// [messageId] Identifier of the message
  int? messageId;

  /// [mediaTimestamp] If not 0, timestamp from which the video/audio/video note/voice note playing must start, in seconds. The media can be in the message content or in its web page preview
  int? mediaTimestamp;

  /// [forAlbum] Pass true to create a link for the whole media album
  bool? forAlbum;

  /// [forComment] Pass true to create a link to the message as a channel post comment, or from a message thread
  bool? forComment;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetMessageLink.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "media_timestamp": mediaTimestamp,
      "for_album": forAlbum,
      "for_comment": forComment,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getMessageLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}