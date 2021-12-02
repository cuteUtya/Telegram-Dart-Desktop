part of '../tdapi.dart';

class BankCardActionOpenUrl extends TdObject {

  /// Describes an action associated with a bank card number
  BankCardActionOpenUrl({this.text,
    this.url});

  /// [text] Action text 
  String? text;

  /// [url] The URL to be opened
  String? url;

  /// Parse from a json
  BankCardActionOpenUrl.fromJson(Map<String, dynamic> json)  {
    text = json['text'] == null ? null : json['text'];
    url = json['url'] == null ? null : json['url'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text,
      "url": url,
    };
  }

  static const CONSTRUCTOR = 'bankCardActionOpenUrl';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}