part of '../tdapi.dart';

class GetSuggestedFileName extends TdFunction {

  /// Returns suggested name for saving a file in a given directory
  GetSuggestedFileName({this.fileId,
    this.directory});

  /// [fileId] Identifier of the file 
  int? fileId;

  /// [directory] Directory in which the file is supposed to be saved
  String? directory;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetSuggestedFileName.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "file_id": fileId,
      "directory": directory,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getSuggestedFileName';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}