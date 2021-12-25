part of '../tdapi.dart';

class ChatJoinRequests extends TdObject {

  /// Contains a list of requests to join a chat
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
    totalCount = json['total_count'] == null ? null : json['total_count'];
    requests = json['requests'] == null ? null : List<ChatJoinRequest>.from((json['requests'] ?? [])!.map((item) => ChatJoinRequest.fromJson(item ?? <String, dynamic>{})).toList());
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