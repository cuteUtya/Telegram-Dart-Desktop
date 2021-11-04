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
    id = json['id'];
    size = json['size'];
    expectedSize = json['expected_size'];
    local = LocalFile.fromJson(json['local'] ?? <String, dynamic>{});
    remote = RemoteFile.fromJson(json['remote'] ?? <String, dynamic>{});
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