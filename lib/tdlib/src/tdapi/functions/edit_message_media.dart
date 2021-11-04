part of '../tdapi.dart';

class EditMessageMedia extends TdFunction {

  /// Edits the content of a message with an animation, an audio, a document, a photo or a video, including message caption. If only the caption needs to be edited, use editMessageCaption instead.. The media can't be edited if the message was set to self-destruct or to a self-destructing media. The type of message content in an album can't be changed with exception of replacing a photo with a video or vice versa. Returns the edited message after the edit is completed on the server side
  EditMessageMedia({this.chatId,
    this.messageId,
    this.replyMarkup,
    this.inputMessageContent});

  /// [chatId] The chat the message belongs to
  int? chatId;

  /// [messageId] Identifier of the message
  int? messageId;

  /// [replyMarkup] The new message reply markup; pass null if none; for bots only
  ReplyMarkup? replyMarkup;

  /// [inputMessageContent] New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto or inputMessageVideo
  InputMessageContent? inputMessageContent;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  EditMessageMedia.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
      "input_message_content": inputMessageContent == null ? null : inputMessageContent?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'editMessageMedia';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}