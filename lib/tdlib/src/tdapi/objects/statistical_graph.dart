part of '../tdapi.dart';

class StatisticalGraph extends TdObject {

  /// Describes a statistical graph
  StatisticalGraph();

  

  /// a StatisticalGraph return type can be :
  /// * StatisticalGraphData
  /// * StatisticalGraphAsync
  /// * StatisticalGraphError
  factory StatisticalGraph.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case StatisticalGraphData.CONSTRUCTOR:
        return StatisticalGraphData.fromJson(json);
      case StatisticalGraphAsync.CONSTRUCTOR:
        return StatisticalGraphAsync.fromJson(json);
      case StatisticalGraphError.CONSTRUCTOR:
        return StatisticalGraphError.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'statisticalGraph';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class StatisticalGraphData extends StatisticalGraph {

  /// A graph data
  StatisticalGraphData({this.jsonData,
    this.zoomToken});

  /// [jsonData] Graph data in JSON format 
  String? jsonData;

  /// [zoomToken] If non-empty, a token which can be used to receive a zoomed in graph
  String? zoomToken;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  StatisticalGraphData.fromJson(Map<String, dynamic> json)  {
    jsonData = json['json_data'] == null ? null : json['json_data'];
    zoomToken = json['zoom_token'] == null ? null : json['zoom_token'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "json_data": jsonData,
      "zoom_token": zoomToken,
    };
  }

  static const CONSTRUCTOR = 'statisticalGraphData';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class StatisticalGraphAsync extends StatisticalGraph {

  /// The graph data to be asynchronously loaded through getStatisticalGraph
  StatisticalGraphAsync({this.token});

  /// [token] The token to use for data loading
  String? token;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  StatisticalGraphAsync.fromJson(Map<String, dynamic> json)  {
    token = json['token'] == null ? null : json['token'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "token": token,
    };
  }

  static const CONSTRUCTOR = 'statisticalGraphAsync';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class StatisticalGraphError extends StatisticalGraph {

  /// An error message to be shown to the user instead of the graph
  StatisticalGraphError({this.errorMessage});

  /// [errorMessage] The error message
  String? errorMessage;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  StatisticalGraphError.fromJson(Map<String, dynamic> json)  {
    errorMessage = json['error_message'] == null ? null : json['error_message'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "error_message": errorMessage,
    };
  }

  static const CONSTRUCTOR = 'statisticalGraphError';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}