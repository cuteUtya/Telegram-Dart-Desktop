part of '../tdapi.dart';

class SetUserPrivacySettingRules extends TdFunction {

  /// Changes user privacy settings
  SetUserPrivacySettingRules({this.setting,
    this.rules});

  /// [setting] The privacy setting 
  UserPrivacySetting? setting;

  /// [rules] The new privacy rules
  UserPrivacySettingRules? rules;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetUserPrivacySettingRules.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "setting": setting == null ? null : setting?.toJson(),
      "rules": rules == null ? null : rules?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setUserPrivacySettingRules';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}