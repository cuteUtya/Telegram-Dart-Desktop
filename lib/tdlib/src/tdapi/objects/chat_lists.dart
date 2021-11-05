part of '../tdapi.dart';

class ChatLists extends TdObject {

  /// Contains a list of chat lists
  ChatLists({this.chatLists});

  /// [chatLists] List of chat lists
  List<ChatList>? chatLists;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ChatLists.fromJson(Map<String, dynamic> json)  {
    List<ChatList>? pre_chatLists;
    try{
      pre_chatLists=List<ChatList>.from((json['chat_lists'] ?? [])!.map((item) => ChatList.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    chatLists = pre_chatLists;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_lists": chatLists?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'chatLists';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}