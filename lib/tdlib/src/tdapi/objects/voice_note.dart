part of '../tdapi.dart';

class VoiceNote extends TdObject {

  /// Describes a voice note. The voice note must be encoded with the Opus codec, and stored inside an OGG container. Voice notes can have only a single audio channel
  VoiceNote({this.duration,
    this.waveform,
    this.mimeType,
    this.voice});

  /// [duration] Duration of the voice note, in seconds; as defined by the sender
  int? duration;

  /// [waveform] A waveform representation of the voice note in 5-bit format
  String? waveform;

  /// [mimeType] MIME type of the file; as defined by the sender 
  String? mimeType;

  /// [voice] File containing the voice note
  File? voice;

  /// Parse from a json
  VoiceNote.fromJson(Map<String, dynamic> json)  {
    int? pre_duration;
    try{
      pre_duration=json['duration'];
   }catch(_){}
    duration = pre_duration;
    String? pre_waveform;
    try{
      pre_waveform=json['waveform'];
   }catch(_){}
    waveform = pre_waveform;
    String? pre_mimeType;
    try{
      pre_mimeType=json['mime_type'];
   }catch(_){}
    mimeType = pre_mimeType;
    File? pre_voice;
    try{
      pre_voice=File.fromJson(json['voice'] ?? <String, dynamic>{});
   }catch(_){}
    voice = pre_voice;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "duration": duration,
      "waveform": waveform,
      "mime_type": mimeType,
      "voice": voice == null ? null : voice?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'voiceNote';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}