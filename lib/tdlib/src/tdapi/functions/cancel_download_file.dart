part of '../tdapi.dart';

class CancelDownloadFile extends TdFunction {

  /// Stops the downloading of a file. If a file has already been downloaded, does nothing
  CancelDownloadFile({this.fileId,
    this.onlyIfPending});

  /// [fileId] Identifier of a file to stop downloading 
  int? fileId;

  /// [onlyIfPending] Pass true to stop downloading only if it hasn't been started, i.e. request hasn't been sent to server
  bool? onlyIfPending;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CancelDownloadFile.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "file_id": fileId,
      "only_if_pending": onlyIfPending,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'cancelDownloadFile';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}