part of '../tdapi.dart';

class ChatPosition extends TdObject {

  /// Describes a position of a chat in a chat list
  ChatPosition({this.list,
    this.order,
    this.isPinned,
    this.source});

  /// [list] The chat list
  ChatList? list;

  /// [order] A parameter used to determine order of the chat in the chat list. Chats must be sorted by the pair (order, chat.id) in descending order
  int? order;

  /// [isPinned] True, if the chat is pinned in the chat list
  bool? isPinned;

  /// [source] Source of the chat in the chat list; may be null
  ChatSource? source;

  /// Parse from a json
  ChatPosition.fromJson(Map<String, dynamic> json)  {
    ChatList? pre_list;
    try{
      pre_list=ChatList.fromJson(json['list'] ?? <String, dynamic>{});
   }catch(_){}
    list = pre_list;
    int? pre_order;
    try{
      pre_order=int.tryParse(json['order'] ?? "");
   }catch(_){}
    order = pre_order;
    bool? pre_isPinned;
    try{
      pre_isPinned=json['is_pinned'];
   }catch(_){}
    isPinned = pre_isPinned;
    ChatSource? pre_source;
    try{
      pre_source=ChatSource.fromJson(json['source'] ?? <String, dynamic>{});
   }catch(_){}
    source = pre_source;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "list": list == null ? null : list?.toJson(),
      "order": order,
      "is_pinned": isPinned,
      "source": source == null ? null : source?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'chatPosition';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}