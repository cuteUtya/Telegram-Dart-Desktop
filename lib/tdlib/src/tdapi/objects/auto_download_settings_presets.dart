part of '../tdapi.dart';

class AutoDownloadSettingsPresets extends TdObject {

  /// Contains auto-download settings presets for the current user
  AutoDownloadSettingsPresets({this.low,
    this.medium,
    this.high});

  /// [low] Preset with lowest settings; supposed to be used by default when roaming
  AutoDownloadSettings? low;

  /// [medium] Preset with medium settings; supposed to be used by default when using mobile data
  AutoDownloadSettings? medium;

  /// [high] Preset with highest settings; supposed to be used by default when connected on Wi-Fi
  AutoDownloadSettings? high;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  AutoDownloadSettingsPresets.fromJson(Map<String, dynamic> json)  {
    AutoDownloadSettings? pre_low;
    try{
      pre_low=AutoDownloadSettings.fromJson(json['low'] ?? <String, dynamic>{});
   }catch(_){}
    low = pre_low;
    AutoDownloadSettings? pre_medium;
    try{
      pre_medium=AutoDownloadSettings.fromJson(json['medium'] ?? <String, dynamic>{});
   }catch(_){}
    medium = pre_medium;
    AutoDownloadSettings? pre_high;
    try{
      pre_high=AutoDownloadSettings.fromJson(json['high'] ?? <String, dynamic>{});
   }catch(_){}
    high = pre_high;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "low": low == null ? null : low?.toJson(),
      "medium": medium == null ? null : medium?.toJson(),
      "high": high == null ? null : high?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'autoDownloadSettingsPresets';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}