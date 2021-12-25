part of '../tdapi.dart';

class DownloadFile extends TdFunction {

  /// Downloads a file from the cloud. Download progress and completion of the download will be notified through updateFile updates
  DownloadFile({this.fileId,
    this.priority,
    this.offset,
    this.limit,
    this.synchronous});

  /// [fileId] Identifier of the file to download
  int? fileId;

  /// [priority] Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile was called will be downloaded first
  int? priority;

  /// [offset] The starting position from which the file needs to be downloaded
  int? offset;

  /// [limit] Number of bytes which need to be downloaded starting from the "offset" position before the download will automatically be canceled; use 0 to download without a limit
  int? limit;

  /// [synchronous] If false, this request returns file state just after the download has been started. If true, this request returns file state only after. the download has succeeded, has failed, has been canceled or a new downloadFile request with different offset/limit parameters was sent
  bool? synchronous;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  DownloadFile.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "file_id": fileId,
      "priority": priority,
      "offset": offset,
      "limit": limit,
      "synchronous": synchronous,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'downloadFile';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}