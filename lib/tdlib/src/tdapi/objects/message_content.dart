part of '../tdapi.dart';

class MessageContent extends TdObject {

  /// Contains the content of a message
  MessageContent();

  

  /// a MessageContent return type can be :
  /// * MessageText
  /// * MessageAnimation
  /// * MessageAudio
  /// * MessageDocument
  /// * MessagePhoto
  /// * MessageExpiredPhoto
  /// * MessageSticker
  /// * MessageVideo
  /// * MessageExpiredVideo
  /// * MessageVideoNote
  /// * MessageVoiceNote
  /// * MessageLocation
  /// * MessageVenue
  /// * MessageContact
  /// * MessageDice
  /// * MessageGame
  /// * MessagePoll
  /// * MessageInvoice
  /// * MessageCall
  /// * MessageVoiceChatScheduled
  /// * MessageVoiceChatStarted
  /// * MessageVoiceChatEnded
  /// * MessageInviteVoiceChatParticipants
  /// * MessageBasicGroupChatCreate
  /// * MessageSupergroupChatCreate
  /// * MessageChatChangeTitle
  /// * MessageChatChangePhoto
  /// * MessageChatDeletePhoto
  /// * MessageChatAddMembers
  /// * MessageChatJoinByLink
  /// * MessageChatDeleteMember
  /// * MessageChatUpgradeTo
  /// * MessageChatUpgradeFrom
  /// * MessagePinMessage
  /// * MessageScreenshotTaken
  /// * MessageChatSetTheme
  /// * MessageChatSetTtl
  /// * MessageCustomServiceAction
  /// * MessageGameScore
  /// * MessagePaymentSuccessful
  /// * MessagePaymentSuccessfulBot
  /// * MessageContactRegistered
  /// * MessageWebsiteConnected
  /// * MessagePassportDataSent
  /// * MessagePassportDataReceived
  /// * MessageProximityAlertTriggered
  /// * MessageUnsupported
  factory MessageContent.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case MessageText.CONSTRUCTOR:
        return MessageText.fromJson(json);
      case MessageAnimation.CONSTRUCTOR:
        return MessageAnimation.fromJson(json);
      case MessageAudio.CONSTRUCTOR:
        return MessageAudio.fromJson(json);
      case MessageDocument.CONSTRUCTOR:
        return MessageDocument.fromJson(json);
      case MessagePhoto.CONSTRUCTOR:
        return MessagePhoto.fromJson(json);
      case MessageExpiredPhoto.CONSTRUCTOR:
        return MessageExpiredPhoto.fromJson(json);
      case MessageSticker.CONSTRUCTOR:
        return MessageSticker.fromJson(json);
      case MessageVideo.CONSTRUCTOR:
        return MessageVideo.fromJson(json);
      case MessageExpiredVideo.CONSTRUCTOR:
        return MessageExpiredVideo.fromJson(json);
      case MessageVideoNote.CONSTRUCTOR:
        return MessageVideoNote.fromJson(json);
      case MessageVoiceNote.CONSTRUCTOR:
        return MessageVoiceNote.fromJson(json);
      case MessageLocation.CONSTRUCTOR:
        return MessageLocation.fromJson(json);
      case MessageVenue.CONSTRUCTOR:
        return MessageVenue.fromJson(json);
      case MessageContact.CONSTRUCTOR:
        return MessageContact.fromJson(json);
      case MessageDice.CONSTRUCTOR:
        return MessageDice.fromJson(json);
      case MessageGame.CONSTRUCTOR:
        return MessageGame.fromJson(json);
      case MessagePoll.CONSTRUCTOR:
        return MessagePoll.fromJson(json);
      case MessageInvoice.CONSTRUCTOR:
        return MessageInvoice.fromJson(json);
      case MessageCall.CONSTRUCTOR:
        return MessageCall.fromJson(json);
      case MessageVoiceChatScheduled.CONSTRUCTOR:
        return MessageVoiceChatScheduled.fromJson(json);
      case MessageVoiceChatStarted.CONSTRUCTOR:
        return MessageVoiceChatStarted.fromJson(json);
      case MessageVoiceChatEnded.CONSTRUCTOR:
        return MessageVoiceChatEnded.fromJson(json);
      case MessageInviteVoiceChatParticipants.CONSTRUCTOR:
        return MessageInviteVoiceChatParticipants.fromJson(json);
      case MessageBasicGroupChatCreate.CONSTRUCTOR:
        return MessageBasicGroupChatCreate.fromJson(json);
      case MessageSupergroupChatCreate.CONSTRUCTOR:
        return MessageSupergroupChatCreate.fromJson(json);
      case MessageChatChangeTitle.CONSTRUCTOR:
        return MessageChatChangeTitle.fromJson(json);
      case MessageChatChangePhoto.CONSTRUCTOR:
        return MessageChatChangePhoto.fromJson(json);
      case MessageChatDeletePhoto.CONSTRUCTOR:
        return MessageChatDeletePhoto.fromJson(json);
      case MessageChatAddMembers.CONSTRUCTOR:
        return MessageChatAddMembers.fromJson(json);
      case MessageChatJoinByLink.CONSTRUCTOR:
        return MessageChatJoinByLink.fromJson(json);
      case MessageChatDeleteMember.CONSTRUCTOR:
        return MessageChatDeleteMember.fromJson(json);
      case MessageChatUpgradeTo.CONSTRUCTOR:
        return MessageChatUpgradeTo.fromJson(json);
      case MessageChatUpgradeFrom.CONSTRUCTOR:
        return MessageChatUpgradeFrom.fromJson(json);
      case MessagePinMessage.CONSTRUCTOR:
        return MessagePinMessage.fromJson(json);
      case MessageScreenshotTaken.CONSTRUCTOR:
        return MessageScreenshotTaken.fromJson(json);
      case MessageChatSetTheme.CONSTRUCTOR:
        return MessageChatSetTheme.fromJson(json);
      case MessageChatSetTtl.CONSTRUCTOR:
        return MessageChatSetTtl.fromJson(json);
      case MessageCustomServiceAction.CONSTRUCTOR:
        return MessageCustomServiceAction.fromJson(json);
      case MessageGameScore.CONSTRUCTOR:
        return MessageGameScore.fromJson(json);
      case MessagePaymentSuccessful.CONSTRUCTOR:
        return MessagePaymentSuccessful.fromJson(json);
      case MessagePaymentSuccessfulBot.CONSTRUCTOR:
        return MessagePaymentSuccessfulBot.fromJson(json);
      case MessageContactRegistered.CONSTRUCTOR:
        return MessageContactRegistered.fromJson(json);
      case MessageWebsiteConnected.CONSTRUCTOR:
        return MessageWebsiteConnected.fromJson(json);
      case MessagePassportDataSent.CONSTRUCTOR:
        return MessagePassportDataSent.fromJson(json);
      case MessagePassportDataReceived.CONSTRUCTOR:
        return MessagePassportDataReceived.fromJson(json);
      case MessageProximityAlertTriggered.CONSTRUCTOR:
        return MessageProximityAlertTriggered.fromJson(json);
      case MessageUnsupported.CONSTRUCTOR:
        return MessageUnsupported.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'messageContent';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageText extends MessageContent {

  /// A text message
  MessageText({this.text,
    this.webPage});

  /// [text] Text of the message 
  FormattedText? text;

  /// [webPage] A preview of the web page that's mentioned in the text; may be null
  WebPage? webPage;

  /// Parse from a json
  MessageText.fromJson(Map<String, dynamic> json)  {
    FormattedText? pre_text;
    try{
      pre_text=FormattedText.fromJson(json['text'] ?? <String, dynamic>{});
   }catch(_){}
    text = pre_text;
    WebPage? pre_webPage;
    try{
      pre_webPage=WebPage.fromJson(json['web_page'] ?? <String, dynamic>{});
   }catch(_){}
    webPage = pre_webPage;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
      "web_page": webPage == null ? null : webPage?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'messageText';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageAnimation extends MessageContent {

  /// An animation message (GIF-style).
  MessageAnimation({this.animation,
    this.caption,
    this.isSecret});

  /// [animation] The animation description 
  Animation? animation;

  /// [caption] Animation caption 
  FormattedText? caption;

  /// [isSecret] True, if the animation thumbnail must be blurred and the animation must be shown only while tapped
  bool? isSecret;

  /// Parse from a json
  MessageAnimation.fromJson(Map<String, dynamic> json)  {
    Animation? pre_animation;
    try{
      pre_animation=Animation.fromJson(json['animation'] ?? <String, dynamic>{});
   }catch(_){}
    animation = pre_animation;
    FormattedText? pre_caption;
    try{
      pre_caption=FormattedText.fromJson(json['caption'] ?? <String, dynamic>{});
   }catch(_){}
    caption = pre_caption;
    bool? pre_isSecret;
    try{
      pre_isSecret=json['is_secret'];
   }catch(_){}
    isSecret = pre_isSecret;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "animation": animation == null ? null : animation?.toJson(),
      "caption": caption == null ? null : caption?.toJson(),
      "is_secret": isSecret,
    };
  }

  static const CONSTRUCTOR = 'messageAnimation';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageAudio extends MessageContent {

  /// An audio message
  MessageAudio({this.audio,
    this.caption});

  /// [audio] The audio description 
  Audio? audio;

  /// [caption] Audio caption
  FormattedText? caption;

  /// Parse from a json
  MessageAudio.fromJson(Map<String, dynamic> json)  {
    Audio? pre_audio;
    try{
      pre_audio=Audio.fromJson(json['audio'] ?? <String, dynamic>{});
   }catch(_){}
    audio = pre_audio;
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
      "caption": caption == null ? null : caption?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'messageAudio';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageDocument extends MessageContent {

  /// A document message (general file)
  MessageDocument({this.document,
    this.caption});

  /// [document] The document description 
  Document? document;

  /// [caption] Document caption
  FormattedText? caption;

  /// Parse from a json
  MessageDocument.fromJson(Map<String, dynamic> json)  {
    Document? pre_document;
    try{
      pre_document=Document.fromJson(json['document'] ?? <String, dynamic>{});
   }catch(_){}
    document = pre_document;
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
      "caption": caption == null ? null : caption?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'messageDocument';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessagePhoto extends MessageContent {

  /// A photo message
  MessagePhoto({this.photo,
    this.caption,
    this.isSecret});

  /// [photo] The photo description 
  Photo? photo;

  /// [caption] Photo caption 
  FormattedText? caption;

  /// [isSecret] True, if the photo must be blurred and must be shown only while tapped
  bool? isSecret;

  /// Parse from a json
  MessagePhoto.fromJson(Map<String, dynamic> json)  {
    Photo? pre_photo;
    try{
      pre_photo=Photo.fromJson(json['photo'] ?? <String, dynamic>{});
   }catch(_){}
    photo = pre_photo;
    FormattedText? pre_caption;
    try{
      pre_caption=FormattedText.fromJson(json['caption'] ?? <String, dynamic>{});
   }catch(_){}
    caption = pre_caption;
    bool? pre_isSecret;
    try{
      pre_isSecret=json['is_secret'];
   }catch(_){}
    isSecret = pre_isSecret;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "photo": photo == null ? null : photo?.toJson(),
      "caption": caption == null ? null : caption?.toJson(),
      "is_secret": isSecret,
    };
  }

  static const CONSTRUCTOR = 'messagePhoto';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageExpiredPhoto extends MessageContent {

  /// An expired photo message (self-destructed after TTL has elapsed)
  MessageExpiredPhoto();

  

  /// Parse from a json
  MessageExpiredPhoto.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'messageExpiredPhoto';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageSticker extends MessageContent {

  /// A sticker message
  MessageSticker({this.sticker});

  /// [sticker] The sticker description
  Sticker? sticker;

  /// Parse from a json
  MessageSticker.fromJson(Map<String, dynamic> json)  {
    Sticker? pre_sticker;
    try{
      pre_sticker=Sticker.fromJson(json['sticker'] ?? <String, dynamic>{});
   }catch(_){}
    sticker = pre_sticker;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sticker": sticker == null ? null : sticker?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'messageSticker';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageVideo extends MessageContent {

  /// A video message
  MessageVideo({this.video,
    this.caption,
    this.isSecret});

  /// [video] The video description 
  Video? video;

  /// [caption] Video caption 
  FormattedText? caption;

  /// [isSecret] True, if the video thumbnail must be blurred and the video must be shown only while tapped
  bool? isSecret;

  /// Parse from a json
  MessageVideo.fromJson(Map<String, dynamic> json)  {
    Video? pre_video;
    try{
      pre_video=Video.fromJson(json['video'] ?? <String, dynamic>{});
   }catch(_){}
    video = pre_video;
    FormattedText? pre_caption;
    try{
      pre_caption=FormattedText.fromJson(json['caption'] ?? <String, dynamic>{});
   }catch(_){}
    caption = pre_caption;
    bool? pre_isSecret;
    try{
      pre_isSecret=json['is_secret'];
   }catch(_){}
    isSecret = pre_isSecret;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "video": video == null ? null : video?.toJson(),
      "caption": caption == null ? null : caption?.toJson(),
      "is_secret": isSecret,
    };
  }

  static const CONSTRUCTOR = 'messageVideo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageExpiredVideo extends MessageContent {

  /// An expired video message (self-destructed after TTL has elapsed)
  MessageExpiredVideo();

  

  /// Parse from a json
  MessageExpiredVideo.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'messageExpiredVideo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageVideoNote extends MessageContent {

  /// A video note message
  MessageVideoNote({this.videoNote,
    this.isViewed,
    this.isSecret});

  /// [videoNote] The video note description 
  VideoNote? videoNote;

  /// [isViewed] True, if at least one of the recipients has viewed the video note 
  bool? isViewed;

  /// [isSecret] True, if the video note thumbnail must be blurred and the video note must be shown only while tapped
  bool? isSecret;

  /// Parse from a json
  MessageVideoNote.fromJson(Map<String, dynamic> json)  {
    VideoNote? pre_videoNote;
    try{
      pre_videoNote=VideoNote.fromJson(json['video_note'] ?? <String, dynamic>{});
   }catch(_){}
    videoNote = pre_videoNote;
    bool? pre_isViewed;
    try{
      pre_isViewed=json['is_viewed'];
   }catch(_){}
    isViewed = pre_isViewed;
    bool? pre_isSecret;
    try{
      pre_isSecret=json['is_secret'];
   }catch(_){}
    isSecret = pre_isSecret;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "video_note": videoNote == null ? null : videoNote?.toJson(),
      "is_viewed": isViewed,
      "is_secret": isSecret,
    };
  }

  static const CONSTRUCTOR = 'messageVideoNote';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageVoiceNote extends MessageContent {

  /// A voice note message
  MessageVoiceNote({this.voiceNote,
    this.caption,
    this.isListened});

  /// [voiceNote] The voice note description 
  VoiceNote? voiceNote;

  /// [caption] Voice note caption 
  FormattedText? caption;

  /// [isListened] True, if at least one of the recipients has listened to the voice note
  bool? isListened;

  /// Parse from a json
  MessageVoiceNote.fromJson(Map<String, dynamic> json)  {
    VoiceNote? pre_voiceNote;
    try{
      pre_voiceNote=VoiceNote.fromJson(json['voice_note'] ?? <String, dynamic>{});
   }catch(_){}
    voiceNote = pre_voiceNote;
    FormattedText? pre_caption;
    try{
      pre_caption=FormattedText.fromJson(json['caption'] ?? <String, dynamic>{});
   }catch(_){}
    caption = pre_caption;
    bool? pre_isListened;
    try{
      pre_isListened=json['is_listened'];
   }catch(_){}
    isListened = pre_isListened;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "voice_note": voiceNote == null ? null : voiceNote?.toJson(),
      "caption": caption == null ? null : caption?.toJson(),
      "is_listened": isListened,
    };
  }

  static const CONSTRUCTOR = 'messageVoiceNote';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageLocation extends MessageContent {

  /// A message with a location
  MessageLocation({this.location,
    this.livePeriod,
    this.expiresIn,
    this.heading,
    this.proximityAlertRadius});

  /// [location] The location description 
  Location? location;

  /// [livePeriod] Time relative to the message send date, for which the location can be updated, in seconds
  int? livePeriod;

  /// [expiresIn] Left time for which the location can be updated, in seconds. updateMessageContent is not sent when this field changes
  int? expiresIn;

  /// [heading] For live locations, a direction in which the location moves, in degrees; 1-360. If 0 the direction is unknown
  int? heading;

  /// [proximityAlertRadius] For live locations, a maximum distance to another chat member for proximity alerts, in meters (0-100000). 0 if the notification is disabled. Available only for the message sender
  int? proximityAlertRadius;

  /// Parse from a json
  MessageLocation.fromJson(Map<String, dynamic> json)  {
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
    int? pre_expiresIn;
    try{
      pre_expiresIn=json['expires_in'];
   }catch(_){}
    expiresIn = pre_expiresIn;
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
      "expires_in": expiresIn,
      "heading": heading,
      "proximity_alert_radius": proximityAlertRadius,
    };
  }

  static const CONSTRUCTOR = 'messageLocation';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageVenue extends MessageContent {

  /// A message with information about a venue
  MessageVenue({this.venue});

  /// [venue] The venue description
  Venue? venue;

  /// Parse from a json
  MessageVenue.fromJson(Map<String, dynamic> json)  {
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

  static const CONSTRUCTOR = 'messageVenue';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageContact extends MessageContent {

  /// A message with a user contact
  MessageContact({this.contact});

  /// [contact] The contact description
  Contact? contact;

  /// Parse from a json
  MessageContact.fromJson(Map<String, dynamic> json)  {
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

  static const CONSTRUCTOR = 'messageContact';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageDice extends MessageContent {

  /// A dice message. The dice value is randomly generated by the server
  MessageDice({this.initialState,
    this.finalState,
    this.emoji,
    this.value,
    this.successAnimationFrameNumber});

  /// [initialState] The animated stickers with the initial dice animation; may be null if unknown. updateMessageContent will be sent when the sticker became known
  DiceStickers? initialState;

  /// [finalState] The animated stickers with the final dice animation; may be null if unknown. updateMessageContent will be sent when the sticker became known
  DiceStickers? finalState;

  /// [emoji] Emoji on which the dice throw animation is based
  String? emoji;

  /// [value] The dice value. If the value is 0, the dice don't have final state yet
  int? value;

  /// [successAnimationFrameNumber] Number of frame after which a success animation like a shower of confetti needs to be shown on updateMessageSendSucceeded
  int? successAnimationFrameNumber;

  /// Parse from a json
  MessageDice.fromJson(Map<String, dynamic> json)  {
    DiceStickers? pre_initialState;
    try{
      pre_initialState=DiceStickers.fromJson(json['initial_state'] ?? <String, dynamic>{});
   }catch(_){}
    initialState = pre_initialState;
    DiceStickers? pre_finalState;
    try{
      pre_finalState=DiceStickers.fromJson(json['final_state'] ?? <String, dynamic>{});
   }catch(_){}
    finalState = pre_finalState;
    String? pre_emoji;
    try{
      pre_emoji=json['emoji'];
   }catch(_){}
    emoji = pre_emoji;
    int? pre_value;
    try{
      pre_value=json['value'];
   }catch(_){}
    value = pre_value;
    int? pre_successAnimationFrameNumber;
    try{
      pre_successAnimationFrameNumber=json['success_animation_frame_number'];
   }catch(_){}
    successAnimationFrameNumber = pre_successAnimationFrameNumber;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "initial_state": initialState == null ? null : initialState?.toJson(),
      "final_state": finalState == null ? null : finalState?.toJson(),
      "emoji": emoji,
      "value": value,
      "success_animation_frame_number": successAnimationFrameNumber,
    };
  }

  static const CONSTRUCTOR = 'messageDice';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageGame extends MessageContent {

  /// A message with a game
  MessageGame({this.game});

  /// [game] The game description
  Game? game;

  /// Parse from a json
  MessageGame.fromJson(Map<String, dynamic> json)  {
    Game? pre_game;
    try{
      pre_game=Game.fromJson(json['game'] ?? <String, dynamic>{});
   }catch(_){}
    game = pre_game;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "game": game == null ? null : game?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'messageGame';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessagePoll extends MessageContent {

  /// A message with a poll
  MessagePoll({this.poll});

  /// [poll] The poll description
  Poll? poll;

  /// Parse from a json
  MessagePoll.fromJson(Map<String, dynamic> json)  {
    Poll? pre_poll;
    try{
      pre_poll=Poll.fromJson(json['poll'] ?? <String, dynamic>{});
   }catch(_){}
    poll = pre_poll;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "poll": poll == null ? null : poll?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'messagePoll';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageInvoice extends MessageContent {

  /// A message with an invoice from a bot
  MessageInvoice({this.title,
    this.description,
    this.photo,
    this.currency,
    this.totalAmount,
    this.startParameter,
    this.isTest,
    this.needShippingAddress,
    this.receiptMessageId});

  /// [title] Product title 
  String? title;

  /// [description] Product description 
  String? description;

  /// [photo] Product photo; may be null 
  Photo? photo;

  /// [currency] Currency for the product price 
  String? currency;

  /// [totalAmount] Product total price in the smallest units of the currency
  int? totalAmount;

  /// [startParameter] Unique invoice bot start_parameter. To share an invoice use the URL https://t.me/{bot_username}?start={start_parameter}
  String? startParameter;

  /// [isTest] True, if the invoice is a test invoice
  bool? isTest;

  /// [needShippingAddress] True, if the shipping address must be specified
  bool? needShippingAddress;

  /// [receiptMessageId] The identifier of the message with the receipt, after the product has been purchased
  int? receiptMessageId;

  /// Parse from a json
  MessageInvoice.fromJson(Map<String, dynamic> json)  {
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
    Photo? pre_photo;
    try{
      pre_photo=Photo.fromJson(json['photo'] ?? <String, dynamic>{});
   }catch(_){}
    photo = pre_photo;
    String? pre_currency;
    try{
      pre_currency=json['currency'];
   }catch(_){}
    currency = pre_currency;
    int? pre_totalAmount;
    try{
      pre_totalAmount=json['total_amount'];
   }catch(_){}
    totalAmount = pre_totalAmount;
    String? pre_startParameter;
    try{
      pre_startParameter=json['start_parameter'];
   }catch(_){}
    startParameter = pre_startParameter;
    bool? pre_isTest;
    try{
      pre_isTest=json['is_test'];
   }catch(_){}
    isTest = pre_isTest;
    bool? pre_needShippingAddress;
    try{
      pre_needShippingAddress=json['need_shipping_address'];
   }catch(_){}
    needShippingAddress = pre_needShippingAddress;
    int? pre_receiptMessageId;
    try{
      pre_receiptMessageId=json['receipt_message_id'];
   }catch(_){}
    receiptMessageId = pre_receiptMessageId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "title": title,
      "description": description,
      "photo": photo == null ? null : photo?.toJson(),
      "currency": currency,
      "total_amount": totalAmount,
      "start_parameter": startParameter,
      "is_test": isTest,
      "need_shipping_address": needShippingAddress,
      "receipt_message_id": receiptMessageId,
    };
  }

  static const CONSTRUCTOR = 'messageInvoice';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageCall extends MessageContent {

  /// A message with information about an ended call
  MessageCall({this.isVideo,
    this.discardReason,
    this.duration});

  /// [isVideo] True, if the call was a video call 
  bool? isVideo;

  /// [discardReason] Reason why the call was discarded 
  CallDiscardReason? discardReason;

  /// [duration] Call duration, in seconds
  int? duration;

  /// Parse from a json
  MessageCall.fromJson(Map<String, dynamic> json)  {
    bool? pre_isVideo;
    try{
      pre_isVideo=json['is_video'];
   }catch(_){}
    isVideo = pre_isVideo;
    CallDiscardReason? pre_discardReason;
    try{
      pre_discardReason=CallDiscardReason.fromJson(json['discard_reason'] ?? <String, dynamic>{});
   }catch(_){}
    discardReason = pre_discardReason;
    int? pre_duration;
    try{
      pre_duration=json['duration'];
   }catch(_){}
    duration = pre_duration;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "is_video": isVideo,
      "discard_reason": discardReason == null ? null : discardReason?.toJson(),
      "duration": duration,
    };
  }

  static const CONSTRUCTOR = 'messageCall';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageVoiceChatScheduled extends MessageContent {

  /// A new voice chat was scheduled
  MessageVoiceChatScheduled({this.groupCallId,
    this.startDate});

  /// [groupCallId] Identifier of the voice chat. The voice chat can be received through the method getGroupCall 
  int? groupCallId;

  /// [startDate] Point in time (Unix timestamp) when the group call is supposed to be started by an administrator
  int? startDate;

  /// Parse from a json
  MessageVoiceChatScheduled.fromJson(Map<String, dynamic> json)  {
    int? pre_groupCallId;
    try{
      pre_groupCallId=json['group_call_id'];
   }catch(_){}
    groupCallId = pre_groupCallId;
    int? pre_startDate;
    try{
      pre_startDate=json['start_date'];
   }catch(_){}
    startDate = pre_startDate;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "start_date": startDate,
    };
  }

  static const CONSTRUCTOR = 'messageVoiceChatScheduled';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageVoiceChatStarted extends MessageContent {

  /// A newly created voice chat
  MessageVoiceChatStarted({this.groupCallId});

  /// [groupCallId] Identifier of the voice chat. The voice chat can be received through the method getGroupCall
  int? groupCallId;

  /// Parse from a json
  MessageVoiceChatStarted.fromJson(Map<String, dynamic> json)  {
    int? pre_groupCallId;
    try{
      pre_groupCallId=json['group_call_id'];
   }catch(_){}
    groupCallId = pre_groupCallId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
    };
  }

  static const CONSTRUCTOR = 'messageVoiceChatStarted';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageVoiceChatEnded extends MessageContent {

  /// A message with information about an ended voice chat
  MessageVoiceChatEnded({this.duration});

  /// [duration] Call duration, in seconds
  int? duration;

  /// Parse from a json
  MessageVoiceChatEnded.fromJson(Map<String, dynamic> json)  {
    int? pre_duration;
    try{
      pre_duration=json['duration'];
   }catch(_){}
    duration = pre_duration;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "duration": duration,
    };
  }

  static const CONSTRUCTOR = 'messageVoiceChatEnded';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageInviteVoiceChatParticipants extends MessageContent {

  /// A message with information about an invite to a voice chat
  MessageInviteVoiceChatParticipants({this.groupCallId,
    this.userIds});

  /// [groupCallId] Identifier of the voice chat. The voice chat can be received through the method getGroupCall 
  int? groupCallId;

  /// [userIds] Invited user identifiers
  List<int>? userIds;

  /// Parse from a json
  MessageInviteVoiceChatParticipants.fromJson(Map<String, dynamic> json)  {
    int? pre_groupCallId;
    try{
      pre_groupCallId=json['group_call_id'];
   }catch(_){}
    groupCallId = pre_groupCallId;
    List<int>? pre_userIds;
    try{
      pre_userIds=List<int>.from((json['user_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    userIds = pre_userIds;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "user_ids": userIds?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'messageInviteVoiceChatParticipants';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageBasicGroupChatCreate extends MessageContent {

  /// A newly created basic group
  MessageBasicGroupChatCreate({this.title,
    this.memberUserIds});

  /// [title] Title of the basic group 
  String? title;

  /// [memberUserIds] User identifiers of members in the basic group
  List<int>? memberUserIds;

  /// Parse from a json
  MessageBasicGroupChatCreate.fromJson(Map<String, dynamic> json)  {
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
    List<int>? pre_memberUserIds;
    try{
      pre_memberUserIds=List<int>.from((json['member_user_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    memberUserIds = pre_memberUserIds;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "title": title,
      "member_user_ids": memberUserIds?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'messageBasicGroupChatCreate';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageSupergroupChatCreate extends MessageContent {

  /// A newly created supergroup or channel
  MessageSupergroupChatCreate({this.title});

  /// [title] Title of the supergroup or channel
  String? title;

  /// Parse from a json
  MessageSupergroupChatCreate.fromJson(Map<String, dynamic> json)  {
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "title": title,
    };
  }

  static const CONSTRUCTOR = 'messageSupergroupChatCreate';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageChatChangeTitle extends MessageContent {

  /// An updated chat title
  MessageChatChangeTitle({this.title});

  /// [title] New chat title
  String? title;

  /// Parse from a json
  MessageChatChangeTitle.fromJson(Map<String, dynamic> json)  {
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "title": title,
    };
  }

  static const CONSTRUCTOR = 'messageChatChangeTitle';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageChatChangePhoto extends MessageContent {

  /// An updated chat photo
  MessageChatChangePhoto({this.photo});

  /// [photo] New chat photo
  ChatPhoto? photo;

  /// Parse from a json
  MessageChatChangePhoto.fromJson(Map<String, dynamic> json)  {
    ChatPhoto? pre_photo;
    try{
      pre_photo=ChatPhoto.fromJson(json['photo'] ?? <String, dynamic>{});
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

  static const CONSTRUCTOR = 'messageChatChangePhoto';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageChatDeletePhoto extends MessageContent {

  /// A deleted chat photo
  MessageChatDeletePhoto();

  

  /// Parse from a json
  MessageChatDeletePhoto.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'messageChatDeletePhoto';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageChatAddMembers extends MessageContent {

  /// New chat members were added
  MessageChatAddMembers({this.memberUserIds});

  /// [memberUserIds] User identifiers of the new members
  List<int>? memberUserIds;

  /// Parse from a json
  MessageChatAddMembers.fromJson(Map<String, dynamic> json)  {
    List<int>? pre_memberUserIds;
    try{
      pre_memberUserIds=List<int>.from((json['member_user_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    memberUserIds = pre_memberUserIds;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "member_user_ids": memberUserIds?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'messageChatAddMembers';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageChatJoinByLink extends MessageContent {

  /// A new member joined the chat by invite link
  MessageChatJoinByLink();

  

  /// Parse from a json
  MessageChatJoinByLink.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'messageChatJoinByLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageChatDeleteMember extends MessageContent {

  /// A chat member was deleted
  MessageChatDeleteMember({this.userId});

  /// [userId] User identifier of the deleted chat member
  int? userId;

  /// Parse from a json
  MessageChatDeleteMember.fromJson(Map<String, dynamic> json)  {
    int? pre_userId;
    try{
      pre_userId=json['user_id'];
   }catch(_){}
    userId = pre_userId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
    };
  }

  static const CONSTRUCTOR = 'messageChatDeleteMember';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageChatUpgradeTo extends MessageContent {

  /// A basic group was upgraded to a supergroup and was deactivated as the result
  MessageChatUpgradeTo({this.supergroupId});

  /// [supergroupId] Identifier of the supergroup to which the basic group was upgraded
  int? supergroupId;

  /// Parse from a json
  MessageChatUpgradeTo.fromJson(Map<String, dynamic> json)  {
    int? pre_supergroupId;
    try{
      pre_supergroupId=json['supergroup_id'];
   }catch(_){}
    supergroupId = pre_supergroupId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "supergroup_id": supergroupId,
    };
  }

  static const CONSTRUCTOR = 'messageChatUpgradeTo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageChatUpgradeFrom extends MessageContent {

  /// A supergroup has been created from a basic group
  MessageChatUpgradeFrom({this.title,
    this.basicGroupId});

  /// [title] Title of the newly created supergroup 
  String? title;

  /// [basicGroupId] The identifier of the original basic group
  int? basicGroupId;

  /// Parse from a json
  MessageChatUpgradeFrom.fromJson(Map<String, dynamic> json)  {
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
    int? pre_basicGroupId;
    try{
      pre_basicGroupId=json['basic_group_id'];
   }catch(_){}
    basicGroupId = pre_basicGroupId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "title": title,
      "basic_group_id": basicGroupId,
    };
  }

  static const CONSTRUCTOR = 'messageChatUpgradeFrom';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessagePinMessage extends MessageContent {

  /// A message has been pinned
  MessagePinMessage({this.messageId});

  /// [messageId] Identifier of the pinned message, can be an identifier of a deleted message or 0
  int? messageId;

  /// Parse from a json
  MessagePinMessage.fromJson(Map<String, dynamic> json)  {
    int? pre_messageId;
    try{
      pre_messageId=json['message_id'];
   }catch(_){}
    messageId = pre_messageId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "message_id": messageId,
    };
  }

  static const CONSTRUCTOR = 'messagePinMessage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageScreenshotTaken extends MessageContent {

  /// A screenshot of a message in the chat has been taken
  MessageScreenshotTaken();

  

  /// Parse from a json
  MessageScreenshotTaken.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'messageScreenshotTaken';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageChatSetTheme extends MessageContent {

  /// A theme in the chat has been changed
  MessageChatSetTheme({this.themeName});

  /// [themeName] If non-empty, name of a new theme, set for the chat. Otherwise chat theme was reset to the default one
  String? themeName;

  /// Parse from a json
  MessageChatSetTheme.fromJson(Map<String, dynamic> json)  {
    String? pre_themeName;
    try{
      pre_themeName=json['theme_name'];
   }catch(_){}
    themeName = pre_themeName;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "theme_name": themeName,
    };
  }

  static const CONSTRUCTOR = 'messageChatSetTheme';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageChatSetTtl extends MessageContent {

  /// The TTL (Time To Live) setting for messages in the chat has been changed
  MessageChatSetTtl({this.ttl});

  /// [ttl] New message TTL setting
  int? ttl;

  /// Parse from a json
  MessageChatSetTtl.fromJson(Map<String, dynamic> json)  {
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
      "ttl": ttl,
    };
  }

  static const CONSTRUCTOR = 'messageChatSetTtl';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageCustomServiceAction extends MessageContent {

  /// A non-standard action has happened in the chat
  MessageCustomServiceAction({this.text});

  /// [text] Message text to be shown in the chat
  String? text;

  /// Parse from a json
  MessageCustomServiceAction.fromJson(Map<String, dynamic> json)  {
    String? pre_text;
    try{
      pre_text=json['text'];
   }catch(_){}
    text = pre_text;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text,
    };
  }

  static const CONSTRUCTOR = 'messageCustomServiceAction';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageGameScore extends MessageContent {

  /// A new high score was achieved in a game
  MessageGameScore({this.gameMessageId,
    this.gameId,
    this.score});

  /// [gameMessageId] Identifier of the message with the game, can be an identifier of a deleted message 
  int? gameMessageId;

  /// [gameId] Identifier of the game; may be different from the games presented in the message with the game 
  int? gameId;

  /// [score] New score
  int? score;

  /// Parse from a json
  MessageGameScore.fromJson(Map<String, dynamic> json)  {
    int? pre_gameMessageId;
    try{
      pre_gameMessageId=json['game_message_id'];
   }catch(_){}
    gameMessageId = pre_gameMessageId;
    int? pre_gameId;
    try{
      pre_gameId=int.tryParse(json['game_id'] ?? "");
   }catch(_){}
    gameId = pre_gameId;
    int? pre_score;
    try{
      pre_score=json['score'];
   }catch(_){}
    score = pre_score;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "game_message_id": gameMessageId,
      "game_id": gameId,
      "score": score,
    };
  }

  static const CONSTRUCTOR = 'messageGameScore';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessagePaymentSuccessful extends MessageContent {

  /// A payment has been completed
  MessagePaymentSuccessful({this.invoiceChatId,
    this.invoiceMessageId,
    this.currency,
    this.totalAmount});

  /// [invoiceChatId] Identifier of the chat, containing the corresponding invoice message; 0 if unknown 
  int? invoiceChatId;

  /// [invoiceMessageId] Identifier of the message with the corresponding invoice; can be an identifier of a deleted message 
  int? invoiceMessageId;

  /// [currency] Currency for the price of the product 
  String? currency;

  /// [totalAmount] Total price for the product, in the smallest units of the currency
  int? totalAmount;

  /// Parse from a json
  MessagePaymentSuccessful.fromJson(Map<String, dynamic> json)  {
    int? pre_invoiceChatId;
    try{
      pre_invoiceChatId=json['invoice_chat_id'];
   }catch(_){}
    invoiceChatId = pre_invoiceChatId;
    int? pre_invoiceMessageId;
    try{
      pre_invoiceMessageId=json['invoice_message_id'];
   }catch(_){}
    invoiceMessageId = pre_invoiceMessageId;
    String? pre_currency;
    try{
      pre_currency=json['currency'];
   }catch(_){}
    currency = pre_currency;
    int? pre_totalAmount;
    try{
      pre_totalAmount=json['total_amount'];
   }catch(_){}
    totalAmount = pre_totalAmount;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "invoice_chat_id": invoiceChatId,
      "invoice_message_id": invoiceMessageId,
      "currency": currency,
      "total_amount": totalAmount,
    };
  }

  static const CONSTRUCTOR = 'messagePaymentSuccessful';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessagePaymentSuccessfulBot extends MessageContent {

  /// A payment has been completed; for bots only
  MessagePaymentSuccessfulBot({this.currency,
    this.totalAmount,
    this.invoicePayload,
    this.shippingOptionId,
    this.orderInfo,
    this.telegramPaymentChargeId,
    this.providerPaymentChargeId});

  /// [currency] Currency for price of the product
  String? currency;

  /// [totalAmount] Total price for the product, in the smallest units of the currency
  int? totalAmount;

  /// [invoicePayload] Invoice payload 
  String? invoicePayload;

  /// [shippingOptionId] Identifier of the shipping option chosen by the user; may be empty if not applicable 
  String? shippingOptionId;

  /// [orderInfo] Information about the order; may be null
  OrderInfo? orderInfo;

  /// [telegramPaymentChargeId] Telegram payment identifier
  String? telegramPaymentChargeId;

  /// [providerPaymentChargeId] Provider payment identifier
  String? providerPaymentChargeId;

  /// Parse from a json
  MessagePaymentSuccessfulBot.fromJson(Map<String, dynamic> json)  {
    String? pre_currency;
    try{
      pre_currency=json['currency'];
   }catch(_){}
    currency = pre_currency;
    int? pre_totalAmount;
    try{
      pre_totalAmount=json['total_amount'];
   }catch(_){}
    totalAmount = pre_totalAmount;
    String? pre_invoicePayload;
    try{
      pre_invoicePayload=json['invoice_payload'];
   }catch(_){}
    invoicePayload = pre_invoicePayload;
    String? pre_shippingOptionId;
    try{
      pre_shippingOptionId=json['shipping_option_id'];
   }catch(_){}
    shippingOptionId = pre_shippingOptionId;
    OrderInfo? pre_orderInfo;
    try{
      pre_orderInfo=OrderInfo.fromJson(json['order_info'] ?? <String, dynamic>{});
   }catch(_){}
    orderInfo = pre_orderInfo;
    String? pre_telegramPaymentChargeId;
    try{
      pre_telegramPaymentChargeId=json['telegram_payment_charge_id'];
   }catch(_){}
    telegramPaymentChargeId = pre_telegramPaymentChargeId;
    String? pre_providerPaymentChargeId;
    try{
      pre_providerPaymentChargeId=json['provider_payment_charge_id'];
   }catch(_){}
    providerPaymentChargeId = pre_providerPaymentChargeId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "currency": currency,
      "total_amount": totalAmount,
      "invoice_payload": invoicePayload,
      "shipping_option_id": shippingOptionId,
      "order_info": orderInfo == null ? null : orderInfo?.toJson(),
      "telegram_payment_charge_id": telegramPaymentChargeId,
      "provider_payment_charge_id": providerPaymentChargeId,
    };
  }

  static const CONSTRUCTOR = 'messagePaymentSuccessfulBot';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageContactRegistered extends MessageContent {

  /// A contact has registered with Telegram
  MessageContactRegistered();

  

  /// Parse from a json
  MessageContactRegistered.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'messageContactRegistered';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageWebsiteConnected extends MessageContent {

  /// The current user has connected a website by logging in using Telegram Login Widget on it
  MessageWebsiteConnected({this.domainName});

  /// [domainName] Domain name of the connected website
  String? domainName;

  /// Parse from a json
  MessageWebsiteConnected.fromJson(Map<String, dynamic> json)  {
    String? pre_domainName;
    try{
      pre_domainName=json['domain_name'];
   }catch(_){}
    domainName = pre_domainName;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "domain_name": domainName,
    };
  }

  static const CONSTRUCTOR = 'messageWebsiteConnected';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessagePassportDataSent extends MessageContent {

  /// Telegram Passport data has been sent
  MessagePassportDataSent({this.types});

  /// [types] List of Telegram Passport element types sent
  List<PassportElementType>? types;

  /// Parse from a json
  MessagePassportDataSent.fromJson(Map<String, dynamic> json)  {
    List<PassportElementType>? pre_types;
    try{
      pre_types=List<PassportElementType>.from((json['types'] ?? [])!.map((item) => PassportElementType.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    types = pre_types;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "types": types?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'messagePassportDataSent';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessagePassportDataReceived extends MessageContent {

  /// Telegram Passport data has been received; for bots only
  MessagePassportDataReceived({this.elements,
    this.credentials});

  /// [elements] List of received Telegram Passport elements 
  List<EncryptedPassportElement>? elements;

  /// [credentials] Encrypted data credentials
  EncryptedCredentials? credentials;

  /// Parse from a json
  MessagePassportDataReceived.fromJson(Map<String, dynamic> json)  {
    List<EncryptedPassportElement>? pre_elements;
    try{
      pre_elements=List<EncryptedPassportElement>.from((json['elements'] ?? [])!.map((item) => EncryptedPassportElement.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    elements = pre_elements;
    EncryptedCredentials? pre_credentials;
    try{
      pre_credentials=EncryptedCredentials.fromJson(json['credentials'] ?? <String, dynamic>{});
   }catch(_){}
    credentials = pre_credentials;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "elements": elements?.map((i) => i.toJson()).toList(),
      "credentials": credentials == null ? null : credentials?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'messagePassportDataReceived';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageProximityAlertTriggered extends MessageContent {

  /// A user in the chat came within proximity alert range
  MessageProximityAlertTriggered({this.traveler,
    this.watcher,
    this.distance});

  /// [traveler] The user or chat, which triggered the proximity alert 
  MessageSender? traveler;

  /// [watcher] The user or chat, which subscribed for the proximity alert 
  MessageSender? watcher;

  /// [distance] The distance between the users
  int? distance;

  /// Parse from a json
  MessageProximityAlertTriggered.fromJson(Map<String, dynamic> json)  {
    MessageSender? pre_traveler;
    try{
      pre_traveler=MessageSender.fromJson(json['traveler'] ?? <String, dynamic>{});
   }catch(_){}
    traveler = pre_traveler;
    MessageSender? pre_watcher;
    try{
      pre_watcher=MessageSender.fromJson(json['watcher'] ?? <String, dynamic>{});
   }catch(_){}
    watcher = pre_watcher;
    int? pre_distance;
    try{
      pre_distance=json['distance'];
   }catch(_){}
    distance = pre_distance;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "traveler": traveler == null ? null : traveler?.toJson(),
      "watcher": watcher == null ? null : watcher?.toJson(),
      "distance": distance,
    };
  }

  static const CONSTRUCTOR = 'messageProximityAlertTriggered';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageUnsupported extends MessageContent {

  /// Message content that is not supported in the current TDLib version
  MessageUnsupported();

  

  /// Parse from a json
  MessageUnsupported.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'messageUnsupported';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}