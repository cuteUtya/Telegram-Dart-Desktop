part of '../tdapi.dart';

class ClosedVectorPath extends TdObject {

  /// Represents a closed vector path. The path begins at the end point of the last command
  ClosedVectorPath({this.commands});

  /// [commands] List of vector path commands
  List<VectorPathCommand>? commands;

  /// Parse from a json
  ClosedVectorPath.fromJson(Map<String, dynamic> json)  {
    commands = json['commands'] == null ? null : List<VectorPathCommand>.from((json['commands'] ?? [])!.map((item) => VectorPathCommand.fromJson(item ?? <String, dynamic>{})).toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "commands": commands?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'closedVectorPath';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}