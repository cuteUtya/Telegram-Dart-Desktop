part of '../tdapi.dart';

class InputChatPhoto extends TdObject {

  /// Describes a photo to be set as a user profile or chat photo
  InputChatPhoto();

  

  /// a InputChatPhoto return type can be :
  /// * InputChatPhotoPrevious
  /// * InputChatPhotoStatic
  /// * InputChatPhotoAnimation
  factory InputChatPhoto.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case InputChatPhotoPrevious.CONSTRUCTOR:
        return InputChatPhotoPrevious.fromJson(json);
      case InputChatPhotoStatic.CONSTRUCTOR:
        return InputChatPhotoStatic.fromJson(json);
      case InputChatPhotoAnimation.CONSTRUCTOR:
        return InputChatPhotoAnimation.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'inputChatPhoto';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputChatPhotoPrevious extends InputChatPhoto {

  /// A previously used profile photo of the current user
  InputChatPhotoPrevious({this.chatPhotoId});

  /// [chatPhotoId] Identifier of the current user's profile photo to reuse
  int? chatPhotoId;

  /// Parse from a json
  InputChatPhotoPrevious.fromJson(Map<String, dynamic> json)  {
    int? pre_chatPhotoId;
    try{
      pre_chatPhotoId=int.tryParse(json['chat_photo_id'] ?? "");
   }catch(_){}
    chatPhotoId = pre_chatPhotoId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_photo_id": chatPhotoId,
    };
  }

  static const CONSTRUCTOR = 'inputChatPhotoPrevious';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputChatPhotoStatic extends InputChatPhoto {

  /// A static photo in JPEG format
  InputChatPhotoStatic({this.photo});

  /// [photo] Photo to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed
  InputFile? photo;

  /// Parse from a json
  InputChatPhotoStatic.fromJson(Map<String, dynamic> json)  {
    InputFile? pre_photo;
    try{
      pre_photo=InputFile.fromJson(json['photo'] ?? <String, dynamic>{});
   }catch(_){}
    photo = pre_photo;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "photo": photo == null ? null : photo?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputChatPhotoStatic';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputChatPhotoAnimation extends InputChatPhoto {

  /// An animation in MPEG4 format; must be square, at most 10 seconds long, have width between 160 and 800 and be at most 2MB in size
  InputChatPhotoAnimation({this.animation,
    this.mainFrameTimestamp});

  /// [animation] Animation to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed
  InputFile? animation;

  /// [mainFrameTimestamp] Timestamp of the frame, which will be used as static chat photo
  double? mainFrameTimestamp;

  /// Parse from a json
  InputChatPhotoAnimation.fromJson(Map<String, dynamic> json)  {
    InputFile? pre_animation;
    try{
      pre_animation=InputFile.fromJson(json['animation'] ?? <String, dynamic>{});
   }catch(_){}
    animation = pre_animation;
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
      "animation": animation == null ? null : animation?.toJson(),
      "main_frame_timestamp": mainFrameTimestamp,
    };
  }

  static const CONSTRUCTOR = 'inputChatPhotoAnimation';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}