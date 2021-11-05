part of '../tdapi.dart';

class UserPrivacySettingRules extends TdObject {

  /// A list of privacy rules. Rules are matched in the specified order. The first matched rule defines the privacy setting for a given user. If no rule matches, the action is not allowed
  UserPrivacySettingRules({this.rules});

  /// [rules] A list of rules
  List<UserPrivacySettingRule>? rules;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UserPrivacySettingRules.fromJson(Map<String, dynamic> json)  {
    List<UserPrivacySettingRule>? pre_rules;
    try{
      pre_rules=List<UserPrivacySettingRule>.from((json['rules'] ?? [])!.map((item) => UserPrivacySettingRule.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    rules = pre_rules;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "rules": rules?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'userPrivacySettingRules';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}