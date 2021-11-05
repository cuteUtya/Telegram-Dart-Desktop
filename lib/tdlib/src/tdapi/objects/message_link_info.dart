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
    bool? pre_isPublic;
    try{
      pre_isPublic=json['is_public'];
   }catch(_){}
    isPublic = pre_isPublic;
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    Message? pre_message;
    try{
      pre_message=Message.fromJson(json['message'] ?? <String, dynamic>{});
   }catch(_){}
    message = pre_message;
    int? pre_mediaTimestamp;
    try{
      pre_mediaTimestamp=json['media_timestamp'];
   }catch(_){}
    mediaTimestamp = pre_mediaTimestamp;
    bool? pre_forAlbum;
    try{
      pre_forAlbum=json['for_album'];
   }catch(_){}
    forAlbum = pre_forAlbum;
    bool? pre_forComment;
    try{
      pre_forComment=json['for_comment'];
   }catch(_){}
    forComment = pre_forComment;
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