part of '../tdapi.dart';

class RecommendedChatFilters extends TdObject {

  /// Contains a list of recommended chat filters
  RecommendedChatFilters({this.chatFilters});

  /// [chatFilters] List of recommended chat filters
  List<RecommendedChatFilter>? chatFilters;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  RecommendedChatFilters.fromJson(Map<String, dynamic> json)  {
    List<RecommendedChatFilter>? pre_chatFilters;
    try{
      pre_chatFilters=List<RecommendedChatFilter>.from((json['chat_filters'] ?? [])!.map((item) => RecommendedChatFilter.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    chatFilters = pre_chatFilters;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_filters": chatFilters?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'recommendedChatFilters';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}