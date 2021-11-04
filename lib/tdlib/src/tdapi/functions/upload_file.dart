part of '../tdapi.dart';

class UploadFile extends TdFunction {

  /// Asynchronously uploads a file to the cloud without sending it in a message. updateFile will be used to notify about upload progress and successful completion of the upload. The file will not have a persistent remote identifier until it will be sent in a message
  UploadFile({this.file,
    this.fileType,
    this.priority});

  /// [file] File to upload
  InputFile? file;

  /// [fileType] File type; pass null if unknown
  FileType? fileType;

  /// [priority] Priority of the upload (1-32). The higher the priority, the earlier the file will be uploaded. If the priorities of two files are equal, then the first one for which uploadFile was called will be uploaded first
  int? priority;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UploadFile.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "file": file == null ? null : file?.toJson(),
      "file_type": fileType == null ? null : fileType?.toJson(),
      "priority": priority,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'uploadFile';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}