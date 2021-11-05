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
    RichText? pre_text;
    try{
      pre_text=RichText.fromJson(json['text'] ?? <String, dynamic>{});
   }catch(_){}
    text = pre_text;
    RichText? pre_credit;
    try{
      pre_credit=RichText.fromJson(json['credit'] ?? <String, dynamic>{});
   }catch(_){}
    credit = pre_credit;
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