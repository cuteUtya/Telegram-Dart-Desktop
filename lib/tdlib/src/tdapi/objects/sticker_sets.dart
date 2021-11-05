part of '../tdapi.dart';

class StickerSets extends TdObject {

  /// Represents a list of sticker sets
  StickerSets({this.totalCount,
    this.sets});

  /// [totalCount] Approximate total number of sticker sets found 
  int? totalCount;

  /// [sets] List of sticker sets
  List<StickerSetInfo>? sets;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  StickerSets.fromJson(Map<String, dynamic> json)  {
    int? pre_totalCount;
    try{
      pre_totalCount=json['total_count'];
   }catch(_){}
    totalCount = pre_totalCount;
    List<StickerSetInfo>? pre_sets;
    try{
      pre_sets=List<StickerSetInfo>.from((json['sets'] ?? [])!.map((item) => StickerSetInfo.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    sets = pre_sets;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "total_count": totalCount,
      "sets": sets?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'stickerSets';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}