part of '../tdapi.dart';

class InputMessageContent extends TdObject {

  /// The content of a message to send
  InputMessageContent();

  

  /// a InputMessageContent return type can be :
  /// * InputMessageText
  /// * InputMessageAnimation
  /// * InputMessageAudio
  /// * InputMessageDocument
  /// * InputMessagePhoto
  /// * InputMessageSticker
  /// * InputMessageVideo
  /// * InputMessageVideoNote
  /// * InputMessageVoiceNote
  /// * InputMessageLocation
  /// * InputMessageVenue
  /// * InputMessageContact
  /// * InputMessageDice
  /// * InputMessageGame
  /// * InputMessageInvoice
  /// * InputMessagePoll
  /// * InputMessageForwarded
  factory InputMessageContent.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case InputMessageText.CONSTRUCTOR:
        return InputMessageText.fromJson(json);
      case InputMessageAnimation.CONSTRUCTOR:
        return InputMessageAnimation.fromJson(json);
      case InputMessageAudio.CONSTRUCTOR:
        return InputMessageAudio.fromJson(json);
      case InputMessageDocument.CONSTRUCTOR:
        return InputMessageDocument.fromJson(json);
      case InputMessagePhoto.CONSTRUCTOR:
        return InputMessagePhoto.fromJson(json);
      case InputMessageSticker.CONSTRUCTOR:
        return InputMessageSticker.fromJson(json);
      case InputMessageVideo.CONSTRUCTOR:
        return InputMessageVideo.fromJson(json);
      case InputMessageVideoNote.CONSTRUCTOR:
        return InputMessageVideoNote.fromJson(json);
      case InputMessageVoiceNote.CONSTRUCTOR:
        return InputMessageVoiceNote.fromJson(json);
      case InputMessageLocation.CONSTRUCTOR:
        return InputMessageLocation.fromJson(json);
      case InputMessageVenue.CONSTRUCTOR:
        return InputMessageVenue.fromJson(json);
      case InputMessageContact.CONSTRUCTOR:
        return InputMessageContact.fromJson(json);
      case InputMessageDice.CONSTRUCTOR:
        return InputMessageDice.fromJson(json);
      case InputMessageGame.CONSTRUCTOR:
        return InputMessageGame.fromJson(json);
      case InputMessageInvoice.CONSTRUCTOR:
        return InputMessageInvoice.fromJson(json);
      case InputMessagePoll.CONSTRUCTOR:
        return InputMessagePoll.fromJson(json);
      case InputMessageForwarded.CONSTRUCTOR:
        return InputMessageForwarded.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'inputMessageContent';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputMessageText extends InputMessageContent {

  /// A text message
  InputMessageText({this.text,
    this.disableWebPagePreview,
    this.clearDraft});

  /// [text] Formatted text to be sent; 1-GetOption("message_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Code, Pre, PreCode, TextUrl and MentionName entities are allowed to be specified manually
  FormattedText? text;

  /// [disableWebPagePreview] True, if rich web page previews for URLs in the message text must be disabled
  bool? disableWebPagePreview;

  /// [clearDraft] True, if a chat message draft must be deleted
  bool? clearDraft;

  /// Parse from a json
  InputMessageText.fromJson(Map<String, dynamic> json)  {
    FormattedText? pre_text;
    try{
      pre_text=FormattedText.fromJson(json['text'] ?? <String, dynamic>{});
   }catch(_){}
    text = pre_text;
    bool? pre_disableWebPagePreview;
    try{
      pre_disableWebPagePreview=json['disable_web_page_preview'];
   }catch(_){}
    disableWebPagePreview = pre_disableWebPagePreview;
    bool? pre_clearDraft;
    try{
      pre_clearDraft=json['clear_draft'];
   }catch(_){}
    clearDraft = pre_clearDraft;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
      "disable_web_page_preview": disableWebPagePreview,
      "clear_draft": clearDraft,
    };
  }

  static const CONSTRUCTOR = 'inputMessageText';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputMessageAnimation extends InputMessageContent {

  /// An animation message (GIF-style).
  InputMessageAnimation({this.animation,
    this.thumbnail,
    this.addedStickerFileIds,
    this.duration,
    this.width,
    this.height,
    this.caption});

  /// [animation] Animation file to be sent 
  InputFile? animation;

  /// [thumbnail] Animation thumbnail; pass null to skip thumbnail uploading 
  InputThumbnail? thumbnail;

  /// [addedStickerFileIds] File identifiers of the stickers added to the animation, if applicable
  List<int>? addedStickerFileIds;

  /// [duration] Duration of the animation, in seconds
  int? duration;

  /// [width] Width of the animation; may be replaced by the server 
  int? width;

  /// [height] Height of the animation; may be replaced by the server 
  int? height;

  /// [caption] Animation caption; pass null to use an empty caption; 0-GetOption("message_caption_length_max") characters
  FormattedText? caption;

  /// Parse from a json
  InputMessageAnimation.fromJson(Map<String, dynamic> json)  {
    InputFile? pre_animation;
    try{
      pre_animation=InputFile.fromJson(json['animation'] ?? <String, dynamic>{});
   }catch(_){}
    animation = pre_animation;
    InputThumbnail? pre_thumbnail;
    try{
      pre_thumbnail=InputThumbnail.fromJson(json['thumbnail'] ?? <String, dynamic>{});
   }catch(_){}
    thumbnail = pre_thumbnail;
    List<int>? pre_addedStickerFileIds;
    try{
      pre_addedStickerFileIds=List<int>.from((json['added_sticker_file_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    addedStickerFileIds = pre_addedStickerFileIds;
    int? pre_duration;
    try{
      pre_duration=json['duration'];
   }catch(_){}
    duration = pre_duration;
    int? pre_width;
    try{
      pre_width=json['width'];
   }catch(_){}
    width = pre_width;
    int? pre_height;
    try{
      pre_height=json['height'];
   }catch(_){}
    height = pre_height;
    FormattedText? pre_caption;
    try{
      pre_caption=FormattedText.fromJson(json['caption'] ?? <String, dynamic>{});
   }catch(_){}
    caption = pre_caption;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "animation": animation == null ? null : animation?.toJson(),
      "thumbnail": thumbnail == null ? null : thumbnail?.toJson(),
      "added_sticker_file_ids": addedStickerFileIds?.map((i) => i).toList(),
      "duration": duration,
      "width": width,
      "height": height,
      "caption": caption == null ? null : caption?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputMessageAnimation';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputMessageAudio extends InputMessageContent {

  /// An audio message
  InputMessageAudio({this.audio,
    this.albumCoverThumbnail,
    this.duration,
    this.title,
    this.performer,
    this.caption});

  /// [audio] Audio file to be sent 
  InputFile? audio;

  /// [albumCoverThumbnail] Thumbnail of the cover for the album; pass null to skip thumbnail uploading 
  InputThumbnail? albumCoverThumbnail;

  /// [duration] Duration of the audio, in seconds; may be replaced by the server 
  int? duration;

  /// [title] Title of the audio; 0-64 characters; may be replaced by the server
  String? title;

  /// [performer] Performer of the audio; 0-64 characters, may be replaced by the server
  String? performer;

  /// [caption] Audio caption; pass null to use an empty caption; 0-GetOption("message_caption_length_max") characters
  FormattedText? caption;

  /// Parse from a json
  InputMessageAudio.fromJson(Map<String, dynamic> json)  {
    InputFile? pre_audio;
    try{
      pre_audio=InputFile.fromJson(json['audio'] ?? <String, dynamic>{});
   }catch(_){}
    audio = pre_audio;
    InputThumbnail? pre_albumCoverThumbnail;
    try{
      pre_albumCoverThumbnail=InputThumbnail.fromJson(json['album_cover_thumbnail'] ?? <String, dynamic>{});
   }catch(_){}
    albumCoverThumbnail = pre_albumCoverThumbnail;
    int? pre_duration;
    try{
      pre_duration=json['duration'];
   }catch(_){}
    duration = pre_duration;
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
    String? pre_performer;
    try{
      pre_performer=json['performer'];
   }catch(_){}
    performer = pre_performer;
    FormattedText? pre_caption;
    try{
      pre_caption=FormattedText.fromJson(json['caption'] ?? <String, dynamic>{});
   }catch(_){}
    caption = pre_caption;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "audio": audio == null ? null : audio?.toJson(),
      "album_cover_thumbnail": albumCoverThumbnail == null ? null : albumCoverThumbnail?.toJson(),
      "duration": duration,
      "title": title,
      "performer": performer,
      "caption": caption == null ? null : caption?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputMessageAudio';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputMessageDocument extends InputMessageContent {

  /// A document message (general file)
  InputMessageDocument({this.document,
    this.thumbnail,
    this.disableContentTypeDetection,
    this.caption});

  /// [document] Document to be sent 
  InputFile? document;

  /// [thumbnail] Document thumbnail; pass null to skip thumbnail uploading 
  InputThumbnail? thumbnail;

  /// [disableContentTypeDetection] If true, automatic file type detection will be disabled and the document will be always sent as file. Always true for files sent to secret chats 
  bool? disableContentTypeDetection;

  /// [caption] Document caption; pass null to use an empty caption; 0-GetOption("message_caption_length_max") characters
  FormattedText? caption;

  /// Parse from a json
  InputMessageDocument.fromJson(Map<String, dynamic> json)  {
    InputFile? pre_document;
    try{
      pre_document=InputFile.fromJson(json['document'] ?? <String, dynamic>{});
   }catch(_){}
    document = pre_document;
    InputThumbnail? pre_thumbnail;
    try{
      pre_thumbnail=InputThumbnail.fromJson(json['thumbnail'] ?? <String, dynamic>{});
   }catch(_){}
    thumbnail = pre_thumbnail;
    bool? pre_disableContentTypeDetection;
    try{
      pre_disableContentTypeDetection=json['disable_content_type_detection'];
   }catch(_){}
    disableContentTypeDetection = pre_disableContentTypeDetection;
    FormattedText? pre_caption;
    try{
      pre_caption=FormattedText.fromJson(json['caption'] ?? <String, dynamic>{});
   }catch(_){}
    caption = pre_caption;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "document": document == null ? null : document?.toJson(),
      "thumbnail": thumbnail == null ? null : thumbnail?.toJson(),
      "disable_content_type_detection": disableContentTypeDetection,
      "caption": caption == null ? null : caption?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputMessageDocument';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputMessagePhoto extends InputMessageContent {

  /// A photo message
  InputMessagePhoto({this.photo,
    this.thumbnail,
    this.addedStickerFileIds,
    this.width,
    this.height,
    this.caption,
    this.ttl});

  /// [photo] Photo to send 
  InputFile? photo;

  /// [thumbnail] Photo thumbnail to be sent; pass null to skip thumbnail uploading. The thumbnail is sent to the other party only in secret chats 
  InputThumbnail? thumbnail;

  /// [addedStickerFileIds] File identifiers of the stickers added to the photo, if applicable 
  List<int>? addedStickerFileIds;

  /// [width] Photo width 
  int? width;

  /// [height] Photo height 
  int? height;

  /// [caption] Photo caption; pass null to use an empty caption; 0-GetOption("message_caption_length_max") characters
  FormattedText? caption;

  /// [ttl] Photo TTL (Time To Live), in seconds (0-60). A non-zero TTL can be specified only in private chats
  int? ttl;

  /// Parse from a json
  InputMessagePhoto.fromJson(Map<String, dynamic> json)  {
    InputFile? pre_photo;
    try{
      pre_photo=InputFile.fromJson(json['photo'] ?? <String, dynamic>{});
   }catch(_){}
    photo = pre_photo;
    InputThumbnail? pre_thumbnail;
    try{
      pre_thumbnail=InputThumbnail.fromJson(json['thumbnail'] ?? <String, dynamic>{});
   }catch(_){}
    thumbnail = pre_thumbnail;
    List<int>? pre_addedStickerFileIds;
    try{
      pre_addedStickerFileIds=List<int>.from((json['added_sticker_file_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    addedStickerFileIds = pre_addedStickerFileIds;
    int? pre_width;
    try{
      pre_width=json['width'];
   }catch(_){}
    width = pre_width;
    int? pre_height;
    try{
      pre_height=json['height'];
   }catch(_){}
    height = pre_height;
    FormattedText? pre_caption;
    try{
      pre_caption=FormattedText.fromJson(json['caption'] ?? <String, dynamic>{});
   }catch(_){}
    caption = pre_caption;
    int? pre_ttl;
    try{
      pre_ttl=json['ttl'];
   }catch(_){}
    ttl = pre_ttl;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "photo": photo == null ? null : photo?.toJson(),
      "thumbnail": thumbnail == null ? null : thumbnail?.toJson(),
      "added_sticker_file_ids": addedStickerFileIds?.map((i) => i).toList(),
      "width": width,
      "height": height,
      "caption": caption == null ? null : caption?.toJson(),
      "ttl": ttl,
    };
  }

  static const CONSTRUCTOR = 'inputMessagePhoto';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputMessageSticker extends InputMessageContent {

  /// A sticker message
  InputMessageSticker({this.sticker,
    this.thumbnail,
    this.width,
    this.height,
    this.emoji});

  /// [sticker] Sticker to be sent 
  InputFile? sticker;

  /// [thumbnail] Sticker thumbnail; pass null to skip thumbnail uploading 
  InputThumbnail? thumbnail;

  /// [width] Sticker width 
  int? width;

  /// [height] Sticker height 
  int? height;

  /// [emoji] Emoji used to choose the sticker
  String? emoji;

  /// Parse from a json
  InputMessageSticker.fromJson(Map<String, dynamic> json)  {
    InputFile? pre_sticker;
    try{
      pre_sticker=InputFile.fromJson(json['sticker'] ?? <String, dynamic>{});
   }catch(_){}
    sticker = pre_sticker;
    InputThumbnail? pre_thumbnail;
    try{
      pre_thumbnail=InputThumbnail.fromJson(json['thumbnail'] ?? <String, dynamic>{});
   }catch(_){}
    thumbnail = pre_thumbnail;
    int? pre_width;
    try{
      pre_width=json['width'];
   }catch(_){}
    width = pre_width;
    int? pre_height;
    try{
      pre_height=json['height'];
   }catch(_){}
    height = pre_height;
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
      "sticker": sticker == null ? null : sticker?.toJson(),
      "thumbnail": thumbnail == null ? null : thumbnail?.toJson(),
      "width": width,
      "height": height,
      "emoji": emoji,
    };
  }

  static const CONSTRUCTOR = 'inputMessageSticker';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputMessageVideo extends InputMessageContent {

  /// A video message
  InputMessageVideo({this.video,
    this.thumbnail,
    this.addedStickerFileIds,
    this.duration,
    this.width,
    this.height,
    this.supportsStreaming,
    this.caption,
    this.ttl});

  /// [video] Video to be sent 
  InputFile? video;

  /// [thumbnail] Video thumbnail; pass null to skip thumbnail uploading 
  InputThumbnail? thumbnail;

  /// [addedStickerFileIds] File identifiers of the stickers added to the video, if applicable
  List<int>? addedStickerFileIds;

  /// [duration] Duration of the video, in seconds
  int? duration;

  /// [width] Video width 
  int? width;

  /// [height] Video height 
  int? height;

  /// [supportsStreaming] True, if the video is supposed to be streamed
  bool? supportsStreaming;

  /// [caption] Video caption; pass null to use an empty caption; 0-GetOption("message_caption_length_max") characters
  FormattedText? caption;

  /// [ttl] Video TTL (Time To Live), in seconds (0-60). A non-zero TTL can be specified only in private chats
  int? ttl;

  /// Parse from a json
  InputMessageVideo.fromJson(Map<String, dynamic> json)  {
    InputFile? pre_video;
    try{
      pre_video=InputFile.fromJson(json['video'] ?? <String, dynamic>{});
   }catch(_){}
    video = pre_video;
    InputThumbnail? pre_thumbnail;
    try{
      pre_thumbnail=InputThumbnail.fromJson(json['thumbnail'] ?? <String, dynamic>{});
   }catch(_){}
    thumbnail = pre_thumbnail;
    List<int>? pre_addedStickerFileIds;
    try{
      pre_addedStickerFileIds=List<int>.from((json['added_sticker_file_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    addedStickerFileIds = pre_addedStickerFileIds;
    int? pre_duration;
    try{
      pre_duration=json['duration'];
   }catch(_){}
    duration = pre_duration;
    int? pre_width;
    try{
      pre_width=json['width'];
   }catch(_){}
    width = pre_width;
    int? pre_height;
    try{
      pre_height=json['height'];
   }catch(_){}
    height = pre_height;
    bool? pre_supportsStreaming;
    try{
      pre_supportsStreaming=json['supports_streaming'];
   }catch(_){}
    supportsStreaming = pre_supportsStreaming;
    FormattedText? pre_caption;
    try{
      pre_caption=FormattedText.fromJson(json['caption'] ?? <String, dynamic>{});
   }catch(_){}
    caption = pre_caption;
    int? pre_ttl;
    try{
      pre_ttl=json['ttl'];
   }catch(_){}
    ttl = pre_ttl;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "video": video == null ? null : video?.toJson(),
      "thumbnail": thumbnail == null ? null : thumbnail?.toJson(),
      "added_sticker_file_ids": addedStickerFileIds?.map((i) => i).toList(),
      "duration": duration,
      "width": width,
      "height": height,
      "supports_streaming": supportsStreaming,
      "caption": caption == null ? null : caption?.toJson(),
      "ttl": ttl,
    };
  }

  static const CONSTRUCTOR = 'inputMessageVideo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputMessageVideoNote extends InputMessageContent {

  /// A video note message
  InputMessageVideoNote({this.videoNote,
    this.thumbnail,
    this.duration,
    this.length});

  /// [videoNote] Video note to be sent 
  InputFile? videoNote;

  /// [thumbnail] Video thumbnail; pass null to skip thumbnail uploading 
  InputThumbnail? thumbnail;

  /// [duration] Duration of the video, in seconds 
  int? duration;

  /// [length] Video width and height; must be positive and not greater than 640
  int? length;

  /// Parse from a json
  InputMessageVideoNote.fromJson(Map<String, dynamic> json)  {
    InputFile? pre_videoNote;
    try{
      pre_videoNote=InputFile.fromJson(json['video_note'] ?? <String, dynamic>{});
   }catch(_){}
    videoNote = pre_videoNote;
    InputThumbnail? pre_thumbnail;
    try{
      pre_thumbnail=InputThumbnail.fromJson(json['thumbnail'] ?? <String, dynamic>{});
   }catch(_){}
    thumbnail = pre_thumbnail;
    int? pre_duration;
    try{
      pre_duration=json['duration'];
   }catch(_){}
    duration = pre_duration;
    int? pre_length;
    try{
      pre_length=json['length'];
   }catch(_){}
    length = pre_length;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "video_note": videoNote == null ? null : videoNote?.toJson(),
      "thumbnail": thumbnail == null ? null : thumbnail?.toJson(),
      "duration": duration,
      "length": length,
    };
  }

  static const CONSTRUCTOR = 'inputMessageVideoNote';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputMessageVoiceNote extends InputMessageContent {

  /// A voice note message
  InputMessageVoiceNote({this.voiceNote,
    this.duration,
    this.waveform,
    this.caption});

  /// [voiceNote] Voice note to be sent 
  InputFile? voiceNote;

  /// [duration] Duration of the voice note, in seconds 
  int? duration;

  /// [waveform] Waveform representation of the voice note, in 5-bit format 
  String? waveform;

  /// [caption] Voice note caption; pass null to use an empty caption; 0-GetOption("message_caption_length_max") characters
  FormattedText? caption;

  /// Parse from a json
  InputMessageVoiceNote.fromJson(Map<String, dynamic> json)  {
    InputFile? pre_voiceNote;
    try{
      pre_voiceNote=InputFile.fromJson(json['voice_note'] ?? <String, dynamic>{});
   }catch(_){}
    voiceNote = pre_voiceNote;
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
    FormattedText? pre_caption;
    try{
      pre_caption=FormattedText.fromJson(json['caption'] ?? <String, dynamic>{});
   }catch(_){}
    caption = pre_caption;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "voice_note": voiceNote == null ? null : voiceNote?.toJson(),
      "duration": duration,
      "waveform": waveform,
      "caption": caption == null ? null : caption?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputMessageVoiceNote';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputMessageLocation extends InputMessageContent {

  /// A message with a location
  InputMessageLocation({this.location,
    this.livePeriod,
    this.heading,
    this.proximityAlertRadius});

  /// [location] Location to be sent 
  Location? location;

  /// [livePeriod] Period for which the location can be updated, in seconds; must be between 60 and 86400 for a live location and 0 otherwise
  int? livePeriod;

  /// [heading] For live locations, a direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
  int? heading;

  /// [proximityAlertRadius] For live locations, a maximum distance to another chat member for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled. Can't be enabled in channels and Saved Messages
  int? proximityAlertRadius;

  /// Parse from a json
  InputMessageLocation.fromJson(Map<String, dynamic> json)  {
    Location? pre_location;
    try{
      pre_location=Location.fromJson(json['location'] ?? <String, dynamic>{});
   }catch(_){}
    location = pre_location;
    int? pre_livePeriod;
    try{
      pre_livePeriod=json['live_period'];
   }catch(_){}
    livePeriod = pre_livePeriod;
    int? pre_heading;
    try{
      pre_heading=json['heading'];
   }catch(_){}
    heading = pre_heading;
    int? pre_proximityAlertRadius;
    try{
      pre_proximityAlertRadius=json['proximity_alert_radius'];
   }catch(_){}
    proximityAlertRadius = pre_proximityAlertRadius;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "location": location == null ? null : location?.toJson(),
      "live_period": livePeriod,
      "heading": heading,
      "proximity_alert_radius": proximityAlertRadius,
    };
  }

  static const CONSTRUCTOR = 'inputMessageLocation';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputMessageVenue extends InputMessageContent {

  /// A message with information about a venue
  InputMessageVenue({this.venue});

  /// [venue] Venue to send
  Venue? venue;

  /// Parse from a json
  InputMessageVenue.fromJson(Map<String, dynamic> json)  {
    Venue? pre_venue;
    try{
      pre_venue=Venue.fromJson(json['venue'] ?? <String, dynamic>{});
   }catch(_){}
    venue = pre_venue;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "venue": venue == null ? null : venue?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputMessageVenue';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputMessageContact extends InputMessageContent {

  /// A message containing a user contact
  InputMessageContact({this.contact});

  /// [contact] Contact to send
  Contact? contact;

  /// Parse from a json
  InputMessageContact.fromJson(Map<String, dynamic> json)  {
    Contact? pre_contact;
    try{
      pre_contact=Contact.fromJson(json['contact'] ?? <String, dynamic>{});
   }catch(_){}
    contact = pre_contact;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "contact": contact == null ? null : contact?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputMessageContact';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputMessageDice extends InputMessageContent {

  /// A dice message
  InputMessageDice({this.emoji,
    this.clearDraft});

  /// [emoji] Emoji on which the dice throw animation is based 
  String? emoji;

  /// [clearDraft] True, if the chat message draft must be deleted
  bool? clearDraft;

  /// Parse from a json
  InputMessageDice.fromJson(Map<String, dynamic> json)  {
    String? pre_emoji;
    try{
      pre_emoji=json['emoji'];
   }catch(_){}
    emoji = pre_emoji;
    bool? pre_clearDraft;
    try{
      pre_clearDraft=json['clear_draft'];
   }catch(_){}
    clearDraft = pre_clearDraft;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "emoji": emoji,
      "clear_draft": clearDraft,
    };
  }

  static const CONSTRUCTOR = 'inputMessageDice';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputMessageGame extends InputMessageContent {

  /// A message with a game; not supported for channels or secret chats
  InputMessageGame({this.botUserId,
    this.gameShortName});

  /// [botUserId] User identifier of the bot that owns the game 
  int? botUserId;

  /// [gameShortName] Short name of the game
  String? gameShortName;

  /// Parse from a json
  InputMessageGame.fromJson(Map<String, dynamic> json)  {
    int? pre_botUserId;
    try{
      pre_botUserId=json['bot_user_id'];
   }catch(_){}
    botUserId = pre_botUserId;
    String? pre_gameShortName;
    try{
      pre_gameShortName=json['game_short_name'];
   }catch(_){}
    gameShortName = pre_gameShortName;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "bot_user_id": botUserId,
      "game_short_name": gameShortName,
    };
  }

  static const CONSTRUCTOR = 'inputMessageGame';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputMessageInvoice extends InputMessageContent {

  /// A message with an invoice; can be used only by bots
  InputMessageInvoice({this.invoice,
    this.title,
    this.description,
    this.photoUrl,
    this.photoSize,
    this.photoWidth,
    this.photoHeight,
    this.payload,
    this.providerToken,
    this.providerData,
    this.startParameter});

  /// [invoice] Invoice 
  Invoice? invoice;

  /// [title] Product title; 1-32 characters 
  String? title;

  /// [description] Product description; 0-255 characters
  String? description;

  /// [photoUrl] Product photo URL; optional
  String? photoUrl;

  /// [photoSize] Product photo size 
  int? photoSize;

  /// [photoWidth] Product photo width 
  int? photoWidth;

  /// [photoHeight] Product photo height
  int? photoHeight;

  /// [payload] The invoice payload
  String? payload;

  /// [providerToken] Payment provider token 
  String? providerToken;

  /// [providerData] JSON-encoded data about the invoice, which will be shared with the payment provider
  String? providerData;

  /// [startParameter] Unique invoice bot deep link parameter for the generation of this invoice. If empty, it would be possible to pay directly from forwards of the invoice message
  String? startParameter;

  /// Parse from a json
  InputMessageInvoice.fromJson(Map<String, dynamic> json)  {
    Invoice? pre_invoice;
    try{
      pre_invoice=Invoice.fromJson(json['invoice'] ?? <String, dynamic>{});
   }catch(_){}
    invoice = pre_invoice;
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
    String? pre_description;
    try{
      pre_description=json['description'];
   }catch(_){}
    description = pre_description;
    String? pre_photoUrl;
    try{
      pre_photoUrl=json['photo_url'];
   }catch(_){}
    photoUrl = pre_photoUrl;
    int? pre_photoSize;
    try{
      pre_photoSize=json['photo_size'];
   }catch(_){}
    photoSize = pre_photoSize;
    int? pre_photoWidth;
    try{
      pre_photoWidth=json['photo_width'];
   }catch(_){}
    photoWidth = pre_photoWidth;
    int? pre_photoHeight;
    try{
      pre_photoHeight=json['photo_height'];
   }catch(_){}
    photoHeight = pre_photoHeight;
    String? pre_payload;
    try{
      pre_payload=json['payload'];
   }catch(_){}
    payload = pre_payload;
    String? pre_providerToken;
    try{
      pre_providerToken=json['provider_token'];
   }catch(_){}
    providerToken = pre_providerToken;
    String? pre_providerData;
    try{
      pre_providerData=json['provider_data'];
   }catch(_){}
    providerData = pre_providerData;
    String? pre_startParameter;
    try{
      pre_startParameter=json['start_parameter'];
   }catch(_){}
    startParameter = pre_startParameter;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "invoice": invoice == null ? null : invoice?.toJson(),
      "title": title,
      "description": description,
      "photo_url": photoUrl,
      "photo_size": photoSize,
      "photo_width": photoWidth,
      "photo_height": photoHeight,
      "payload": payload,
      "provider_token": providerToken,
      "provider_data": providerData,
      "start_parameter": startParameter,
    };
  }

  static const CONSTRUCTOR = 'inputMessageInvoice';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputMessagePoll extends InputMessageContent {

  /// A message with a poll. Polls can't be sent to secret chats. Polls can be sent only to a private chat with a bot
  InputMessagePoll({this.question,
    this.options,
    this.isAnonymous,
    this.type,
    this.openPeriod,
    this.closeDate,
    this.isClosed});

  /// [question] Poll question; 1-255 characters (up to 300 characters for bots) 
  String? question;

  /// [options] List of poll answer options, 2-10 strings 1-100 characters each
  List<String>? options;

  /// [isAnonymous] True, if the poll voters are anonymous. Non-anonymous polls can't be sent or forwarded to channels
  bool? isAnonymous;

  /// [type] Type of the poll
  PollType? type;

  /// [openPeriod] Amount of time the poll will be active after creation, in seconds; for bots only
  int? openPeriod;

  /// [closeDate] Point in time (Unix timestamp) when the poll will be automatically closed; for bots only
  int? closeDate;

  /// [isClosed] True, if the poll needs to be sent already closed; for bots only
  bool? isClosed;

  /// Parse from a json
  InputMessagePoll.fromJson(Map<String, dynamic> json)  {
    String? pre_question;
    try{
      pre_question=json['question'];
   }catch(_){}
    question = pre_question;
    List<String>? pre_options;
    try{
      pre_options=List<String>.from((json['options'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    options = pre_options;
    bool? pre_isAnonymous;
    try{
      pre_isAnonymous=json['is_anonymous'];
   }catch(_){}
    isAnonymous = pre_isAnonymous;
    PollType? pre_type;
    try{
      pre_type=PollType.fromJson(json['type'] ?? <String, dynamic>{});
   }catch(_){}
    type = pre_type;
    int? pre_openPeriod;
    try{
      pre_openPeriod=json['open_period'];
   }catch(_){}
    openPeriod = pre_openPeriod;
    int? pre_closeDate;
    try{
      pre_closeDate=json['close_date'];
   }catch(_){}
    closeDate = pre_closeDate;
    bool? pre_isClosed;
    try{
      pre_isClosed=json['is_closed'];
   }catch(_){}
    isClosed = pre_isClosed;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "question": question,
      "options": options?.map((i) => i).toList(),
      "is_anonymous": isAnonymous,
      "type": type == null ? null : type?.toJson(),
      "open_period": openPeriod,
      "close_date": closeDate,
      "is_closed": isClosed,
    };
  }

  static const CONSTRUCTOR = 'inputMessagePoll';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputMessageForwarded extends InputMessageContent {

  /// A forwarded message
  InputMessageForwarded({this.fromChatId,
    this.messageId,
    this.inGameShare,
    this.copyOptions});

  /// [fromChatId] Identifier for the chat this forwarded message came from 
  int? fromChatId;

  /// [messageId] Identifier of the message to forward
  int? messageId;

  /// [inGameShare] True, if a game message is being shared from a launched game; applies only to game messages
  bool? inGameShare;

  /// [copyOptions] Options to be used to copy content of the message without reference to the original sender; pass null to try to forward the message as usual
  MessageCopyOptions? copyOptions;

  /// Parse from a json
  InputMessageForwarded.fromJson(Map<String, dynamic> json)  {
    int? pre_fromChatId;
    try{
      pre_fromChatId=json['from_chat_id'];
   }catch(_){}
    fromChatId = pre_fromChatId;
    int? pre_messageId;
    try{
      pre_messageId=json['message_id'];
   }catch(_){}
    messageId = pre_messageId;
    bool? pre_inGameShare;
    try{
      pre_inGameShare=json['in_game_share'];
   }catch(_){}
    inGameShare = pre_inGameShare;
    MessageCopyOptions? pre_copyOptions;
    try{
      pre_copyOptions=MessageCopyOptions.fromJson(json['copy_options'] ?? <String, dynamic>{});
   }catch(_){}
    copyOptions = pre_copyOptions;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "from_chat_id": fromChatId,
      "message_id": messageId,
      "in_game_share": inGameShare,
      "copy_options": copyOptions == null ? null : copyOptions?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputMessageForwarded';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}