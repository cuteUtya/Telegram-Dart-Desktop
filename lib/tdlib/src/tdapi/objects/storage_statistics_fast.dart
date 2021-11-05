part of '../tdapi.dart';

class StorageStatisticsFast extends TdObject {

  /// Contains approximate storage usage statistics, excluding files of unknown file type
  StorageStatisticsFast({this.filesSize,
    this.fileCount,
    this.databaseSize,
    this.languagePackDatabaseSize,
    this.logSize});

  /// [filesSize] Approximate total size of files, in bytes 
  int? filesSize;

  /// [fileCount] Approximate number of files
  int? fileCount;

  /// [databaseSize] Size of the database
  int? databaseSize;

  /// [languagePackDatabaseSize] Size of the language pack database 
  int? languagePackDatabaseSize;

  /// [logSize] Size of the TDLib internal log
  int? logSize;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  StorageStatisticsFast.fromJson(Map<String, dynamic> json)  {
    int? pre_filesSize;
    try{
      pre_filesSize=json['files_size'];
   }catch(_){}
    filesSize = pre_filesSize;
    int? pre_fileCount;
    try{
      pre_fileCount=json['file_count'];
   }catch(_){}
    fileCount = pre_fileCount;
    int? pre_databaseSize;
    try{
      pre_databaseSize=json['database_size'];
   }catch(_){}
    databaseSize = pre_databaseSize;
    int? pre_languagePackDatabaseSize;
    try{
      pre_languagePackDatabaseSize=json['language_pack_database_size'];
   }catch(_){}
    languagePackDatabaseSize = pre_languagePackDatabaseSize;
    int? pre_logSize;
    try{
      pre_logSize=json['log_size'];
   }catch(_){}
    logSize = pre_logSize;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "files_size": filesSize,
      "file_count": fileCount,
      "database_size": databaseSize,
      "language_pack_database_size": languagePackDatabaseSize,
      "log_size": logSize,
    };
  }

  static const CONSTRUCTOR = 'storageStatisticsFast';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}