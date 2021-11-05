part of '../tdapi.dart';

class StorageStatisticsByChat extends TdObject {

  /// Contains the storage usage statistics for a specific chat
  StorageStatisticsByChat({this.chatId,
    this.size,
    this.count,
    this.byFileType});

  /// [chatId] Chat identifier; 0 if none 
  int? chatId;

  /// [size] Total size of the files in the chat, in bytes 
  int? size;

  /// [count] Total number of files in the chat 
  int? count;

  /// [byFileType] Statistics split by file types
  List<StorageStatisticsByFileType>? byFileType;

  /// Parse from a json
  StorageStatisticsByChat.fromJson(Map<String, dynamic> json)  {
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
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
    List<StorageStatisticsByFileType>? pre_byFileType;
    try{
      pre_byFileType=List<StorageStatisticsByFileType>.from((json['by_file_type'] ?? [])!.map((item) => StorageStatisticsByFileType.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    byFileType = pre_byFileType;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "size": size,
      "count": count,
      "by_file_type": byFileType?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'storageStatisticsByChat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}