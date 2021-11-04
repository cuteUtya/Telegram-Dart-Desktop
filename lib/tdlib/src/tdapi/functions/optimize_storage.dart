part of '../tdapi.dart';

class OptimizeStorage extends TdFunction {

  /// Optimizes storage usage, i.e. deletes some files and returns new storage usage statistics. Secret thumbnails can't be deleted
  OptimizeStorage({this.size,
    this.ttl,
    this.count,
    this.immunityDelay,
    this.fileTypes,
    this.chatIds,
    this.excludeChatIds,
    this.returnDeletedFileStatistics,
    this.chatLimit});

  /// [size] Limit on the total size of files after deletion, in bytes. Pass -1 to use the default limit
  int? size;

  /// [ttl] Limit on the time that has passed since the last time a file was accessed (or creation time for some filesystems). Pass -1 to use the default limit
  int? ttl;

  /// [count] Limit on the total count of files after deletion. Pass -1 to use the default limit
  int? count;

  /// [immunityDelay] The amount of time after the creation of a file during which it can't be deleted, in seconds. Pass -1 to use the default value
  int? immunityDelay;

  /// [fileTypes] If non-empty, only files with the given types are considered. By default, all types except thumbnails, profile photos, stickers and wallpapers are deleted
  List<FileType>? fileTypes;

  /// [chatIds] If non-empty, only files from the given chats are considered. Use 0 as chat identifier to delete files not belonging to any chat (e.g., profile photos)
  List<int>? chatIds;

  /// [excludeChatIds] If non-empty, files from the given chats are excluded. Use 0 as chat identifier to exclude all files not belonging to any chat (e.g., profile photos)
  List<int>? excludeChatIds;

  /// [returnDeletedFileStatistics] Pass true if statistics about the files that were deleted must be returned instead of the whole storage usage statistics. Affects only returned statistics
  bool? returnDeletedFileStatistics;

  /// [chatLimit] Same as in getStorageStatistics. Affects only returned statistics
  int? chatLimit;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  OptimizeStorage.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "size": size,
      "ttl": ttl,
      "count": count,
      "immunity_delay": immunityDelay,
      "file_types": fileTypes?.map((i) => i.toJson()).toList(),
      "chat_ids": chatIds?.map((i) => i).toList(),
      "exclude_chat_ids": excludeChatIds?.map((i) => i).toList(),
      "return_deleted_file_statistics": returnDeletedFileStatistics,
      "chat_limit": chatLimit,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'optimizeStorage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}