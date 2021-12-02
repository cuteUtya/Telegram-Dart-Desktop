part of '../tdapi.dart';

class InlineKeyboardButton extends TdObject {

  /// Represents a single button in an inline keyboard
  InlineKeyboardButton({this.text,
    this.type});

  /// [text] Text of the button 
  String? text;

  /// [type] Type of the button
  InlineKeyboardButtonType? type;

  /// Parse from a json
  InlineKeyboardButton.fromJson(Map<String, dynamic> json)  {
    text = json['text'] == null ? null : json['text'];
    type = json['type'] == null ? null : InlineKeyboardButtonType.fromJson(json['type'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text,
      "type": type == null ? null : type?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inlineKeyboardButton';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}