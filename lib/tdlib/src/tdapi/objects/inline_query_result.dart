part of '../tdapi.dart';

class InlineQueryResult extends TdObject {

  /// Represents a single result of an inline query
  InlineQueryResult();

  

  /// a InlineQueryResult return type can be :
  /// * InlineQueryResultArticle
  /// * InlineQueryResultContact
  /// * InlineQueryResultLocation
  /// * InlineQueryResultVenue
  /// * InlineQueryResultGame
  /// * InlineQueryResultAnimation
  /// * InlineQueryResultAudio
  /// * InlineQueryResultDocument
  /// * InlineQueryResultPhoto
  /// * InlineQueryResultSticker
  /// * InlineQueryResultVideo
  /// * InlineQueryResultVoiceNote
  factory InlineQueryResult.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case InlineQueryResultArticle.CONSTRUCTOR:
        return InlineQueryResultArticle.fromJson(json);
      case InlineQueryResultContact.CONSTRUCTOR:
        return InlineQueryResultContact.fromJson(json);
      case InlineQueryResultLocation.CONSTRUCTOR:
        return InlineQueryResultLocation.fromJson(json);
      case InlineQueryResultVenue.CONSTRUCTOR:
        return InlineQueryResultVenue.fromJson(json);
      case InlineQueryResultGame.CONSTRUCTOR:
        return InlineQueryResultGame.fromJson(json);
      case InlineQueryResultAnimation.CONSTRUCTOR:
        return InlineQueryResultAnimation.fromJson(json);
      case InlineQueryResultAudio.CONSTRUCTOR:
        return InlineQueryResultAudio.fromJson(json);
      case InlineQueryResultDocument.CONSTRUCTOR:
        return InlineQueryResultDocument.fromJson(json);
      case InlineQueryResultPhoto.CONSTRUCTOR:
        return InlineQueryResultPhoto.fromJson(json);
      case InlineQueryResultSticker.CONSTRUCTOR:
        return InlineQueryResultSticker.fromJson(json);
      case InlineQueryResultVideo.CONSTRUCTOR:
        return InlineQueryResultVideo.fromJson(json);
      case InlineQueryResultVoiceNote.CONSTRUCTOR:
        return InlineQueryResultVoiceNote.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'inlineQueryResult';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InlineQueryResultArticle extends InlineQueryResult {

  /// Represents a link to an article or web page
  InlineQueryResultArticle({this.id,
    this.url,
    this.hideUrl,
    this.title,
    this.description,
    this.thumbnail});

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

  /// [thumbnail] Result thumbnail in JPEG format; may be null
  Thumbnail? thumbnail;

  /// Parse from a json
  InlineQueryResultArticle.fromJson(Map<String, dynamic> json)  {
    id = json['id'];
    url = json['url'];
    hideUrl = json['hide_url'];
    title = json['title'];
    description = json['description'];
    thumbnail = Thumbnail.fromJson(json['thumbnail'] ?? <String, dynamic>{});
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
      "thumbnail": thumbnail == null ? null : thumbnail?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inlineQueryResultArticle';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InlineQueryResultContact extends InlineQueryResult {

  /// Represents a user contact
  InlineQueryResultContact({this.id,
    this.contact,
    this.thumbnail});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [contact] A user contact 
  Contact? contact;

  /// [thumbnail] Result thumbnail in JPEG format; may be null
  Thumbnail? thumbnail;

  /// Parse from a json
  InlineQueryResultContact.fromJson(Map<String, dynamic> json)  {
    id = json['id'];
    contact = Contact.fromJson(json['contact'] ?? <String, dynamic>{});
    thumbnail = Thumbnail.fromJson(json['thumbnail'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "contact": contact == null ? null : contact?.toJson(),
      "thumbnail": thumbnail == null ? null : thumbnail?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inlineQueryResultContact';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InlineQueryResultLocation extends InlineQueryResult {

  /// Represents a point on the map
  InlineQueryResultLocation({this.id,
    this.location,
    this.title,
    this.thumbnail});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [location] Location result 
  Location? location;

  /// [title] Title of the result 
  String? title;

  /// [thumbnail] Result thumbnail in JPEG format; may be null
  Thumbnail? thumbnail;

  /// Parse from a json
  InlineQueryResultLocation.fromJson(Map<String, dynamic> json)  {
    id = json['id'];
    location = Location.fromJson(json['location'] ?? <String, dynamic>{});
    title = json['title'];
    thumbnail = Thumbnail.fromJson(json['thumbnail'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "location": location == null ? null : location?.toJson(),
      "title": title,
      "thumbnail": thumbnail == null ? null : thumbnail?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inlineQueryResultLocation';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InlineQueryResultVenue extends InlineQueryResult {

  /// Represents information about a venue
  InlineQueryResultVenue({this.id,
    this.venue,
    this.thumbnail});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [venue] Venue result 
  Venue? venue;

  /// [thumbnail] Result thumbnail in JPEG format; may be null
  Thumbnail? thumbnail;

  /// Parse from a json
  InlineQueryResultVenue.fromJson(Map<String, dynamic> json)  {
    id = json['id'];
    venue = Venue.fromJson(json['venue'] ?? <String, dynamic>{});
    thumbnail = Thumbnail.fromJson(json['thumbnail'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "venue": venue == null ? null : venue?.toJson(),
      "thumbnail": thumbnail == null ? null : thumbnail?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inlineQueryResultVenue';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InlineQueryResultGame extends InlineQueryResult {

  /// Represents information about a game
  InlineQueryResultGame({this.id,
    this.game});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [game] Game result
  Game? game;

  /// Parse from a json
  InlineQueryResultGame.fromJson(Map<String, dynamic> json)  {
    id = json['id'];
    game = Game.fromJson(json['game'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "game": game == null ? null : game?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inlineQueryResultGame';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InlineQueryResultAnimation extends InlineQueryResult {

  /// Represents an animation file
  InlineQueryResultAnimation({this.id,
    this.animation,
    this.title});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [animation] Animation file 
  Animation? animation;

  /// [title] Animation title
  String? title;

  /// Parse from a json
  InlineQueryResultAnimation.fromJson(Map<String, dynamic> json)  {
    id = json['id'];
    animation = Animation.fromJson(json['animation'] ?? <String, dynamic>{});
    title = json['title'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "animation": animation == null ? null : animation?.toJson(),
      "title": title,
    };
  }

  static const CONSTRUCTOR = 'inlineQueryResultAnimation';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InlineQueryResultAudio extends InlineQueryResult {

  /// Represents an audio file
  InlineQueryResultAudio({this.id,
    this.audio});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [audio] Audio file
  Audio? audio;

  /// Parse from a json
  InlineQueryResultAudio.fromJson(Map<String, dynamic> json)  {
    id = json['id'];
    audio = Audio.fromJson(json['audio'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "audio": audio == null ? null : audio?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inlineQueryResultAudio';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InlineQueryResultDocument extends InlineQueryResult {

  /// Represents a document
  InlineQueryResultDocument({this.id,
    this.document,
    this.title,
    this.description});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [document] Document 
  Document? document;

  /// [title] Document title 
  String? title;

  /// [description] Document description
  String? description;

  /// Parse from a json
  InlineQueryResultDocument.fromJson(Map<String, dynamic> json)  {
    id = json['id'];
    document = Document.fromJson(json['document'] ?? <String, dynamic>{});
    title = json['title'];
    description = json['description'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "document": document == null ? null : document?.toJson(),
      "title": title,
      "description": description,
    };
  }

  static const CONSTRUCTOR = 'inlineQueryResultDocument';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InlineQueryResultPhoto extends InlineQueryResult {

  /// Represents a photo
  InlineQueryResultPhoto({this.id,
    this.photo,
    this.title,
    this.description});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [photo] Photo 
  Photo? photo;

  /// [title] Title of the result, if known 
  String? title;

  /// [description] A short description of the result, if known
  String? description;

  /// Parse from a json
  InlineQueryResultPhoto.fromJson(Map<String, dynamic> json)  {
    id = json['id'];
    photo = Photo.fromJson(json['photo'] ?? <String, dynamic>{});
    title = json['title'];
    description = json['description'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "photo": photo == null ? null : photo?.toJson(),
      "title": title,
      "description": description,
    };
  }

  static const CONSTRUCTOR = 'inlineQueryResultPhoto';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InlineQueryResultSticker extends InlineQueryResult {

  /// Represents a sticker
  InlineQueryResultSticker({this.id,
    this.sticker});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [sticker] Sticker
  Sticker? sticker;

  /// Parse from a json
  InlineQueryResultSticker.fromJson(Map<String, dynamic> json)  {
    id = json['id'];
    sticker = Sticker.fromJson(json['sticker'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "sticker": sticker == null ? null : sticker?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inlineQueryResultSticker';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InlineQueryResultVideo extends InlineQueryResult {

  /// Represents a video
  InlineQueryResultVideo({this.id,
    this.video,
    this.title,
    this.description});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [video] Video 
  Video? video;

  /// [title] Title of the video 
  String? title;

  /// [description] Description of the video
  String? description;

  /// Parse from a json
  InlineQueryResultVideo.fromJson(Map<String, dynamic> json)  {
    id = json['id'];
    video = Video.fromJson(json['video'] ?? <String, dynamic>{});
    title = json['title'];
    description = json['description'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "video": video == null ? null : video?.toJson(),
      "title": title,
      "description": description,
    };
  }

  static const CONSTRUCTOR = 'inlineQueryResultVideo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InlineQueryResultVoiceNote extends InlineQueryResult {

  /// Represents a voice note
  InlineQueryResultVoiceNote({this.id,
    this.voiceNote,
    this.title});

  /// [id] Unique identifier of the query result 
  String? id;

  /// [voiceNote] Voice note 
  VoiceNote? voiceNote;

  /// [title] Title of the voice note
  String? title;

  /// Parse from a json
  InlineQueryResultVoiceNote.fromJson(Map<String, dynamic> json)  {
    id = json['id'];
    voiceNote = VoiceNote.fromJson(json['voice_note'] ?? <String, dynamic>{});
    title = json['title'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "voice_note": voiceNote == null ? null : voiceNote?.toJson(),
      "title": title,
    };
  }

  static const CONSTRUCTOR = 'inlineQueryResultVoiceNote';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}