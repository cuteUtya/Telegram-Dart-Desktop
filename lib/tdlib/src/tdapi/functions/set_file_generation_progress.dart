part of '../tdapi.dart';

class SetFileGenerationProgress extends TdFunction {

  /// Informs TDLib on a file generation progress
  SetFileGenerationProgress({this.generationId,
    this.expectedSize,
    this.localPrefixSize});

  /// [generationId] The identifier of the generation process
  int? generationId;

  /// [expectedSize] Expected size of the generated file, in bytes; 0 if unknown
  int? expectedSize;

  /// [localPrefixSize] The number of bytes already generated
  int? localPrefixSize;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetFileGenerationProgress.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "generation_id": generationId,
      "expected_size": expectedSize,
      "local_prefix_size": localPrefixSize,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setFileGenerationProgress';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}