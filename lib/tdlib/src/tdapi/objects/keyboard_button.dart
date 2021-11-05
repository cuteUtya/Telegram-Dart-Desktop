part of '../tdapi.dart';

class KeyboardButton extends TdObject {

  /// Represents a single button in a bot keyboard
  KeyboardButton({this.text,
    this.type});

  /// [text] Text of the button 
  String? text;

  /// [type] Type of the button
  KeyboardButtonType? type;

  /// Parse from a json
  KeyboardButton.fromJson(Map<String, dynamic> json)  {
    String? pre_text;
    try{
      pre_text=json['text'];
   }catch(_){}
    text = pre_text;
    KeyboardButtonType? pre_type;
    try{
      pre_type=KeyboardButtonType.fromJson(json['type'] ?? <String, dynamic>{});
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

  static const CONSTRUCTOR = 'keyboardButton';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}