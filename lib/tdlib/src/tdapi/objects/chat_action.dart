part of '../tdapi.dart';

class ChatAction extends TdObject {

  /// Describes the different types of activity in a chat
  ChatAction();

  

  /// a ChatAction return type can be :
  /// * ChatActionTyping
  /// * ChatActionRecordingVideo
  /// * ChatActionUploadingVideo
  /// * ChatActionRecordingVoiceNote
  /// * ChatActionUploadingVoiceNote
  /// * ChatActionUploadingPhoto
  /// * ChatActionUploadingDocument
  /// * ChatActionChoosingSticker
  /// * ChatActionChoosingLocation
  /// * ChatActionChoosingContact
  /// * ChatActionStartPlayingGame
  /// * ChatActionRecordingVideoNote
  /// * ChatActionUploadingVideoNote
  /// * ChatActionWatchingAnimations
  /// * ChatActionCancel
  factory ChatAction.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case ChatActionTyping.CONSTRUCTOR:
        return ChatActionTyping.fromJson(json);
      case ChatActionRecordingVideo.CONSTRUCTOR:
        return ChatActionRecordingVideo.fromJson(json);
      case ChatActionUploadingVideo.CONSTRUCTOR:
        return ChatActionUploadingVideo.fromJson(json);
      case ChatActionRecordingVoiceNote.CONSTRUCTOR:
        return ChatActionRecordingVoiceNote.fromJson(json);
      case ChatActionUploadingVoiceNote.CONSTRUCTOR:
        return ChatActionUploadingVoiceNote.fromJson(json);
      case ChatActionUploadingPhoto.CONSTRUCTOR:
        return ChatActionUploadingPhoto.fromJson(json);
      case ChatActionUploadingDocument.CONSTRUCTOR:
        return ChatActionUploadingDocument.fromJson(json);
      case ChatActionChoosingSticker.CONSTRUCTOR:
        return ChatActionChoosingSticker.fromJson(json);
      case ChatActionChoosingLocation.CONSTRUCTOR:
        return ChatActionChoosingLocation.fromJson(json);
      case ChatActionChoosingContact.CONSTRUCTOR:
        return ChatActionChoosingContact.fromJson(json);
      case ChatActionStartPlayingGame.CONSTRUCTOR:
        return ChatActionStartPlayingGame.fromJson(json);
      case ChatActionRecordingVideoNote.CONSTRUCTOR:
        return ChatActionRecordingVideoNote.fromJson(json);
      case ChatActionUploadingVideoNote.CONSTRUCTOR:
        return ChatActionUploadingVideoNote.fromJson(json);
      case ChatActionWatchingAnimations.CONSTRUCTOR:
        return ChatActionWatchingAnimations.fromJson(json);
      case ChatActionCancel.CONSTRUCTOR:
        return ChatActionCancel.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'chatAction';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionTyping extends ChatAction {

  /// The user is typing a message
  ChatActionTyping();

  

  /// Parse from a json
  ChatActionTyping.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'chatActionTyping';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionRecordingVideo extends ChatAction {

  /// The user is recording a video
  ChatActionRecordingVideo();

  

  /// Parse from a json
  ChatActionRecordingVideo.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'chatActionRecordingVideo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionUploadingVideo extends ChatAction {

  /// The user is uploading a video
  ChatActionUploadingVideo({this.progress});

  /// [progress] Upload progress, as a percentage
  int? progress;

  /// Parse from a json
  ChatActionUploadingVideo.fromJson(Map<String, dynamic> json)  {
    int? pre_progress;
    try{
      pre_progress=json['progress'];
   }catch(_){}
    progress = pre_progress;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "progress": progress,
    };
  }

  static const CONSTRUCTOR = 'chatActionUploadingVideo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionRecordingVoiceNote extends ChatAction {

  /// The user is recording a voice note
  ChatActionRecordingVoiceNote();

  

  /// Parse from a json
  ChatActionRecordingVoiceNote.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'chatActionRecordingVoiceNote';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionUploadingVoiceNote extends ChatAction {

  /// The user is uploading a voice note
  ChatActionUploadingVoiceNote({this.progress});

  /// [progress] Upload progress, as a percentage
  int? progress;

  /// Parse from a json
  ChatActionUploadingVoiceNote.fromJson(Map<String, dynamic> json)  {
    int? pre_progress;
    try{
      pre_progress=json['progress'];
   }catch(_){}
    progress = pre_progress;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "progress": progress,
    };
  }

  static const CONSTRUCTOR = 'chatActionUploadingVoiceNote';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionUploadingPhoto extends ChatAction {

  /// The user is uploading a photo
  ChatActionUploadingPhoto({this.progress});

  /// [progress] Upload progress, as a percentage
  int? progress;

  /// Parse from a json
  ChatActionUploadingPhoto.fromJson(Map<String, dynamic> json)  {
    int? pre_progress;
    try{
      pre_progress=json['progress'];
   }catch(_){}
    progress = pre_progress;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "progress": progress,
    };
  }

  static const CONSTRUCTOR = 'chatActionUploadingPhoto';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionUploadingDocument extends ChatAction {

  /// The user is uploading a document
  ChatActionUploadingDocument({this.progress});

  /// [progress] Upload progress, as a percentage
  int? progress;

  /// Parse from a json
  ChatActionUploadingDocument.fromJson(Map<String, dynamic> json)  {
    int? pre_progress;
    try{
      pre_progress=json['progress'];
   }catch(_){}
    progress = pre_progress;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "progress": progress,
    };
  }

  static const CONSTRUCTOR = 'chatActionUploadingDocument';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionChoosingSticker extends ChatAction {

  /// The user is picking a sticker to send
  ChatActionChoosingSticker();

  

  /// Parse from a json
  ChatActionChoosingSticker.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'chatActionChoosingSticker';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionChoosingLocation extends ChatAction {

  /// The user is picking a location or venue to send
  ChatActionChoosingLocation();

  

  /// Parse from a json
  ChatActionChoosingLocation.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'chatActionChoosingLocation';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionChoosingContact extends ChatAction {

  /// The user is picking a contact to send
  ChatActionChoosingContact();

  

  /// Parse from a json
  ChatActionChoosingContact.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'chatActionChoosingContact';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionStartPlayingGame extends ChatAction {

  /// The user has started to play a game
  ChatActionStartPlayingGame();

  

  /// Parse from a json
  ChatActionStartPlayingGame.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'chatActionStartPlayingGame';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionRecordingVideoNote extends ChatAction {

  /// The user is recording a video note
  ChatActionRecordingVideoNote();

  

  /// Parse from a json
  ChatActionRecordingVideoNote.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'chatActionRecordingVideoNote';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionUploadingVideoNote extends ChatAction {

  /// The user is uploading a video note
  ChatActionUploadingVideoNote({this.progress});

  /// [progress] Upload progress, as a percentage
  int? progress;

  /// Parse from a json
  ChatActionUploadingVideoNote.fromJson(Map<String, dynamic> json)  {
    int? pre_progress;
    try{
      pre_progress=json['progress'];
   }catch(_){}
    progress = pre_progress;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "progress": progress,
    };
  }

  static const CONSTRUCTOR = 'chatActionUploadingVideoNote';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionWatchingAnimations extends ChatAction {

  /// The user is watching animations sent by the other party by clicking on an animated emoji
  ChatActionWatchingAnimations({this.emoji});

  /// [emoji] The animated emoji
  String? emoji;

  /// Parse from a json
  ChatActionWatchingAnimations.fromJson(Map<String, dynamic> json)  {
    String? pre_emoji;
    try{
      pre_emoji=json['emoji'];
   }catch(_){}
    emoji = pre_emoji;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "emoji": emoji,
    };
  }

  static const CONSTRUCTOR = 'chatActionWatchingAnimations';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionCancel extends ChatAction {

  /// The user has canceled the previous action
  ChatActionCancel();

  

  /// Parse from a json
  ChatActionCancel.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'chatActionCancel';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}