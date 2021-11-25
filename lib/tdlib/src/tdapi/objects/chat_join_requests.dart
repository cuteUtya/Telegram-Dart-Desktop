part of '../tdapi.dart';

class ChatJoinRequests extends TdObject {

  /// Contains a list of chat join requests
  ChatJoinRequests({this.totalCount,
    this.requests});

  /// [totalCount] Approximate total count of requests found 
  int? totalCount;

  /// [requests] List of the requests
  List<ChatJoinRequest>? requests;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ChatJoinRequests.fromJson(Map<String, dynamic> json)  {
    int? pre_totalCount;
    try{
      pre_totalCount=json['total_count'];
   }catch(_){}
    totalCount = pre_totalCount;
    List<ChatJoinRequest>? pre_requests;
    try{
      pre_requests=List<ChatJoinRequest>.from((json['requests'] ?? [])!.map((item) => ChatJoinRequest.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    requests = pre_requests;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "total_count": totalCount,
      "requests": requests?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'chatJoinRequests';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}