part of '../tdapi.dart';

class InputInlineQueryResult extends TdObject {

  /// Represents a single result of an inline query; for bots only
  InputInlineQueryResult();

  

  /// a InputInlineQueryResult return type can be :
  /// * InputInlineQueryResultAnimation
  /// * InputInlineQueryResultArticle
  /// * InputInlineQueryResultAudio
  /// * InputInlineQueryResultContact
  /// * InputInlineQueryResultDocument
  /// * InputInlineQueryResultGame
  /// * InputInlineQueryResultLocation
  /// * InputInlineQueryResultPhoto
  /// * InputInlineQueryResultSticker
  /// * InputInlineQueryResultVenue
  /// * InputInlineQueryResultVideo
  /// * InputInlineQueryResultVoiceNote
  factory InputInlineQueryResult.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case InputInlineQueryResultAnimation.CONSTRUCTOR:
        return InputInlineQueryResultAnimation.fromJson(json);
      case InputInlineQueryResultArticle.CONSTRUCTOR:
        return InputInlineQueryResultArticle.fromJson(json);
      case InputInlineQueryResultAudio.CONSTRUCTOR:
        return InputInlineQueryResultAudio.fromJson(json);
      case InputInlineQueryResultContact.CONSTRUCTOR:
        return InputInlineQueryResultContact.fromJson(json);
      case InputInlineQueryResultDocument.CONSTRUCTOR:
        return InputInlineQueryResultDocument.fromJson(json);
      case InputInlineQueryResultGame.CONSTRUCTOR:
        return InputInlineQueryResultGame.fromJson(json);
      case InputInlineQueryResultLocation.CONSTRUCTOR:
        return InputInlineQueryResultLocation.fromJson(json);
      case InputInlineQueryResultPhoto.CONSTRUCTOR:
        return InputInlineQueryResultPhoto.fromJson(json);
      case InputInlineQueryResultSticker.CONSTRUCTOR:
        return InputInlineQueryResultSticker.fromJson(json);
      case InputInlineQueryResultVenue.CONSTRUCTOR:
        return InputInlineQueryResultVenue.fromJson(json);
      case InputInlineQueryResultVideo.CONSTRUCTOR:
        return InputInlineQueryResultVideo.fromJson(json);
      case InputInlineQueryResultVoiceNote.CONSTRUCTOR:
        return InputInlineQueryResultVoiceNote.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'inputInlineQueryResult';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputInlineQueryResultAnimation extends InputInlineQueryResult {

  /// Represents a link to an animated GIF or an animated (i.e., without sound) H.264/MPEG-4 AVC video
  InputInlineQueryResultAnimation({this.id,
    this.title,
    this.thumbnailUrl,
    this.thumbnailMimeType,
    this.videoUrl,
    this.videoMimeType,
    this.videoDuration,
    this.videoWidth,
    this.videoHeight,
    this.replyMarkup,
    this.inputMessageContent});

  /// [id] Unique identifier of the query result
  String? id;

  /// [title] Title of the query result
  String? title;

  /// [thumbnailUrl] URL of the result thumbnail (JPEG, GIF, or MPEG4), if it exists
  String? thumbnailUrl;

  /// [thumbnailMimeType] MIME type of the video thumbnail. If non-empty, must be one of "image/jpeg", "image/gif" and "video/mp4"
  String? thumbnailMimeType;

  /// [videoUrl] The URL of the video file (file size must not exceed 1MB)
  String? videoUrl;

  /// [videoMimeType] MIME type of the video file. Must be one of "image/gif" and "video/mp4"
  String? videoMimeType;

  /// [videoDuration] Duration of the video, in seconds
  int? videoDuration;

  /// [videoWidth] Width of the video 
  int? videoWidth;

  /// [videoHeight] Height of the video
  int? videoHeight;

  /// [replyMarkup] The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
  ReplyMarkup? replyMarkup;

  /// [inputMessageContent] The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAnimation, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
  InputMessageContent? inputMessageContent;

  /// Parse from a json
  InputInlineQueryResultAnimation.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : json['id'];
    title = json['title'] == null ? null : json['title'];
    thumbnailUrl = json['thumbnail_url'] == null ? null : json['thumbnail_url'];
    thumbnailMimeType = json['thumbnail_mime_type'] == null ? null : json['thumbnail_mime_type'];
    videoUrl = json['video_url'] == null ? null : json['video_url'];
    videoMimeType = json['video_mime_type'] == null ? null : json['video_mime_type'];
    videoDuration = json['video_duration'] == null ? null : json['video_duration'];
    videoWidth = json['video_width'] == null ? null : json['video_width'];
    videoHeight = json['video_height'] == null ? null : json['video_height'];
    replyMarkup = json['reply_markup'] == null ? null : ReplyMarkup.fromJson(json['reply_markup'] ?? <String, dynamic>{});
    inputMessageContent = json['input_message_content'] == null ? null : InputMessageContent.fromJson(json['input_message_content'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "title": title,
      "thumbnail_url": thumbnailUrl,
      "thumbnail_mime_type": thumbnailMimeType,
      "video_url": videoUrl,
      "video_mime_type": videoMimeType,
      "video_duration": videoDuration,
      "video_width": videoWidth,
      "video_height": videoHeight,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
      "input_message_content": inputMessageContent == null ? null : inputMessageContent?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputInlineQueryResultAnimation';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputInlineQueryResultArticle extends InputInlineQueryResult {

  /// Represents a link to an article or web page
  InputInlineQueryResultArticle({this.id,
    this.url,
    this.hideUrl,
    this.title,
    this.description,
    this.thumbnailUrl,
    this.thumbnailWidth,
    this.thumbnailHeight,
    this.replyMarkup,
    this.inputMessageContent});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [url] URL of the result, if it exists 
  String? url;

  /// [hideUrl] True, if the URL must be not shown 
  bool? hideUrl;

  /// [title] Title of the result
  String? title;

  /// [description] A short description of the result
  String? description;

  /// [thumbnailUrl] URL of the result thumbnail, if it exists 
  String? thumbnailUrl;

  /// [thumbnailWidth] Thumbnail width, if known 
  int? thumbnailWidth;

  /// [thumbnailHeight] Thumbnail height, if known
  int? thumbnailHeight;

  /// [replyMarkup] The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
  ReplyMarkup? replyMarkup;

  /// [inputMessageContent] The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
  InputMessageContent? inputMessageContent;

  /// Parse from a json
  InputInlineQueryResultArticle.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : json['id'];
    url = json['url'] == null ? null : json['url'];
    hideUrl = json['hide_url'] == null ? null : json['hide_url'];
    title = json['title'] == null ? null : json['title'];
    description = json['description'] == null ? null : json['description'];
    thumbnailUrl = json['thumbnail_url'] == null ? null : json['thumbnail_url'];
    thumbnailWidth = json['thumbnail_width'] == null ? null : json['thumbnail_width'];
    thumbnailHeight = json['thumbnail_height'] == null ? null : json['thumbnail_height'];
    replyMarkup = json['reply_markup'] == null ? null : ReplyMarkup.fromJson(json['reply_markup'] ?? <String, dynamic>{});
    inputMessageContent = json['input_message_content'] == null ? null : InputMessageContent.fromJson(json['input_message_content'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "url": url,
      "hide_url": hideUrl,
      "title": title,
      "description": description,
      "thumbnail_url": thumbnailUrl,
      "thumbnail_width": thumbnailWidth,
      "thumbnail_height": thumbnailHeight,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
      "input_message_content": inputMessageContent == null ? null : inputMessageContent?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputInlineQueryResultArticle';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputInlineQueryResultAudio extends InputInlineQueryResult {

  /// Represents a link to an MP3 audio file
  InputInlineQueryResultAudio({this.id,
    this.title,
    this.performer,
    this.audioUrl,
    this.audioDuration,
    this.replyMarkup,
    this.inputMessageContent});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [title] Title of the audio file 
  String? title;

  /// [performer] Performer of the audio file
  String? performer;

  /// [audioUrl] The URL of the audio file
  String? audioUrl;

  /// [audioDuration] Audio file duration, in seconds
  int? audioDuration;

  /// [replyMarkup] The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
  ReplyMarkup? replyMarkup;

  /// [inputMessageContent] The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAudio, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
  InputMessageContent? inputMessageContent;

  /// Parse from a json
  InputInlineQueryResultAudio.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : json['id'];
    title = json['title'] == null ? null : json['title'];
    performer = json['performer'] == null ? null : json['performer'];
    audioUrl = json['audio_url'] == null ? null : json['audio_url'];
    audioDuration = json['audio_duration'] == null ? null : json['audio_duration'];
    replyMarkup = json['reply_markup'] == null ? null : ReplyMarkup.fromJson(json['reply_markup'] ?? <String, dynamic>{});
    inputMessageContent = json['input_message_content'] == null ? null : InputMessageContent.fromJson(json['input_message_content'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "title": title,
      "performer": performer,
      "audio_url": audioUrl,
      "audio_duration": audioDuration,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
      "input_message_content": inputMessageContent == null ? null : inputMessageContent?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputInlineQueryResultAudio';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputInlineQueryResultContact extends InputInlineQueryResult {

  /// Represents a user contact
  InputInlineQueryResultContact({this.id,
    this.contact,
    this.thumbnailUrl,
    this.thumbnailWidth,
    this.thumbnailHeight,
    this.replyMarkup,
    this.inputMessageContent});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [contact] User contact 
  Contact? contact;

  /// [thumbnailUrl] URL of the result thumbnail, if it exists 
  String? thumbnailUrl;

  /// [thumbnailWidth] Thumbnail width, if known 
  int? thumbnailWidth;

  /// [thumbnailHeight] Thumbnail height, if known
  int? thumbnailHeight;

  /// [replyMarkup] The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
  ReplyMarkup? replyMarkup;

  /// [inputMessageContent] The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
  InputMessageContent? inputMessageContent;

  /// Parse from a json
  InputInlineQueryResultContact.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : json['id'];
    contact = json['contact'] == null ? null : Contact.fromJson(json['contact'] ?? <String, dynamic>{});
    thumbnailUrl = json['thumbnail_url'] == null ? null : json['thumbnail_url'];
    thumbnailWidth = json['thumbnail_width'] == null ? null : json['thumbnail_width'];
    thumbnailHeight = json['thumbnail_height'] == null ? null : json['thumbnail_height'];
    replyMarkup = json['reply_markup'] == null ? null : ReplyMarkup.fromJson(json['reply_markup'] ?? <String, dynamic>{});
    inputMessageContent = json['input_message_content'] == null ? null : InputMessageContent.fromJson(json['input_message_content'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "contact": contact == null ? null : contact?.toJson(),
      "thumbnail_url": thumbnailUrl,
      "thumbnail_width": thumbnailWidth,
      "thumbnail_height": thumbnailHeight,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
      "input_message_content": inputMessageContent == null ? null : inputMessageContent?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputInlineQueryResultContact';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputInlineQueryResultDocument extends InputInlineQueryResult {

  /// Represents a link to a file
  InputInlineQueryResultDocument({this.id,
    this.title,
    this.description,
    this.documentUrl,
    this.mimeType,
    this.thumbnailUrl,
    this.thumbnailWidth,
    this.thumbnailHeight,
    this.replyMarkup,
    this.inputMessageContent});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [title] Title of the resulting file 
  String? title;

  /// [description] Short description of the result, if known 
  String? description;

  /// [documentUrl] URL of the file 
  String? documentUrl;

  /// [mimeType] MIME type of the file content; only "application/pdf" and "application/zip" are currently allowed
  String? mimeType;

  /// [thumbnailUrl] The URL of the file thumbnail, if it exists
  String? thumbnailUrl;

  /// [thumbnailWidth] Width of the thumbnail 
  int? thumbnailWidth;

  /// [thumbnailHeight] Height of the thumbnail
  int? thumbnailHeight;

  /// [replyMarkup] The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
  ReplyMarkup? replyMarkup;

  /// [inputMessageContent] The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageDocument, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
  InputMessageContent? inputMessageContent;

  /// Parse from a json
  InputInlineQueryResultDocument.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : json['id'];
    title = json['title'] == null ? null : json['title'];
    description = json['description'] == null ? null : json['description'];
    documentUrl = json['document_url'] == null ? null : json['document_url'];
    mimeType = json['mime_type'] == null ? null : json['mime_type'];
    thumbnailUrl = json['thumbnail_url'] == null ? null : json['thumbnail_url'];
    thumbnailWidth = json['thumbnail_width'] == null ? null : json['thumbnail_width'];
    thumbnailHeight = json['thumbnail_height'] == null ? null : json['thumbnail_height'];
    replyMarkup = json['reply_markup'] == null ? null : ReplyMarkup.fromJson(json['reply_markup'] ?? <String, dynamic>{});
    inputMessageContent = json['input_message_content'] == null ? null : InputMessageContent.fromJson(json['input_message_content'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "title": title,
      "description": description,
      "document_url": documentUrl,
      "mime_type": mimeType,
      "thumbnail_url": thumbnailUrl,
      "thumbnail_width": thumbnailWidth,
      "thumbnail_height": thumbnailHeight,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
      "input_message_content": inputMessageContent == null ? null : inputMessageContent?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputInlineQueryResultDocument';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputInlineQueryResultGame extends InputInlineQueryResult {

  /// Represents a game
  InputInlineQueryResultGame({this.id,
    this.gameShortName,
    this.replyMarkup});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [gameShortName] Short name of the game 
  String? gameShortName;

  /// [replyMarkup] The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
  ReplyMarkup? replyMarkup;

  /// Parse from a json
  InputInlineQueryResultGame.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : json['id'];
    gameShortName = json['game_short_name'] == null ? null : json['game_short_name'];
    replyMarkup = json['reply_markup'] == null ? null : ReplyMarkup.fromJson(json['reply_markup'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "game_short_name": gameShortName,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputInlineQueryResultGame';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputInlineQueryResultLocation extends InputInlineQueryResult {

  /// Represents a point on the map
  InputInlineQueryResultLocation({this.id,
    this.location,
    this.livePeriod,
    this.title,
    this.thumbnailUrl,
    this.thumbnailWidth,
    this.thumbnailHeight,
    this.replyMarkup,
    this.inputMessageContent});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [location] Location result
  Location? location;

  /// [livePeriod] Amount of time relative to the message sent time until the location can be updated, in seconds
  int? livePeriod;

  /// [title] Title of the result
  String? title;

  /// [thumbnailUrl] URL of the result thumbnail, if it exists 
  String? thumbnailUrl;

  /// [thumbnailWidth] Thumbnail width, if known 
  int? thumbnailWidth;

  /// [thumbnailHeight] Thumbnail height, if known
  int? thumbnailHeight;

  /// [replyMarkup] The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
  ReplyMarkup? replyMarkup;

  /// [inputMessageContent] The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
  InputMessageContent? inputMessageContent;

  /// Parse from a json
  InputInlineQueryResultLocation.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : json['id'];
    location = json['location'] == null ? null : Location.fromJson(json['location'] ?? <String, dynamic>{});
    livePeriod = json['live_period'] == null ? null : json['live_period'];
    title = json['title'] == null ? null : json['title'];
    thumbnailUrl = json['thumbnail_url'] == null ? null : json['thumbnail_url'];
    thumbnailWidth = json['thumbnail_width'] == null ? null : json['thumbnail_width'];
    thumbnailHeight = json['thumbnail_height'] == null ? null : json['thumbnail_height'];
    replyMarkup = json['reply_markup'] == null ? null : ReplyMarkup.fromJson(json['reply_markup'] ?? <String, dynamic>{});
    inputMessageContent = json['input_message_content'] == null ? null : InputMessageContent.fromJson(json['input_message_content'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "location": location == null ? null : location?.toJson(),
      "live_period": livePeriod,
      "title": title,
      "thumbnail_url": thumbnailUrl,
      "thumbnail_width": thumbnailWidth,
      "thumbnail_height": thumbnailHeight,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
      "input_message_content": inputMessageContent == null ? null : inputMessageContent?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputInlineQueryResultLocation';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputInlineQueryResultPhoto extends InputInlineQueryResult {

  /// Represents link to a JPEG image
  InputInlineQueryResultPhoto({this.id,
    this.title,
    this.description,
    this.thumbnailUrl,
    this.photoUrl,
    this.photoWidth,
    this.photoHeight,
    this.replyMarkup,
    this.inputMessageContent});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [title] Title of the result, if known 
  String? title;

  /// [description] A short description of the result, if known 
  String? description;

  /// [thumbnailUrl] URL of the photo thumbnail, if it exists
  String? thumbnailUrl;

  /// [photoUrl] The URL of the JPEG photo (photo size must not exceed 5MB)
  String? photoUrl;

  /// [photoWidth] Width of the photo 
  int? photoWidth;

  /// [photoHeight] Height of the photo
  int? photoHeight;

  /// [replyMarkup] The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
  ReplyMarkup? replyMarkup;

  /// [inputMessageContent] The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessagePhoto, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
  InputMessageContent? inputMessageContent;

  /// Parse from a json
  InputInlineQueryResultPhoto.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : json['id'];
    title = json['title'] == null ? null : json['title'];
    description = json['description'] == null ? null : json['description'];
    thumbnailUrl = json['thumbnail_url'] == null ? null : json['thumbnail_url'];
    photoUrl = json['photo_url'] == null ? null : json['photo_url'];
    photoWidth = json['photo_width'] == null ? null : json['photo_width'];
    photoHeight = json['photo_height'] == null ? null : json['photo_height'];
    replyMarkup = json['reply_markup'] == null ? null : ReplyMarkup.fromJson(json['reply_markup'] ?? <String, dynamic>{});
    inputMessageContent = json['input_message_content'] == null ? null : InputMessageContent.fromJson(json['input_message_content'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "title": title,
      "description": description,
      "thumbnail_url": thumbnailUrl,
      "photo_url": photoUrl,
      "photo_width": photoWidth,
      "photo_height": photoHeight,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
      "input_message_content": inputMessageContent == null ? null : inputMessageContent?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputInlineQueryResultPhoto';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputInlineQueryResultSticker extends InputInlineQueryResult {

  /// Represents a link to a WEBP or TGS sticker
  InputInlineQueryResultSticker({this.id,
    this.thumbnailUrl,
    this.stickerUrl,
    this.stickerWidth,
    this.stickerHeight,
    this.replyMarkup,
    this.inputMessageContent});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [thumbnailUrl] URL of the sticker thumbnail, if it exists
  String? thumbnailUrl;

  /// [stickerUrl] The URL of the WEBP or TGS sticker (sticker file size must not exceed 5MB)
  String? stickerUrl;

  /// [stickerWidth] Width of the sticker 
  int? stickerWidth;

  /// [stickerHeight] Height of the sticker
  int? stickerHeight;

  /// [replyMarkup] The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
  ReplyMarkup? replyMarkup;

  /// [inputMessageContent] The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageSticker, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
  InputMessageContent? inputMessageContent;

  /// Parse from a json
  InputInlineQueryResultSticker.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : json['id'];
    thumbnailUrl = json['thumbnail_url'] == null ? null : json['thumbnail_url'];
    stickerUrl = json['sticker_url'] == null ? null : json['sticker_url'];
    stickerWidth = json['sticker_width'] == null ? null : json['sticker_width'];
    stickerHeight = json['sticker_height'] == null ? null : json['sticker_height'];
    replyMarkup = json['reply_markup'] == null ? null : ReplyMarkup.fromJson(json['reply_markup'] ?? <String, dynamic>{});
    inputMessageContent = json['input_message_content'] == null ? null : InputMessageContent.fromJson(json['input_message_content'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "thumbnail_url": thumbnailUrl,
      "sticker_url": stickerUrl,
      "sticker_width": stickerWidth,
      "sticker_height": stickerHeight,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
      "input_message_content": inputMessageContent == null ? null : inputMessageContent?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputInlineQueryResultSticker';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputInlineQueryResultVenue extends InputInlineQueryResult {

  /// Represents information about a venue
  InputInlineQueryResultVenue({this.id,
    this.venue,
    this.thumbnailUrl,
    this.thumbnailWidth,
    this.thumbnailHeight,
    this.replyMarkup,
    this.inputMessageContent});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [venue] Venue result 
  Venue? venue;

  /// [thumbnailUrl] URL of the result thumbnail, if it exists 
  String? thumbnailUrl;

  /// [thumbnailWidth] Thumbnail width, if known 
  int? thumbnailWidth;

  /// [thumbnailHeight] Thumbnail height, if known
  int? thumbnailHeight;

  /// [replyMarkup] The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
  ReplyMarkup? replyMarkup;

  /// [inputMessageContent] The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
  InputMessageContent? inputMessageContent;

  /// Parse from a json
  InputInlineQueryResultVenue.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : json['id'];
    venue = json['venue'] == null ? null : Venue.fromJson(json['venue'] ?? <String, dynamic>{});
    thumbnailUrl = json['thumbnail_url'] == null ? null : json['thumbnail_url'];
    thumbnailWidth = json['thumbnail_width'] == null ? null : json['thumbnail_width'];
    thumbnailHeight = json['thumbnail_height'] == null ? null : json['thumbnail_height'];
    replyMarkup = json['reply_markup'] == null ? null : ReplyMarkup.fromJson(json['reply_markup'] ?? <String, dynamic>{});
    inputMessageContent = json['input_message_content'] == null ? null : InputMessageContent.fromJson(json['input_message_content'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "venue": venue == null ? null : venue?.toJson(),
      "thumbnail_url": thumbnailUrl,
      "thumbnail_width": thumbnailWidth,
      "thumbnail_height": thumbnailHeight,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
      "input_message_content": inputMessageContent == null ? null : inputMessageContent?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputInlineQueryResultVenue';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputInlineQueryResultVideo extends InputInlineQueryResult {

  /// Represents a link to a page containing an embedded video player or a video file
  InputInlineQueryResultVideo({this.id,
    this.title,
    this.description,
    this.thumbnailUrl,
    this.videoUrl,
    this.mimeType,
    this.videoWidth,
    this.videoHeight,
    this.videoDuration,
    this.replyMarkup,
    this.inputMessageContent});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [title] Title of the result 
  String? title;

  /// [description] A short description of the result, if known
  String? description;

  /// [thumbnailUrl] The URL of the video thumbnail (JPEG), if it exists
  String? thumbnailUrl;

  /// [videoUrl] URL of the embedded video player or video file 
  String? videoUrl;

  /// [mimeType] MIME type of the content of the video URL, only "text/html" or "video/mp4" are currently supported
  String? mimeType;

  /// [videoWidth] Width of the video
  int? videoWidth;

  /// [videoHeight] Height of the video 
  int? videoHeight;

  /// [videoDuration] Video duration, in seconds
  int? videoDuration;

  /// [replyMarkup] The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
  ReplyMarkup? replyMarkup;

  /// [inputMessageContent] The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageVideo, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
  InputMessageContent? inputMessageContent;

  /// Parse from a json
  InputInlineQueryResultVideo.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : json['id'];
    title = json['title'] == null ? null : json['title'];
    description = json['description'] == null ? null : json['description'];
    thumbnailUrl = json['thumbnail_url'] == null ? null : json['thumbnail_url'];
    videoUrl = json['video_url'] == null ? null : json['video_url'];
    mimeType = json['mime_type'] == null ? null : json['mime_type'];
    videoWidth = json['video_width'] == null ? null : json['video_width'];
    videoHeight = json['video_height'] == null ? null : json['video_height'];
    videoDuration = json['video_duration'] == null ? null : json['video_duration'];
    replyMarkup = json['reply_markup'] == null ? null : ReplyMarkup.fromJson(json['reply_markup'] ?? <String, dynamic>{});
    inputMessageContent = json['input_message_content'] == null ? null : InputMessageContent.fromJson(json['input_message_content'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "title": title,
      "description": description,
      "thumbnail_url": thumbnailUrl,
      "video_url": videoUrl,
      "mime_type": mimeType,
      "video_width": videoWidth,
      "video_height": videoHeight,
      "video_duration": videoDuration,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
      "input_message_content": inputMessageContent == null ? null : inputMessageContent?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputInlineQueryResultVideo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputInlineQueryResultVoiceNote extends InputInlineQueryResult {

  /// Represents a link to an opus-encoded audio file within an OGG container, single channel audio
  InputInlineQueryResultVoiceNote({this.id,
    this.title,
    this.voiceNoteUrl,
    this.voiceNoteDuration,
    this.replyMarkup,
    this.inputMessageContent});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [title] Title of the voice note
  String? title;

  /// [voiceNoteUrl] The URL of the voice note file
  String? voiceNoteUrl;

  /// [voiceNoteDuration] Duration of the voice note, in seconds
  int? voiceNoteDuration;

  /// [replyMarkup] The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
  ReplyMarkup? replyMarkup;

  /// [inputMessageContent] The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageVoiceNote, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
  InputMessageContent? inputMessageContent;

  /// Parse from a json
  InputInlineQueryResultVoiceNote.fromJson(Map<String, dynamic> json)  {
    id = json['id'] == null ? null : json['id'];
    title = json['title'] == null ? null : json['title'];
    voiceNoteUrl = json['voice_note_url'] == null ? null : json['voice_note_url'];
    voiceNoteDuration = json['voice_note_duration'] == null ? null : json['voice_note_duration'];
    replyMarkup = json['reply_markup'] == null ? null : ReplyMarkup.fromJson(json['reply_markup'] ?? <String, dynamic>{});
    inputMessageContent = json['input_message_content'] == null ? null : InputMessageContent.fromJson(json['input_message_content'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "title": title,
      "voice_note_url": voiceNoteUrl,
      "voice_note_duration": voiceNoteDuration,
      "reply_markup": replyMarkup == null ? null : replyMarkup?.toJson(),
      "input_message_content": inputMessageContent == null ? null : inputMessageContent?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputInlineQueryResultVoiceNote';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}