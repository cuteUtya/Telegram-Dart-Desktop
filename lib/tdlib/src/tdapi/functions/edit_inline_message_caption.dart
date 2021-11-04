part of '../tdapi.dart';

class EditInlineMessageCaption extends TdFunction {

  /// Edits the caption of an inline message sent via a bot; for bots only
  EditInlineMessageCaption({this.inlineMessageId,
    this.replyMarkup,
    this.caption});

  /// [inlineMessageId] Inline message identifier
  String? inlineMessageId;

  /// [replyMarkup] The new message reply markup; pass null if none
  ReplyMarkup? replyMarkup;

  /// [caption] New message content caption; pass null to remove caption; 0-GetOption("message_caption_length_max") characters
  FormattedText? caption;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  EditInlineMessageCaption.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "inline_message_id": inlineMessageId,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
      "caption": caption == null ? null : caption?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'editInlineMessageCaption';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}