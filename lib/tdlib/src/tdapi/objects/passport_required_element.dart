part of '../tdapi.dart';

class PassportRequiredElement extends TdObject {

  /// Contains a description of the required Telegram Passport element that was requested by a service
  PassportRequiredElement({this.suitableElements});

  /// [suitableElements] List of Telegram Passport elements any of which is enough to provide
  List<PassportSuitableElement>? suitableElements;

  /// Parse from a json
  PassportRequiredElement.fromJson(Map<String, dynamic> json)  {
    List<PassportSuitableElement>? pre_suitableElements;
    try{
      pre_suitableElements=List<PassportSuitableElement>.from((json['suitable_elements'] ?? [])!.map((item) => PassportSuitableElement.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    suitableElements = pre_suitableElements;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "suitable_elements": suitableElements?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'passportRequiredElement';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}