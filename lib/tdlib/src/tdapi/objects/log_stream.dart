part of '../tdapi.dart';

class LogStream extends TdObject {

  /// Describes a stream to which TDLib internal log is written
  LogStream();

  

  /// a LogStream return type can be :
  /// * LogStreamDefault
  /// * LogStreamFile
  /// * LogStreamEmpty
  factory LogStream.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case LogStreamDefault.CONSTRUCTOR:
        return LogStreamDefault.fromJson(json);
      case LogStreamFile.CONSTRUCTOR:
        return LogStreamFile.fromJson(json);
      case LogStreamEmpty.CONSTRUCTOR:
        return LogStreamEmpty.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'logStream';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class LogStreamDefault extends LogStream {

  /// The log is written to stderr or an OS specific log
  LogStreamDefault();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  LogStreamDefault.fromJson(Map<String, dynamic> json)  {
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'logStreamDefault';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class LogStreamFile extends LogStream {

  /// The log is written to a file
  LogStreamFile({this.path,
    this.maxFileSize,
    this.redirectStderr});

  /// [path] Path to the file to where the internal TDLib log will be written
  String? path;

  /// [maxFileSize] The maximum size of the file to where the internal TDLib log is written before the file will be auto-rotated, in bytes
  int? maxFileSize;

  /// [redirectStderr] Pass true to additionally redirect stderr to the log file. Ignored on Windows
  bool? redirectStderr;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  LogStreamFile.fromJson(Map<String, dynamic> json)  {
    String? pre_path;
    try{
      pre_path=json['path'];
   }catch(_){}
    path = pre_path;
    int? pre_maxFileSize;
    try{
      pre_maxFileSize=json['max_file_size'];
   }catch(_){}
    maxFileSize = pre_maxFileSize;
    bool? pre_redirectStderr;
    try{
      pre_redirectStderr=json['redirect_stderr'];
   }catch(_){}
    redirectStderr = pre_redirectStderr;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "path": path,
      "max_file_size": maxFileSize,
      "redirect_stderr": redirectStderr,
    };
  }

  static const CONSTRUCTOR = 'logStreamFile';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class LogStreamEmpty extends LogStream {

  /// The log is written nowhere
  LogStreamEmpty();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  LogStreamEmpty.fromJson(Map<String, dynamic> json)  {
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'logStreamEmpty';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}