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
    String? pre_text;
    try{
      pre_text=json['text'];
   }catch(_){}
    text = pre_text;
    InlineKeyboardButtonType? pre_type;
    try{
      pre_type=InlineKeyboardButtonType.fromJson(json['type'] ?? <String, dynamic>{});
   }catch(_){}
    type = pre_type;
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