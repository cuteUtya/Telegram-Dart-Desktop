part of '../tdapi.dart';

class StorageStatisticsByFileType extends TdObject {

  /// Contains the storage usage statistics for a specific file type
  StorageStatisticsByFileType({this.fileType,
    this.size,
    this.count});

  /// [fileType] File type 
  FileType? fileType;

  /// [size] Total size of the files, in bytes 
  int? size;

  /// [count] Total number of files
  int? count;

  /// Parse from a json
  StorageStatisticsByFileType.fromJson(Map<String, dynamic> json)  {
    fileType = FileType.fromJson(json['file_type'] ?? <String, dynamic>{});
    size = json['size'];
    count = json['count'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "file_type": fileType == null ? null : fileType?.toJson(),
      "size": size,
      "count": count,
    };
  }

  static const CONSTRUCTOR = 'storageStatisticsByFileType';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}