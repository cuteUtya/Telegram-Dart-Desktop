part of '../tdapi.dart';

class BankCardInfo extends TdObject {

  /// Information about a bank card
  BankCardInfo({this.title,
    this.actions});

  /// [title] Title of the bank card description 
  String? title;

  /// [actions] Actions that can be done with the bank card number
  List<BankCardActionOpenUrl>? actions;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  BankCardInfo.fromJson(Map<String, dynamic> json)  {
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
    List<BankCardActionOpenUrl>? pre_actions;
    try{
      pre_actions=List<BankCardActionOpenUrl>.from((json['actions'] ?? [])!.map((item) => BankCardActionOpenUrl.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    actions = pre_actions;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "title": title,
      "actions": actions?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'bankCardInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}