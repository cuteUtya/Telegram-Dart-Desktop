part of '../tdapi.dart';

class ReplyMarkup extends TdObject {

  /// Contains a description of a custom keyboard and actions that can be done with it to quickly reply to bots
  ReplyMarkup();

  

  /// a ReplyMarkup return type can be :
  /// * ReplyMarkupRemoveKeyboard
  /// * ReplyMarkupForceReply
  /// * ReplyMarkupShowKeyboard
  /// * ReplyMarkupInlineKeyboard
  factory ReplyMarkup.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case ReplyMarkupRemoveKeyboard.CONSTRUCTOR:
        return ReplyMarkupRemoveKeyboard.fromJson(json);
      case ReplyMarkupForceReply.CONSTRUCTOR:
        return ReplyMarkupForceReply.fromJson(json);
      case ReplyMarkupShowKeyboard.CONSTRUCTOR:
        return ReplyMarkupShowKeyboard.fromJson(json);
      case ReplyMarkupInlineKeyboard.CONSTRUCTOR:
        return ReplyMarkupInlineKeyboard.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'replyMarkup';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ReplyMarkupRemoveKeyboard extends ReplyMarkup {

  /// Instructs application to remove the keyboard once this message has been received. This kind of keyboard can't be received in an incoming message; instead, UpdateChatReplyMarkup with message_id == 0 will be sent
  ReplyMarkupRemoveKeyboard({this.isPersonal});

  /// [isPersonal] True, if the keyboard is removed only for the mentioned users or the target user of a reply
  bool? isPersonal;

  /// Parse from a json
  ReplyMarkupRemoveKeyboard.fromJson(Map<String, dynamic> json)  {
    bool? pre_isPersonal;
    try{
      pre_isPersonal=json['is_personal'];
   }catch(_){}
    isPersonal = pre_isPersonal;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "is_personal": isPersonal,
    };
  }

  static const CONSTRUCTOR = 'replyMarkupRemoveKeyboard';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ReplyMarkupForceReply extends ReplyMarkup {

  /// Instructs application to force a reply to this message
  ReplyMarkupForceReply({this.isPersonal,
    this.inputFieldPlaceholder});

  /// [isPersonal] True, if a forced reply must automatically be shown to the current user. For outgoing messages, specify true to show the forced reply only for the mentioned users and for the target user of a reply
  bool? isPersonal;

  /// [inputFieldPlaceholder] If non-empty, the placeholder to be shown in the input field when the reply is active; 0-64 characters
  String? inputFieldPlaceholder;

  /// Parse from a json
  ReplyMarkupForceReply.fromJson(Map<String, dynamic> json)  {
    bool? pre_isPersonal;
    try{
      pre_isPersonal=json['is_personal'];
   }catch(_){}
    isPersonal = pre_isPersonal;
    String? pre_inputFieldPlaceholder;
    try{
      pre_inputFieldPlaceholder=json['input_field_placeholder'];
   }catch(_){}
    inputFieldPlaceholder = pre_inputFieldPlaceholder;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "is_personal": isPersonal,
      "input_field_placeholder": inputFieldPlaceholder,
    };
  }

  static const CONSTRUCTOR = 'replyMarkupForceReply';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ReplyMarkupShowKeyboard extends ReplyMarkup {

  /// Contains a custom keyboard layout to quickly reply to bots
  ReplyMarkupShowKeyboard({this.rows,
    this.resizeKeyboard,
    this.oneTime,
    this.isPersonal,
    this.inputFieldPlaceholder});

  /// [rows] A list of rows of bot keyboard buttons
  List<List<KeyboardButton>>? rows;

  /// [resizeKeyboard] True, if the application needs to resize the keyboard vertically
  bool? resizeKeyboard;

  /// [oneTime] True, if the application needs to hide the keyboard after use
  bool? oneTime;

  /// [isPersonal] True, if the keyboard must automatically be shown to the current user. For outgoing messages, specify true to show the keyboard only for the mentioned users and for the target user of a reply
  bool? isPersonal;

  /// [inputFieldPlaceholder] If non-empty, the placeholder to be shown in the input field when the keyboard is active; 0-64 characters
  String? inputFieldPlaceholder;

  /// Parse from a json
  ReplyMarkupShowKeyboard.fromJson(Map<String, dynamic> json)  {
    List<List<KeyboardButton>>? pre_rows;
    try{
      pre_rows=List<List<KeyboardButton>>.from((json['rows'] ?? [])!.map((item) => List<KeyboardButton>.from((item ?? [])!.map((innerItem) => KeyboardButton.fromJson(innerItem ?? <String, dynamic>{})).toList())).toList());
   }catch(_){}
    rows = pre_rows;
    bool? pre_resizeKeyboard;
    try{
      pre_resizeKeyboard=json['resize_keyboard'];
   }catch(_){}
    resizeKeyboard = pre_resizeKeyboard;
    bool? pre_oneTime;
    try{
      pre_oneTime=json['one_time'];
   }catch(_){}
    oneTime = pre_oneTime;
    bool? pre_isPersonal;
    try{
      pre_isPersonal=json['is_personal'];
   }catch(_){}
    isPersonal = pre_isPersonal;
    String? pre_inputFieldPlaceholder;
    try{
      pre_inputFieldPlaceholder=json['input_field_placeholder'];
   }catch(_){}
    inputFieldPlaceholder = pre_inputFieldPlaceholder;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "rows": rows?.map((i) => i.map((ii) => ii.toJson()).toList()).toList(),
      "resize_keyboard": resizeKeyboard,
      "one_time": oneTime,
      "is_personal": isPersonal,
      "input_field_placeholder": inputFieldPlaceholder,
    };
  }

  static const CONSTRUCTOR = 'replyMarkupShowKeyboard';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ReplyMarkupInlineKeyboard extends ReplyMarkup {

  /// Contains an inline keyboard layout
  ReplyMarkupInlineKeyboard({this.rows});

  /// [rows] A list of rows of inline keyboard buttons
  List<List<InlineKeyboardButton>>? rows;

  /// Parse from a json
  ReplyMarkupInlineKeyboard.fromJson(Map<String, dynamic> json)  {
    List<List<InlineKeyboardButton>>? pre_rows;
    try{
      pre_rows=List<List<InlineKeyboardButton>>.from((json['rows'] ?? [])!.map((item) => List<InlineKeyboardButton>.from((item ?? [])!.map((innerItem) => InlineKeyboardButton.fromJson(innerItem ?? <String, dynamic>{})).toList())).toList());
   }catch(_){}
    rows = pre_rows;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "rows": rows?.map((i) => i.map((ii) => ii.toJson()).toList()).toList(),
    };
  }

  static const CONSTRUCTOR = 'replyMarkupInlineKeyboard';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}