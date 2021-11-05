part of '../tdapi.dart';

class StorageStatistics extends TdObject {

  /// Contains the exact storage usage statistics split by chats and file type
  StorageStatistics({this.size,
    this.count,
    this.byChat});

  /// [size] Total size of files, in bytes 
  int? size;

  /// [count] Total number of files 
  int? count;

  /// [byChat] Statistics split by chats
  List<StorageStatisticsByChat>? byChat;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  StorageStatistics.fromJson(Map<String, dynamic> json)  {
    int? pre_size;
    try{
      pre_size=json['size'];
   }catch(_){}
    size = pre_size;
    int? pre_count;
    try{
      pre_count=json['count'];
   }catch(_){}
    count = pre_count;
    List<StorageStatisticsByChat>? pre_byChat;
    try{
      pre_byChat=List<StorageStatisticsByChat>.from((json['by_chat'] ?? [])!.map((item) => StorageStatisticsByChat.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    byChat = pre_byChat;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "size": size,
      "count": count,
      "by_chat": byChat?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'storageStatistics';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}