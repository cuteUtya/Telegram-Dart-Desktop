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
    fileType = json['file_type'] == null ? null : FileType.fromJson(json['file_type'] ?? <String, dynamic>{});
    networkType = json['network_type'] == null ? null : NetworkType.fromJson(json['network_type'] ?? <String, dynamic>{});
    sentBytes = json['sent_bytes'] == null ? null : json['sent_bytes'];
    receivedBytes = json['received_bytes'] == null ? null : json['received_bytes'];
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
    networkType = json['network_type'] == null ? null : NetworkType.fromJson(json['network_type'] ?? <String, dynamic>{});
    sentBytes = json['sent_bytes'] == null ? null : json['sent_bytes'];
    receivedBytes = json['received_bytes'] == null ? null : json['received_bytes'];
    duration = json['duration'] == null ? null : json['duration'];
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