part of '../tdapi.dart';

class MessageCopyOptions extends TdObject {

  /// Options to be used when a message content is copied without reference to the original sender. Service messages and messageInvoice can't be copied
  MessageCopyOptions({this.sendCopy,
    this.replaceCaption,
    this.newCaption});

  /// [sendCopy] True, if content of the message needs to be copied without reference to the original sender. Always true if the message is forwarded to a secret chat or is local
  bool? sendCopy;

  /// [replaceCaption] True, if media caption of the message copy needs to be replaced. Ignored if send_copy is false
  bool? replaceCaption;

  /// [newCaption] New message caption; pass null to copy message without caption. Ignored if replace_caption is false
  FormattedText? newCaption;

  /// Parse from a json
  MessageCopyOptions.fromJson(Map<String, dynamic> json)  {
    sendCopy = json['send_copy'];
    replaceCaption = json['replace_caption'];
    newCaption = FormattedText.fromJson(json['new_caption'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "send_copy": sendCopy,
      "replace_caption": replaceCaption,
      "new_caption": newCaption == null ? null : newCaption?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'messageCopyOptions';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}