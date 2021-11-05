part of '../tdapi.dart';

class GroupCallVideoSourceGroup extends TdObject {

  /// Describes a group of video synchronization source identifiers
  GroupCallVideoSourceGroup({this.semantics,
    this.sourceIds});

  /// [semantics] The semantics of sources, one of "SIM" or "FgroupCallVideoSourceGroup" 
  String? semantics;

  /// [sourceIds] The list of synchronization source identifiers
  List<int>? sourceIds;

  /// Parse from a json
  GroupCallVideoSourceGroup.fromJson(Map<String, dynamic> json)  {
    String? pre_semantics;
    try{
      pre_semantics=json['semantics'];
   }catch(_){}
    semantics = pre_semantics;
    List<int>? pre_sourceIds;
    try{
      pre_sourceIds=List<int>.from((json['source_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    sourceIds = pre_sourceIds;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "semantics": semantics,
      "source_ids": sourceIds?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'groupCallVideoSourceGroup';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}