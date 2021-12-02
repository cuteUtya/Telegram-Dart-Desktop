part of '../tdapi.dart';

class PageBlockCaption extends TdObject {

  /// Contains a caption of an instant view web page block, consisting of a text and a trailing credit
  PageBlockCaption({this.text,
    this.credit});

  /// [text] Content of the caption 
  RichText? text;

  /// [credit] Block credit (like HTML tag <cite>)
  RichText? credit;

  /// Parse from a json
  PageBlockCaption.fromJson(Map<String, dynamic> json)  {
    text = json['text'] == null ? null : RichText.fromJson(json['text'] ?? <String, dynamic>{});
    credit = json['credit'] == null ? null : RichText.fromJson(json['credit'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
      "credit": credit == null ? null : credit?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockCaption';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}