part of '../tdapi.dart';

class NetworkStatisticsEntry extends TdObject {

  /// Contains statistics about network usage
  NetworkStatisticsEntry();

  

  /// a NetworkStatisticsEntry return type can be :
  /// * NetworkStatisticsEntryFile
  /// * NetworkStatisticsEntryCall
  factory NetworkStatisticsEntry.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case NetworkStatisticsEntryFile.CONSTRUCTOR:
        return NetworkStatisticsEntryFile.fromJson(json);
      case NetworkStatisticsEntryCall.CONSTRUCTOR:
        return NetworkStatisticsEntryCall.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'networkStatisticsEntry';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class NetworkStatisticsEntryFile extends NetworkStatisticsEntry {

  /// Contains information about the total amount of data that was used to send and receive files
  NetworkStatisticsEntryFile({this.fileType,
    this.networkType,
    this.sentBytes,
    this.receivedBytes});

  /// [fileType] Type of the file the data is part of; pass null if the data isn't related to files
  FileType? fileType;

  /// [networkType] Type of the network the data was sent through. Call setNetworkType to maintain the actual network type
  NetworkType? networkType;

  /// [sentBytes] Total number of bytes sent
  int? sentBytes;

  /// [receivedBytes] Total number of bytes received
  int? receivedBytes;

  /// Parse from a json
  NetworkStatisticsEntryFile.fromJson(Map<String, dynamic> json)  {
    FileType? pre_fileType;
    try{
      pre_fileType=FileType.fromJson(json['file_type'] ?? <String, dynamic>{});
   }catch(_){}
    fileType = pre_fileType;
    NetworkType? pre_networkType;
    try{
      pre_networkType=NetworkType.fromJson(json['network_type'] ?? <String, dynamic>{});
   }catch(_){}
    networkType = pre_networkType;
    int? pre_sentBytes;
    try{
      pre_sentBytes=json['sent_bytes'];
   }catch(_){}
    sentBytes = pre_sentBytes;
    int? pre_receivedBytes;
    try{
      pre_receivedBytes=json['received_bytes'];
   }catch(_){}
    receivedBytes = pre_receivedBytes;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "file_type": fileType == null ? null : fileType?.toJson(),
      "network_type": networkType == null ? null : networkType?.toJson(),
      "sent_bytes": sentBytes,
      "received_bytes": receivedBytes,
    };
  }

  static const CONSTRUCTOR = 'networkStatisticsEntryFile';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class NetworkStatisticsEntryCall extends NetworkStatisticsEntry {

  /// Contains information about the total amount of data that was used for calls
  NetworkStatisticsEntryCall({this.networkType,
    this.sentBytes,
    this.receivedBytes,
    this.duration});

  /// [networkType] Type of the network the data was sent through. Call setNetworkType to maintain the actual network type
  NetworkType? networkType;

  /// [sentBytes] Total number of bytes sent
  int? sentBytes;

  /// [receivedBytes] Total number of bytes received
  int? receivedBytes;

  /// [duration] Total call duration, in seconds
  double? duration;

  /// Parse from a json
  NetworkStatisticsEntryCall.fromJson(Map<String, dynamic> json)  {
    NetworkType? pre_networkType;
    try{
      pre_networkType=NetworkType.fromJson(json['network_type'] ?? <String, dynamic>{});
   }catch(_){}
    networkType = pre_networkType;
    int? pre_sentBytes;
    try{
      pre_sentBytes=json['sent_bytes'];
   }catch(_){}
    sentBytes = pre_sentBytes;
    int? pre_receivedBytes;
    try{
      pre_receivedBytes=json['received_bytes'];
   }catch(_){}
    receivedBytes = pre_receivedBytes;
    double? pre_duration;
    try{
      pre_duration=json['duration'];
   }catch(_){}
    duration = pre_duration;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "network_type": networkType == null ? null : networkType?.toJson(),
      "sent_bytes": sentBytes,
      "received_bytes": receivedBytes,
      "duration": duration,
    };
  }

  static const CONSTRUCTOR = 'networkStatisticsEntryCall';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}