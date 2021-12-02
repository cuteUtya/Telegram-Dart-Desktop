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
    filesSize = json['files_size'] == null ? null : json['files_size'];
    fileCount = json['file_count'] == null ? null : json['file_count'];
    databaseSize = json['database_size'] == null ? null : json['database_size'];
    languagePackDatabaseSize = json['language_pack_database_size'] == null ? null : json['language_pack_database_size'];
    logSize = json['log_size'] == null ? null : json['log_size'];
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