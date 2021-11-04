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
    backgroundColor = json['background_color'];
    textColor = json['text_color'];
    hintColor = json['hint_color'];
    linkColor = json['link_color'];
    buttonColor = json['button_color'];
    buttonTextColor = json['button_text_color'];
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