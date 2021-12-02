part of '../tdapi.dart';

class RichText extends TdObject {

  /// Describes a text object inside an instant-view web page
  RichText();

  

  /// a RichText return type can be :
  /// * RichTextPlain
  /// * RichTextBold
  /// * RichTextItalic
  /// * RichTextUnderline
  /// * RichTextStrikethrough
  /// * RichTextFixed
  /// * RichTextUrl
  /// * RichTextEmailAddress
  /// * RichTextSubscript
  /// * RichTextSuperscript
  /// * RichTextMarked
  /// * RichTextPhoneNumber
  /// * RichTextIcon
  /// * RichTextReference
  /// * RichTextAnchor
  /// * RichTextAnchorLink
  /// * RichTexts
  factory RichText.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case RichTextPlain.CONSTRUCTOR:
        return RichTextPlain.fromJson(json);
      case RichTextBold.CONSTRUCTOR:
        return RichTextBold.fromJson(json);
      case RichTextItalic.CONSTRUCTOR:
        return RichTextItalic.fromJson(json);
      case RichTextUnderline.CONSTRUCTOR:
        return RichTextUnderline.fromJson(json);
      case RichTextStrikethrough.CONSTRUCTOR:
        return RichTextStrikethrough.fromJson(json);
      case RichTextFixed.CONSTRUCTOR:
        return RichTextFixed.fromJson(json);
      case RichTextUrl.CONSTRUCTOR:
        return RichTextUrl.fromJson(json);
      case RichTextEmailAddress.CONSTRUCTOR:
        return RichTextEmailAddress.fromJson(json);
      case RichTextSubscript.CONSTRUCTOR:
        return RichTextSubscript.fromJson(json);
      case RichTextSuperscript.CONSTRUCTOR:
        return RichTextSuperscript.fromJson(json);
      case RichTextMarked.CONSTRUCTOR:
        return RichTextMarked.fromJson(json);
      case RichTextPhoneNumber.CONSTRUCTOR:
        return RichTextPhoneNumber.fromJson(json);
      case RichTextIcon.CONSTRUCTOR:
        return RichTextIcon.fromJson(json);
      case RichTextReference.CONSTRUCTOR:
        return RichTextReference.fromJson(json);
      case RichTextAnchor.CONSTRUCTOR:
        return RichTextAnchor.fromJson(json);
      case RichTextAnchorLink.CONSTRUCTOR:
        return RichTextAnchorLink.fromJson(json);
      case RichTexts.CONSTRUCTOR:
        return RichTexts.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'richText';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class RichTextPlain extends RichText {

  /// A plain text
  RichTextPlain({this.text});

  /// [text] Text
  String? text;

  /// Parse from a json
  RichTextPlain.fromJson(Map<String, dynamic> json)  {
    text = json['text'] == null ? null : json['text'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text,
    };
  }

  static const CONSTRUCTOR = 'richTextPlain';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class RichTextBold extends RichText {

  /// A bold rich text
  RichTextBold({this.text});

  /// [text] Text
  RichText? text;

  /// Parse from a json
  RichTextBold.fromJson(Map<String, dynamic> json)  {
    text = json['text'] == null ? null : RichText.fromJson(json['text'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'richTextBold';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class RichTextItalic extends RichText {

  /// An italicized rich text
  RichTextItalic({this.text});

  /// [text] Text
  RichText? text;

  /// Parse from a json
  RichTextItalic.fromJson(Map<String, dynamic> json)  {
    text = json['text'] == null ? null : RichText.fromJson(json['text'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'richTextItalic';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class RichTextUnderline extends RichText {

  /// An underlined rich text
  RichTextUnderline({this.text});

  /// [text] Text
  RichText? text;

  /// Parse from a json
  RichTextUnderline.fromJson(Map<String, dynamic> json)  {
    text = json['text'] == null ? null : RichText.fromJson(json['text'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'richTextUnderline';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class RichTextStrikethrough extends RichText {

  /// A strikethrough rich text
  RichTextStrikethrough({this.text});

  /// [text] Text
  RichText? text;

  /// Parse from a json
  RichTextStrikethrough.fromJson(Map<String, dynamic> json)  {
    text = json['text'] == null ? null : RichText.fromJson(json['text'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'richTextStrikethrough';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class RichTextFixed extends RichText {

  /// A fixed-width rich text
  RichTextFixed({this.text});

  /// [text] Text
  RichText? text;

  /// Parse from a json
  RichTextFixed.fromJson(Map<String, dynamic> json)  {
    text = json['text'] == null ? null : RichText.fromJson(json['text'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'richTextFixed';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class RichTextUrl extends RichText {

  /// A rich text URL link
  RichTextUrl({this.text,
    this.url,
    this.isCached});

  /// [text] Text 
  RichText? text;

  /// [url] URL 
  String? url;

  /// [isCached] True, if the URL has cached instant view server-side
  bool? isCached;

  /// Parse from a json
  RichTextUrl.fromJson(Map<String, dynamic> json)  {
    text = json['text'] == null ? null : RichText.fromJson(json['text'] ?? <String, dynamic>{});
    url = json['url'] == null ? null : json['url'];
    isCached = json['is_cached'] == null ? null : json['is_cached'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
      "url": url,
      "is_cached": isCached,
    };
  }

  static const CONSTRUCTOR = 'richTextUrl';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class RichTextEmailAddress extends RichText {

  /// A rich text email link
  RichTextEmailAddress({this.text,
    this.emailAddress});

  /// [text] Text 
  RichText? text;

  /// [emailAddress] Email address
  String? emailAddress;

  /// Parse from a json
  RichTextEmailAddress.fromJson(Map<String, dynamic> json)  {
    text = json['text'] == null ? null : RichText.fromJson(json['text'] ?? <String, dynamic>{});
    emailAddress = json['email_address'] == null ? null : json['email_address'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
      "email_address": emailAddress,
    };
  }

  static const CONSTRUCTOR = 'richTextEmailAddress';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class RichTextSubscript extends RichText {

  /// A subscript rich text
  RichTextSubscript({this.text});

  /// [text] Text
  RichText? text;

  /// Parse from a json
  RichTextSubscript.fromJson(Map<String, dynamic> json)  {
    text = json['text'] == null ? null : RichText.fromJson(json['text'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'richTextSubscript';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class RichTextSuperscript extends RichText {

  /// A superscript rich text
  RichTextSuperscript({this.text});

  /// [text] Text
  RichText? text;

  /// Parse from a json
  RichTextSuperscript.fromJson(Map<String, dynamic> json)  {
    text = json['text'] == null ? null : RichText.fromJson(json['text'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'richTextSuperscript';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class RichTextMarked extends RichText {

  /// A marked rich text
  RichTextMarked({this.text});

  /// [text] Text
  RichText? text;

  /// Parse from a json
  RichTextMarked.fromJson(Map<String, dynamic> json)  {
    text = json['text'] == null ? null : RichText.fromJson(json['text'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'richTextMarked';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class RichTextPhoneNumber extends RichText {

  /// A rich text phone number
  RichTextPhoneNumber({this.text,
    this.phoneNumber});

  /// [text] Text 
  RichText? text;

  /// [phoneNumber] Phone number
  String? phoneNumber;

  /// Parse from a json
  RichTextPhoneNumber.fromJson(Map<String, dynamic> json)  {
    text = json['text'] == null ? null : RichText.fromJson(json['text'] ?? <String, dynamic>{});
    phoneNumber = json['phone_number'] == null ? null : json['phone_number'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
      "phone_number": phoneNumber,
    };
  }

  static const CONSTRUCTOR = 'richTextPhoneNumber';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class RichTextIcon extends RichText {

  /// A small image inside the text
  RichTextIcon({this.document,
    this.width,
    this.height});

  /// [document] The image represented as a document. The image can be in GIF, JPEG or PNG format
  Document? document;

  /// [width] Width of a bounding box in which the image must be shown; 0 if unknown
  int? width;

  /// [height] Height of a bounding box in which the image must be shown; 0 if unknown
  int? height;

  /// Parse from a json
  RichTextIcon.fromJson(Map<String, dynamic> json)  {
    document = json['document'] == null ? null : Document.fromJson(json['document'] ?? <String, dynamic>{});
    width = json['width'] == null ? null : json['width'];
    height = json['height'] == null ? null : json['height'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "document": document == null ? null : document?.toJson(),
      "width": width,
      "height": height,
    };
  }

  static const CONSTRUCTOR = 'richTextIcon';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class RichTextReference extends RichText {

  /// A reference to a richTexts object on the same web page
  RichTextReference({this.text,
    this.anchorName,
    this.url});

  /// [text] The text 
  RichText? text;

  /// [anchorName] The name of a richTextAnchor object, which is the first element of the target richTexts object 
  String? anchorName;

  /// [url] An HTTP URL, opening the reference
  String? url;

  /// Parse from a json
  RichTextReference.fromJson(Map<String, dynamic> json)  {
    text = json['text'] == null ? null : RichText.fromJson(json['text'] ?? <String, dynamic>{});
    anchorName = json['anchor_name'] == null ? null : json['anchor_name'];
    url = json['url'] == null ? null : json['url'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
      "anchor_name": anchorName,
      "url": url,
    };
  }

  static const CONSTRUCTOR = 'richTextReference';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class RichTextAnchor extends RichText {

  /// An anchor
  RichTextAnchor({this.name});

  /// [name] Anchor name
  String? name;

  /// Parse from a json
  RichTextAnchor.fromJson(Map<String, dynamic> json)  {
    name = json['name'] == null ? null : json['name'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "name": name,
    };
  }

  static const CONSTRUCTOR = 'richTextAnchor';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class RichTextAnchorLink extends RichText {

  /// A link to an anchor on the same web page
  RichTextAnchorLink({this.text,
    this.anchorName,
    this.url});

  /// [text] The link text 
  RichText? text;

  /// [anchorName] The anchor name. If the name is empty, the link must bring back to top 
  String? anchorName;

  /// [url] An HTTP URL, opening the anchor
  String? url;

  /// Parse from a json
  RichTextAnchorLink.fromJson(Map<String, dynamic> json)  {
    text = json['text'] == null ? null : RichText.fromJson(json['text'] ?? <String, dynamic>{});
    anchorName = json['anchor_name'] == null ? null : json['anchor_name'];
    url = json['url'] == null ? null : json['url'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
      "anchor_name": anchorName,
      "url": url,
    };
  }

  static const CONSTRUCTOR = 'richTextAnchorLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class RichTexts extends RichText {

  /// A concatenation of rich texts
  RichTexts({this.texts});

  /// [texts] Texts
  List<RichText>? texts;

  /// Parse from a json
  RichTexts.fromJson(Map<String, dynamic> json)  {
    texts = json['texts'] == null ? null : List<RichText>.from((json['texts'] ?? [])!.map((item) => RichText.fromJson(item ?? <String, dynamic>{})).toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "texts": texts?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'richTexts';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}