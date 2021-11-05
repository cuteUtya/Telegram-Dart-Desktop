part of '../tdapi.dart';

class LogVerbosityLevel extends TdObject {

  /// Contains a TDLib internal log verbosity level
  LogVerbosityLevel({this.verbosityLevel});

  /// [verbosityLevel] Log verbosity level
  int? verbosityLevel;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  LogVerbosityLevel.fromJson(Map<String, dynamic> json)  {
    int? pre_verbosityLevel;
    try{
      pre_verbosityLevel=json['verbosity_level'];
   }catch(_){}
    verbosityLevel = pre_verbosityLevel;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "verbosity_level": verbosityLevel,
    };
  }

  static const CONSTRUCTOR = 'logVerbosityLevel';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}