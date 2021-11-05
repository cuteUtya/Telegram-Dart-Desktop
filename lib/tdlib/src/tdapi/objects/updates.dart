part of '../tdapi.dart';

class Updates extends TdObject {

  /// Contains a list of updates
  Updates({this.updates});

  /// [updates] List of updates
  List<Update>? updates;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Updates.fromJson(Map<String, dynamic> json)  {
    List<Update>? pre_updates;
    try{
      pre_updates=List<Update>.from((json['updates'] ?? [])!.map((item) => Update.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    updates = pre_updates;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "updates": updates?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'updates';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}