part of '../tdapi.dart';

class SetLogStream extends TdFunction {

  /// Sets new log stream for internal logging of TDLib. Can be called synchronously
  SetLogStream({this.logStream});

  /// [logStream] New log stream
  LogStream? logStream;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetLogStream.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "log_stream": logStream == null ? null : logStream?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setLogStream';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}