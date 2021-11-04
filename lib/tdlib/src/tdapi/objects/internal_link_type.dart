part of '../tdapi.dart';

class InternalLinkType extends TdObject {

  /// Describes an internal https://t.me or tg: link, which must be processed by the app in a special way
  InternalLinkType();

  

  /// a InternalLinkType return type can be :
  /// * InternalLinkTypeActiveSessions
  /// * InternalLinkTypeAuthenticationCode
  /// * InternalLinkTypeBackground
  /// * InternalLinkTypeBotStart
  /// * InternalLinkTypeBotStartInGroup
  /// * InternalLinkTypeChangePhoneNumber
  /// * InternalLinkTypeChatInvite
  /// * InternalLinkTypeFilterSettings
  /// * InternalLinkTypeGame
  /// * InternalLinkTypeLanguagePack
  /// * InternalLinkTypeMessage
  /// * InternalLinkTypeMessageDraft
  /// * InternalLinkTypePassportDataRequest
  /// * InternalLinkTypePhoneNumberConfirmation
  /// * InternalLinkTypeProxy
  /// * InternalLinkTypePublicChat
  /// * InternalLinkTypeQrCodeAuthentication
  /// * InternalLinkTypeSettings
  /// * InternalLinkTypeStickerSet
  /// * InternalLinkTypeTheme
  /// * InternalLinkTypeThemeSettings
  /// * InternalLinkTypeUnknownDeepLink
  /// * InternalLinkTypeVoiceChat
  factory InternalLinkType.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case InternalLinkTypeActiveSessions.CONSTRUCTOR:
        return InternalLinkTypeActiveSessions.fromJson(json);
      case InternalLinkTypeAuthenticationCode.CONSTRUCTOR:
        return InternalLinkTypeAuthenticationCode.fromJson(json);
      case InternalLinkTypeBackground.CONSTRUCTOR:
        return InternalLinkTypeBackground.fromJson(json);
      case InternalLinkTypeBotStart.CONSTRUCTOR:
        return InternalLinkTypeBotStart.fromJson(json);
      case InternalLinkTypeBotStartInGroup.CONSTRUCTOR:
        return InternalLinkTypeBotStartInGroup.fromJson(json);
      case InternalLinkTypeChangePhoneNumber.CONSTRUCTOR:
        return InternalLinkTypeChangePhoneNumber.fromJson(json);
      case InternalLinkTypeChatInvite.CONSTRUCTOR:
        return InternalLinkTypeChatInvite.fromJson(json);
      case InternalLinkTypeFilterSettings.CONSTRUCTOR:
        return InternalLinkTypeFilterSettings.fromJson(json);
      case InternalLinkTypeGame.CONSTRUCTOR:
        return InternalLinkTypeGame.fromJson(json);
      case InternalLinkTypeLanguagePack.CONSTRUCTOR:
        return InternalLinkTypeLanguagePack.fromJson(json);
      case InternalLinkTypeMessage.CONSTRUCTOR:
        return InternalLinkTypeMessage.fromJson(json);
      case InternalLinkTypeMessageDraft.CONSTRUCTOR:
        return InternalLinkTypeMessageDraft.fromJson(json);
      case InternalLinkTypePassportDataRequest.CONSTRUCTOR:
        return InternalLinkTypePassportDataRequest.fromJson(json);
      case InternalLinkTypePhoneNumberConfirmation.CONSTRUCTOR:
        return InternalLinkTypePhoneNumberConfirmation.fromJson(json);
      case InternalLinkTypeProxy.CONSTRUCTOR:
        return InternalLinkTypeProxy.fromJson(json);
      case InternalLinkTypePublicChat.CONSTRUCTOR:
        return InternalLinkTypePublicChat.fromJson(json);
      case InternalLinkTypeQrCodeAuthentication.CONSTRUCTOR:
        return InternalLinkTypeQrCodeAuthentication.fromJson(json);
      case InternalLinkTypeSettings.CONSTRUCTOR:
        return InternalLinkTypeSettings.fromJson(json);
      case InternalLinkTypeStickerSet.CONSTRUCTOR:
        return InternalLinkTypeStickerSet.fromJson(json);
      case InternalLinkTypeTheme.CONSTRUCTOR:
        return InternalLinkTypeTheme.fromJson(json);
      case InternalLinkTypeThemeSettings.CONSTRUCTOR:
        return InternalLinkTypeThemeSettings.fromJson(json);
      case InternalLinkTypeUnknownDeepLink.CONSTRUCTOR:
        return InternalLinkTypeUnknownDeepLink.fromJson(json);
      case InternalLinkTypeVoiceChat.CONSTRUCTOR:
        return InternalLinkTypeVoiceChat.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'internalLinkType';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeActiveSessions extends InternalLinkType {

  /// The link is a link to the active sessions section of the app. Use getActiveSessions to handle the link
  InternalLinkTypeActiveSessions();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeActiveSessions.fromJson(Map<String, dynamic> json)  {
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeActiveSessions';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeAuthenticationCode extends InternalLinkType {

  /// The link contains an authentication code. Call checkAuthenticationCode with the code if the current authorization state is authorizationStateWaitCode
  InternalLinkTypeAuthenticationCode({this.code});

  /// [code] The authentication code
  String? code;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeAuthenticationCode.fromJson(Map<String, dynamic> json)  {
    code = json['code'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "code": code,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeAuthenticationCode';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeBackground extends InternalLinkType {

  /// The link is a link to a background. Call searchBackground with the given background name to process the link
  InternalLinkTypeBackground({this.backgroundName});

  /// [backgroundName] Name of the background
  String? backgroundName;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeBackground.fromJson(Map<String, dynamic> json)  {
    backgroundName = json['background_name'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "background_name": backgroundName,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeBackground';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeBotStart extends InternalLinkType {

  /// The link is a link to a chat with a Telegram bot. Call searchPublicChat with the given bot username, check that the user is a bot, show START button in the chat with the bot,. and then call sendBotStartMessage with the given start parameter after the button is pressed
  InternalLinkTypeBotStart({this.botUsername,
    this.startParameter});

  /// [botUsername] Username of the bot
  String? botUsername;

  /// [startParameter] The parameter to be passed to sendBotStartMessage
  String? startParameter;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeBotStart.fromJson(Map<String, dynamic> json)  {
    botUsername = json['bot_username'];
    startParameter = json['start_parameter'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "bot_username": botUsername,
      "start_parameter": startParameter,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeBotStart';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeBotStartInGroup extends InternalLinkType {

  /// The link is a link to a Telegram bot, which is supposed to be added to a group chat. Call searchPublicChat with the given bot username, check that the user is a bot and can be added to groups,. ask the current user to select a group to add the bot to, and then call sendBotStartMessage with the given start parameter and the chosen group chat. Bots can be added to a public group only by administrators of the group
  InternalLinkTypeBotStartInGroup({this.botUsername,
    this.startParameter});

  /// [botUsername] Username of the bot
  String? botUsername;

  /// [startParameter] The parameter to be passed to sendBotStartMessage
  String? startParameter;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeBotStartInGroup.fromJson(Map<String, dynamic> json)  {
    botUsername = json['bot_username'];
    startParameter = json['start_parameter'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "bot_username": botUsername,
      "start_parameter": startParameter,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeBotStartInGroup';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeChangePhoneNumber extends InternalLinkType {

  /// The link is a link to the change phone number section of the app
  InternalLinkTypeChangePhoneNumber();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeChangePhoneNumber.fromJson(Map<String, dynamic> json)  {
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeChangePhoneNumber';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeChatInvite extends InternalLinkType {

  /// The link is a chat invite link. Call checkChatInviteLink with the given invite link to process the link
  InternalLinkTypeChatInvite({this.inviteLink});

  /// [inviteLink] Internal representation of the invite link
  String? inviteLink;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeChatInvite.fromJson(Map<String, dynamic> json)  {
    inviteLink = json['invite_link'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "invite_link": inviteLink,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeChatInvite';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeFilterSettings extends InternalLinkType {

  /// The link is a link to the filter settings section of the app
  InternalLinkTypeFilterSettings();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeFilterSettings.fromJson(Map<String, dynamic> json)  {
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeFilterSettings';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeGame extends InternalLinkType {

  /// The link is a link to a game. Call searchPublicChat with the given bot username, check that the user is a bot, ask the current user to select a chat to send the game, and then call sendMessage with inputMessageGame
  InternalLinkTypeGame({this.botUsername,
    this.gameShortName});

  /// [botUsername] Username of the bot that owns the game
  String? botUsername;

  /// [gameShortName] Short name of the game
  String? gameShortName;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeGame.fromJson(Map<String, dynamic> json)  {
    botUsername = json['bot_username'];
    gameShortName = json['game_short_name'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "bot_username": botUsername,
      "game_short_name": gameShortName,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeGame';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeLanguagePack extends InternalLinkType {

  /// The link is a link to a language pack. Call getLanguagePackInfo with the given language pack identifier to process the link
  InternalLinkTypeLanguagePack({this.languagePackId});

  /// [languagePackId] Language pack identifier
  String? languagePackId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeLanguagePack.fromJson(Map<String, dynamic> json)  {
    languagePackId = json['language_pack_id'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "language_pack_id": languagePackId,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeLanguagePack';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeMessage extends InternalLinkType {

  /// The link is a link to a Telegram message. Call getMessageLinkInfo with the given URL to process the link
  InternalLinkTypeMessage({this.url});

  /// [url] URL to be passed to getMessageLinkInfo
  String? url;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeMessage.fromJson(Map<String, dynamic> json)  {
    url = json['url'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "url": url,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeMessage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeMessageDraft extends InternalLinkType {

  /// The link contains a message draft text. A share screen needs to be shown to the user, then the chosen chat must be opened and the text is added to the input field
  InternalLinkTypeMessageDraft({this.text,
    this.containsLink});

  /// [text] Message draft text
  FormattedText? text;

  /// [containsLink] True, if the first line of the text contains a link. If true, the input field needs to be focused and the text after the link must be selected
  bool? containsLink;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeMessageDraft.fromJson(Map<String, dynamic> json)  {
    text = FormattedText.fromJson(json['text'] ?? <String, dynamic>{});
    containsLink = json['contains_link'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
      "contains_link": containsLink,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeMessageDraft';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypePassportDataRequest extends InternalLinkType {

  /// The link contains a request of Telegram passport data. Call getPassportAuthorizationForm with the given parameters to process the link if the link was received from outside of the app, otherwise ignore it
  InternalLinkTypePassportDataRequest({this.botUserId,
    this.scope,
    this.publicKey,
    this.nonce,
    this.callbackUrl});

  /// [botUserId] User identifier of the service's bot
  int? botUserId;

  /// [scope] Telegram Passport element types requested by the service 
  String? scope;

  /// [publicKey] Service's public key 
  String? publicKey;

  /// [nonce] Unique request identifier provided by the service
  String? nonce;

  /// [callbackUrl] An HTTP URL to open once the request is finished or canceled with the parameter tg_passport=success or tg_passport=cancel respectively. If empty, then the link tgbot{bot_user_id}://passport/success or tgbot{bot_user_id}://passport/cancel needs to be opened instead
  String? callbackUrl;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypePassportDataRequest.fromJson(Map<String, dynamic> json)  {
    botUserId = json['bot_user_id'];
    scope = json['scope'];
    publicKey = json['public_key'];
    nonce = json['nonce'];
    callbackUrl = json['callback_url'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "bot_user_id": botUserId,
      "scope": scope,
      "public_key": publicKey,
      "nonce": nonce,
      "callback_url": callbackUrl,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypePassportDataRequest';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypePhoneNumberConfirmation extends InternalLinkType {

  /// The link can be used to confirm ownership of a phone number to prevent account deletion. Call sendPhoneNumberConfirmationCode with the given hash and phone number to process the link
  InternalLinkTypePhoneNumberConfirmation({this.hash,
    this.phoneNumber});

  /// [hash] Hash value from the link
  String? hash;

  /// [phoneNumber] Phone number value from the link
  String? phoneNumber;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypePhoneNumberConfirmation.fromJson(Map<String, dynamic> json)  {
    hash = json['hash'];
    phoneNumber = json['phone_number'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "hash": hash,
      "phone_number": phoneNumber,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypePhoneNumberConfirmation';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeProxy extends InternalLinkType {

  /// The link is a link to a proxy. Call addProxy with the given parameters to process the link and add the proxy
  InternalLinkTypeProxy({this.server,
    this.port,
    this.type});

  /// [server] Proxy server IP address
  String? server;

  /// [port] Proxy server port 
  int? port;

  /// [type] Type of the proxy
  ProxyType? type;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeProxy.fromJson(Map<String, dynamic> json)  {
    server = json['server'];
    port = json['port'];
    type = ProxyType.fromJson(json['type'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "server": server,
      "port": port,
      "type": type == null ? null : type?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeProxy';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypePublicChat extends InternalLinkType {

  /// The link is a link to a chat by its username. Call searchPublicChat with the given chat username to process the link
  InternalLinkTypePublicChat({this.chatUsername});

  /// [chatUsername] Username of the chat
  String? chatUsername;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypePublicChat.fromJson(Map<String, dynamic> json)  {
    chatUsername = json['chat_username'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_username": chatUsername,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypePublicChat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeQrCodeAuthentication extends InternalLinkType {

  /// The link can be used to login the current user on another device, but it must be scanned from QR-code using in-app camera. An alert similar to. "This code can be used to allow someone to log in to your Telegram account. To confirm Telegram login, please go to Settings
  InternalLinkTypeQrCodeAuthentication();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeQrCodeAuthentication.fromJson(Map<String, dynamic> json)  {
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeQrCodeAuthentication';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeSettings extends InternalLinkType {

  /// The link is a link to app settings
  InternalLinkTypeSettings();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeSettings.fromJson(Map<String, dynamic> json)  {
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeSettings';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeStickerSet extends InternalLinkType {

  /// The link is a link to a sticker set. Call searchStickerSet with the given sticker set name to process the link and show the sticker set
  InternalLinkTypeStickerSet({this.stickerSetName});

  /// [stickerSetName] Name of the sticker set
  String? stickerSetName;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeStickerSet.fromJson(Map<String, dynamic> json)  {
    stickerSetName = json['sticker_set_name'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sticker_set_name": stickerSetName,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeStickerSet';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeTheme extends InternalLinkType {

  /// The link is a link to a theme. TDLib has no theme support yet
  InternalLinkTypeTheme({this.themeName});

  /// [themeName] Name of the theme
  String? themeName;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeTheme.fromJson(Map<String, dynamic> json)  {
    themeName = json['theme_name'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "theme_name": themeName,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeTheme';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeThemeSettings extends InternalLinkType {

  /// The link is a link to the theme settings section of the app
  InternalLinkTypeThemeSettings();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeThemeSettings.fromJson(Map<String, dynamic> json)  {
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeThemeSettings';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeUnknownDeepLink extends InternalLinkType {

  /// The link is an unknown tg: link. Call getDeepLinkInfo to process the link
  InternalLinkTypeUnknownDeepLink({this.link});

  /// [link] Link to be passed to getDeepLinkInfo
  String? link;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeUnknownDeepLink.fromJson(Map<String, dynamic> json)  {
    link = json['link'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "link": link,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeUnknownDeepLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InternalLinkTypeVoiceChat extends InternalLinkType {

  /// The link is a link to a voice chat. Call searchPublicChat with the given chat username, and then joinGoupCall with the given invite hash to process the link
  InternalLinkTypeVoiceChat({this.chatUsername,
    this.inviteHash,
    this.isLiveStream});

  /// [chatUsername] Username of the chat with the voice chat
  String? chatUsername;

  /// [inviteHash] If non-empty, invite hash to be used to join the voice chat without being muted by administrators
  String? inviteHash;

  /// [isLiveStream] True, if the voice chat is expected to be a live stream in a channel or a broadcast group
  bool? isLiveStream;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  InternalLinkTypeVoiceChat.fromJson(Map<String, dynamic> json)  {
    chatUsername = json['chat_username'];
    inviteHash = json['invite_hash'];
    isLiveStream = json['is_live_stream'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_username": chatUsername,
      "invite_hash": inviteHash,
      "is_live_stream": isLiveStream,
    };
  }

  static const CONSTRUCTOR = 'internalLinkTypeVoiceChat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}