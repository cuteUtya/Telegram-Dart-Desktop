part of '../tdapi.dart';

class FinishFileGeneration extends TdFunction {

  /// Finishes the file generation
  FinishFileGeneration({this.generationId,
    this.error});

  /// [generationId] The identifier of the generation process
  int? generationId;

  /// [error] If passed, the file generation has failed and must be terminated; pass null if the file generation succeeded
  TdError? error;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  FinishFileGeneration.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "generation_id": generationId,
      "error": error == null ? null : error?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'finishFileGeneration';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}