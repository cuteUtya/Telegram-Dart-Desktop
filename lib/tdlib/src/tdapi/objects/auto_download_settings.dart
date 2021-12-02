part of '../tdapi.dart';

class AutoDownloadSettings extends TdObject {

  /// Contains auto-download settings
  AutoDownloadSettings({this.isAutoDownloadEnabled,
    this.maxPhotoFileSize,
    this.maxVideoFileSize,
    this.maxOtherFileSize,
    this.videoUploadBitrate,
    this.preloadLargeVideos,
    this.preloadNextAudio,
    this.useLessDataForCalls});

  /// [isAutoDownloadEnabled] True, if the auto-download is enabled
  bool? isAutoDownloadEnabled;

  /// [maxPhotoFileSize] The maximum size of a photo file to be auto-downloaded, in bytes
  int? maxPhotoFileSize;

  /// [maxVideoFileSize] The maximum size of a video file to be auto-downloaded, in bytes
  int? maxVideoFileSize;

  /// [maxOtherFileSize] The maximum size of other file types to be auto-downloaded, in bytes
  int? maxOtherFileSize;

  /// [videoUploadBitrate] The maximum suggested bitrate for uploaded videos, in kbit/s
  int? videoUploadBitrate;

  /// [preloadLargeVideos] True, if the beginning of video files needs to be preloaded for instant playback
  bool? preloadLargeVideos;

  /// [preloadNextAudio] True, if the next audio track needs to be preloaded while the user is listening to an audio file
  bool? preloadNextAudio;

  /// [useLessDataForCalls] True, if "use less data for calls" option needs to be enabled
  bool? useLessDataForCalls;

  /// Parse from a json
  AutoDownloadSettings.fromJson(Map<String, dynamic> json)  {
    isAutoDownloadEnabled = json['is_auto_download_enabled'] == null ? null : json['is_auto_download_enabled'];
    maxPhotoFileSize = json['max_photo_file_size'] == null ? null : json['max_photo_file_size'];
    maxVideoFileSize = json['max_video_file_size'] == null ? null : json['max_video_file_size'];
    maxOtherFileSize = json['max_other_file_size'] == null ? null : json['max_other_file_size'];
    videoUploadBitrate = json['video_upload_bitrate'] == null ? null : json['video_upload_bitrate'];
    preloadLargeVideos = json['preload_large_videos'] == null ? null : json['preload_large_videos'];
    preloadNextAudio = json['preload_next_audio'] == null ? null : json['preload_next_audio'];
    useLessDataForCalls = json['use_less_data_for_calls'] == null ? null : json['use_less_data_for_calls'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "is_auto_download_enabled": isAutoDownloadEnabled,
      "max_photo_file_size": maxPhotoFileSize,
      "max_video_file_size": maxVideoFileSize,
      "max_other_file_size": maxOtherFileSize,
      "video_upload_bitrate": videoUploadBitrate,
      "preload_large_videos": preloadLargeVideos,
      "preload_next_audio": preloadNextAudio,
      "use_less_data_for_calls": useLessDataForCalls,
    };
  }

  static const CONSTRUCTOR = 'autoDownloadSettings';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}