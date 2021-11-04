part of '../tdapi.dart';

class SendCallDebugInformation extends TdFunction {

  /// Sends debug information for a call
  SendCallDebugInformation({this.callId,
    this.debugInformation});

  /// [callId] Call identifier 
  int? callId;

  /// [debugInformation] Debug information in application-specific format
  String? debugInformation;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SendCallDebugInformation.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "call_id": callId,
      "debug_information": debugInformation,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'sendCallDebugInformation';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}