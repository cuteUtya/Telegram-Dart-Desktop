part of '../tdapi.dart';

class LogTags extends TdObject {

  /// Contains a list of available TDLib internal log tags
  LogTags({this.tags});

  /// [tags] List of log tags
  List<String>? tags;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  LogTags.fromJson(Map<String, dynamic> json)  {
    tags = json['tags'] == null ? null : List<String>.from((json['tags'] ?? [])!.map((item) => item).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "tags": tags?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'logTags';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}