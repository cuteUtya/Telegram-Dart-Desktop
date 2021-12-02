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
    list = json['list'] == null ? null : ChatList.fromJson(json['list'] ?? <String, dynamic>{});
    order = json['order'] == null ? null : int.tryParse(json['order'] ?? "");
    isPinned = json['is_pinned'] == null ? null : json['is_pinned'];
    source = json['source'] == null ? null : ChatSource.fromJson(json['source'] ?? <String, dynamic>{});
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