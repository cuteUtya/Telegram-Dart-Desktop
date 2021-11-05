part of '../tdapi.dart';

class AnimatedChatPhoto extends TdObject {

  /// Animated variant of a chat photo in MPEG4 format
  AnimatedChatPhoto({this.length,
    this.file,
    this.mainFrameTimestamp});

  /// [length] Animation width and height
  int? length;

  /// [file] Information about the animation file
  File? file;

  /// [mainFrameTimestamp] Timestamp of the frame, used as a static chat photo
  double? mainFrameTimestamp;

  /// Parse from a json
  AnimatedChatPhoto.fromJson(Map<String, dynamic> json)  {
    int? pre_length;
    try{
      pre_length=json['length'];
   }catch(_){}
    length = pre_length;
    File? pre_file;
    try{
      pre_file=File.fromJson(json['file'] ?? <String, dynamic>{});
   }catch(_){}
    file = pre_file;
    double? pre_mainFrameTimestamp;
    try{
      pre_mainFrameTimestamp=json['main_frame_timestamp'];
   }catch(_){}
    mainFrameTimestamp = pre_mainFrameTimestamp;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "length": length,
      "file": file == null ? null : file?.toJson(),
      "main_frame_timestamp": mainFrameTimestamp,
    };
  }

  static const CONSTRUCTOR = 'animatedChatPhoto';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}