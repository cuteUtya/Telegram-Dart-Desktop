part of '../tdapi.dart';

class LocalFile extends TdObject {

  /// Represents a local file
  LocalFile({this.path,
    this.canBeDownloaded,
    this.canBeDeleted,
    this.isDownloadingActive,
    this.isDownloadingCompleted,
    this.downloadOffset,
    this.downloadedPrefixSize,
    this.downloadedSize});

  /// [path] Local path to the locally available file part; may be empty
  String? path;

  /// [canBeDownloaded] True, if it is possible to download or generate the file
  bool? canBeDownloaded;

  /// [canBeDeleted] True, if the file can be deleted
  bool? canBeDeleted;

  /// [isDownloadingActive] True, if the file is currently being downloaded (or a local copy is being generated by some other means)
  bool? isDownloadingActive;

  /// [isDownloadingCompleted] True, if the local copy is fully available
  bool? isDownloadingCompleted;

  /// [downloadOffset] Download will be started from this offset. downloaded_prefix_size is calculated from this offset
  int? downloadOffset;

  /// [downloadedPrefixSize] If is_downloading_completed is false, then only some prefix of the file starting from download_offset is ready to be read. downloaded_prefix_size is the size of that prefix in bytes
  int? downloadedPrefixSize;

  /// [downloadedSize] Total downloaded file size, in bytes. Can be used only for calculating download progress. The actual file size may be bigger, and some parts of it may contain garbage
  int? downloadedSize;

  /// Parse from a json
  LocalFile.fromJson(Map<String, dynamic> json)  {
    path = json['path'] == null ? null : json['path'];
    canBeDownloaded = json['can_be_downloaded'] == null ? null : json['can_be_downloaded'];
    canBeDeleted = json['can_be_deleted'] == null ? null : json['can_be_deleted'];
    isDownloadingActive = json['is_downloading_active'] == null ? null : json['is_downloading_active'];
    isDownloadingCompleted = json['is_downloading_completed'] == null ? null : json['is_downloading_completed'];
    downloadOffset = json['download_offset'] == null ? null : json['download_offset'];
    downloadedPrefixSize = json['downloaded_prefix_size'] == null ? null : json['downloaded_prefix_size'];
    downloadedSize = json['downloaded_size'] == null ? null : json['downloaded_size'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "path": path,
      "can_be_downloaded": canBeDownloaded,
      "can_be_deleted": canBeDeleted,
      "is_downloading_active": isDownloadingActive,
      "is_downloading_completed": isDownloadingCompleted,
      "download_offset": downloadOffset,
      "downloaded_prefix_size": downloadedPrefixSize,
      "downloaded_size": downloadedSize,
    };
  }

  static const CONSTRUCTOR = 'localFile';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}