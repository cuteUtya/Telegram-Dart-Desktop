part of '../tdapi.dart';

class EditInlineMessageText extends TdFunction {

  /// Edits the text of an inline text or game message sent via a bot; for bots only
  EditInlineMessageText({this.inlineMessageId,
    this.replyMarkup,
    this.inputMessageContent});

  /// [inlineMessageId] Inline message identifier
  String? inlineMessageId;

  /// [replyMarkup] The new message reply markup; pass null if none
  ReplyMarkup? replyMarkup;

  /// [inputMessageContent] New text content of the message. Must be of type inputMessageText
  InputMessageContent? inputMessageContent;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  EditInlineMessageText.fromJson(Map<String, dynamic> json) ;

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

  static const CONSTRUCTOR = 'editInlineMessageText';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}