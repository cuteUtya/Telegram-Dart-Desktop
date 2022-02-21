part of '../tdapi.dart';

class AvailableReactions extends TdObject {

  /// Represents a list of available reactions
  AvailableReactions({this.reactions});

  /// [reactions] List of reactions
  List<String>? reactions;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  AvailableReactions.fromJson(Map<String, dynamic> json)  {
    reactions = json['reactions'] == null ? null : List<String>.from((json['reactions'] ?? [])!.map((item) => item).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "reactions": reactions?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'availableReactions';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}