part of '../tdapi.dart';

class File extends TdObject {

  /// Represents a file
  File({this.id,
    this.size,
    this.expectedSize,
    this.local,
    this.remote});

  /// [id] Unique file identifier
  int? id;

  /// [size] File size, in bytes; 0 if unknown
  int? size;

  /// [expectedSize] Approximate file size in bytes in case the exact file size is unknown. Can be used to show download/upload progress
  int? expectedSize;

  /// [local] Information about the local copy of the file
  LocalFile? local;

  /// [remote] Information about the remote copy of the file
  RemoteFile? remote;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  File.fromJson(Map<String, dynamic> json)  {
    int? pre_id;
    try{
      pre_id=json['id'];
   }catch(_){}
    id = pre_id;
    int? pre_size;
    try{
      pre_size=json['size'];
   }catch(_){}
    size = pre_size;
    int? pre_expectedSize;
    try{
      pre_expectedSize=json['expected_size'];
   }catch(_){}
    expectedSize = pre_expectedSize;
    LocalFile? pre_local;
    try{
      pre_local=LocalFile.fromJson(json['local'] ?? <String, dynamic>{});
   }catch(_){}
    local = pre_local;
    RemoteFile? pre_remote;
    try{
      pre_remote=RemoteFile.fromJson(json['remote'] ?? <String, dynamic>{});
   }catch(_){}
    remote = pre_remote;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "size": size,
      "expected_size": expectedSize,
      "local": local == null ? null : local?.toJson(),
      "remote": remote == null ? null : remote?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'file';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}