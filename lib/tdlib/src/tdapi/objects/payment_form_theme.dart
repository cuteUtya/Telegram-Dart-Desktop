part of '../tdapi.dart';

class PaymentFormTheme extends TdObject {

  /// Theme colors for a payment form
  PaymentFormTheme({this.backgroundColor,
    this.textColor,
    this.hintColor,
    this.linkColor,
    this.buttonColor,
    this.buttonTextColor});

  /// [backgroundColor] A color of the payment form background in the RGB24 format 
  int? backgroundColor;

  /// [textColor] A color of text in the RGB24 format
  int? textColor;

  /// [hintColor] A color of hints in the RGB24 format
  int? hintColor;

  /// [linkColor] A color of links in the RGB24 format 
  int? linkColor;

  /// [buttonColor] A color of the buttons in the RGB24 format
  int? buttonColor;

  /// [buttonTextColor] A color of text on the buttons in the RGB24 format
  int? buttonTextColor;

  /// Parse from a json
  PaymentFormTheme.fromJson(Map<String, dynamic> json)  {
    int? pre_backgroundColor;
    try{
      pre_backgroundColor=json['background_color'];
   }catch(_){}
    backgroundColor = pre_backgroundColor;
    int? pre_textColor;
    try{
      pre_textColor=json['text_color'];
   }catch(_){}
    textColor = pre_textColor;
    int? pre_hintColor;
    try{
      pre_hintColor=json['hint_color'];
   }catch(_){}
    hintColor = pre_hintColor;
    int? pre_linkColor;
    try{
      pre_linkColor=json['link_color'];
   }catch(_){}
    linkColor = pre_linkColor;
    int? pre_buttonColor;
    try{
      pre_buttonColor=json['button_color'];
   }catch(_){}
    buttonColor = pre_buttonColor;
    int? pre_buttonTextColor;
    try{
      pre_buttonTextColor=json['button_text_color'];
   }catch(_){}
    buttonTextColor = pre_buttonTextColor;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "background_color": backgroundColor,
      "text_color": textColor,
      "hint_color": hintColor,
      "link_color": linkColor,
      "button_color": buttonColor,
      "button_text_color": buttonTextColor,
    };
  }

  static const CONSTRUCTOR = 'paymentFormTheme';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}