part of '../tdapi.dart';

class EditInlineMessageMedia extends TdFunction {

  /// Edits the content of a message with an animation, an audio, a document, a photo or a video in an inline message sent via a bot; for bots only
  EditInlineMessageMedia({this.inlineMessageId,
    this.replyMarkup,
    this.inputMessageContent});

  /// [inlineMessageId] Inline message identifier
  String? inlineMessageId;

  /// [replyMarkup] The new message reply markup; pass null if none; for bots only
  ReplyMarkup? replyMarkup;

  /// [inputMessageContent] New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto or inputMessageVideo
  InputMessageContent? inputMessageContent;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  EditInlineMessageMedia.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "inline_message_id": inlineMessageId,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
      "input_message_content": inputMessageContent == null ? null : inputMessageContent?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'editInlineMessageMedia';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}