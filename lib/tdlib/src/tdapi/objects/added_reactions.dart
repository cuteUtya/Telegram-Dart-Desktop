part of '../tdapi.dart';

class AddedReactions extends TdObject {

  /// Represents a list of reactions added to a message
  AddedReactions({this.totalCount,
    this.reactions,
    this.nextOffset});

  /// [totalCount] The total count of found reactions 
  int? totalCount;

  /// [reactions] The list of added reactions 
  List<AddedReaction>? reactions;

  /// [nextOffset] The offset for the next request. If empty, there are no more results
  String? nextOffset;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  AddedReactions.fromJson(Map<String, dynamic> json)  {
    totalCount = json['total_count'] == null ? null : json['total_count'];
    reactions = json['reactions'] == null ? null : List<AddedReaction>.from((json['reactions'] ?? [])!.map((item) => AddedReaction.fromJson(item ?? <String, dynamic>{})).toList());
    nextOffset = json['next_offset'] == null ? null : json['next_offset'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "total_count": totalCount,
      "reactions": reactions?.map((i) => i.toJson()).toList(),
      "next_offset": nextOffset,
    };
  }

  static const CONSTRUCTOR = 'addedReactions';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}