part of '../tdapi.dart';

class TdlibParameters extends TdObject {

  /// Contains parameters for TDLib initialization
  TdlibParameters({this.useTestDc,
    this.databaseDirectory,
    this.filesDirectory,
    this.useFileDatabase,
    this.useChatInfoDatabase,
    this.useMessageDatabase,
    this.useSecretChats,
    this.apiId,
    this.apiHash,
    this.systemLanguageCode,
    this.deviceModel,
    this.systemVersion,
    this.applicationVersion,
    this.enableStorageOptimizer,
    this.ignoreFileNames});

  /// [useTestDc] If set to true, the Telegram test environment will be used instead of the production environment
  bool? useTestDc;

  /// [databaseDirectory] The path to the directory for the persistent database; if empty, the current working directory will be used
  String? databaseDirectory;

  /// [filesDirectory] The path to the directory for storing files; if empty, database_directory will be used
  String? filesDirectory;

  /// [useFileDatabase] If set to true, information about downloaded and uploaded files will be saved between application restarts
  bool? useFileDatabase;

  /// [useChatInfoDatabase] If set to true, the library will maintain a cache of users, basic groups, supergroups, channels and secret chats. Implies use_file_database
  bool? useChatInfoDatabase;

  /// [useMessageDatabase] If set to true, the library will maintain a cache of chats and messages. Implies use_chat_info_database
  bool? useMessageDatabase;

  /// [useSecretChats] If set to true, support for secret chats will be enabled
  bool? useSecretChats;

  /// [apiId] Application identifier for Telegram API access, which can be obtained at https://my.telegram.org
  int? apiId;

  /// [apiHash] Application identifier hash for Telegram API access, which can be obtained at https://my.telegram.org
  String? apiHash;

  /// [systemLanguageCode] IETF language tag of the user's operating system language; must be non-empty
  String? systemLanguageCode;

  /// [deviceModel] Model of the device the application is being run on; must be non-empty
  String? deviceModel;

  /// [systemVersion] Version of the operating system the application is being run on. If empty, the version is automatically detected by TDLib
  String? systemVersion;

  /// [applicationVersion] Application version; must be non-empty
  String? applicationVersion;

  /// [enableStorageOptimizer] If set to true, old files will automatically be deleted
  bool? enableStorageOptimizer;

  /// [ignoreFileNames] If set to true, original file names will be ignored. Otherwise, downloaded files will be saved under names as close as possible to the original name
  bool? ignoreFileNames;

  /// Parse from a json
  TdlibParameters.fromJson(Map<String, dynamic> json)  {
    bool? pre_useTestDc;
    try{
      pre_useTestDc=json['use_test_dc'];
   }catch(_){}
    useTestDc = pre_useTestDc;
    String? pre_databaseDirectory;
    try{
      pre_databaseDirectory=json['database_directory'];
   }catch(_){}
    databaseDirectory = pre_databaseDirectory;
    String? pre_filesDirectory;
    try{
      pre_filesDirectory=json['files_directory'];
   }catch(_){}
    filesDirectory = pre_filesDirectory;
    bool? pre_useFileDatabase;
    try{
      pre_useFileDatabase=json['use_file_database'];
   }catch(_){}
    useFileDatabase = pre_useFileDatabase;
    bool? pre_useChatInfoDatabase;
    try{
      pre_useChatInfoDatabase=json['use_chat_info_database'];
   }catch(_){}
    useChatInfoDatabase = pre_useChatInfoDatabase;
    bool? pre_useMessageDatabase;
    try{
      pre_useMessageDatabase=json['use_message_database'];
   }catch(_){}
    useMessageDatabase = pre_useMessageDatabase;
    bool? pre_useSecretChats;
    try{
      pre_useSecretChats=json['use_secret_chats'];
   }catch(_){}
    useSecretChats = pre_useSecretChats;
    int? pre_apiId;
    try{
      pre_apiId=json['api_id'];
   }catch(_){}
    apiId = pre_apiId;
    String? pre_apiHash;
    try{
      pre_apiHash=json['api_hash'];
   }catch(_){}
    apiHash = pre_apiHash;
    String? pre_systemLanguageCode;
    try{
      pre_systemLanguageCode=json['system_language_code'];
   }catch(_){}
    systemLanguageCode = pre_systemLanguageCode;
    String? pre_deviceModel;
    try{
      pre_deviceModel=json['device_model'];
   }catch(_){}
    deviceModel = pre_deviceModel;
    String? pre_systemVersion;
    try{
      pre_systemVersion=json['system_version'];
   }catch(_){}
    systemVersion = pre_systemVersion;
    String? pre_applicationVersion;
    try{
      pre_applicationVersion=json['application_version'];
   }catch(_){}
    applicationVersion = pre_applicationVersion;
    bool? pre_enableStorageOptimizer;
    try{
      pre_enableStorageOptimizer=json['enable_storage_optimizer'];
   }catch(_){}
    enableStorageOptimizer = pre_enableStorageOptimizer;
    bool? pre_ignoreFileNames;
    try{
      pre_ignoreFileNames=json['ignore_file_names'];
   }catch(_){}
    ignoreFileNames = pre_ignoreFileNames;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "use_test_dc": useTestDc,
      "database_directory": databaseDirectory,
      "files_directory": filesDirectory,
      "use_file_database": useFileDatabase,
      "use_chat_info_database": useChatInfoDatabase,
      "use_message_database": useMessageDatabase,
      "use_secret_chats": useSecretChats,
      "api_id": apiId,
      "api_hash": apiHash,
      "system_language_code": systemLanguageCode,
      "device_model": deviceModel,
      "system_version": systemVersion,
      "application_version": applicationVersion,
      "enable_storage_optimizer": enableStorageOptimizer,
      "ignore_file_names": ignoreFileNames,
    };
  }

  static const CONSTRUCTOR = 'tdlibParameters';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}