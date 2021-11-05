part of '../tdapi.dart';

class PageBlock extends TdObject {
  /// Describes a block of an instant view web page
  PageBlock();

  /// a PageBlock return type can be :
  /// * PageBlockTitle
  /// * PageBlockSubtitle
  /// * PageBlockAuthorDate
  /// * PageBlockHeader
  /// * PageBlockSubheader
  /// * PageBlockKicker
  /// * PageBlockParagraph
  /// * PageBlockPreformatted
  /// * PageBlockFooter
  /// * PageBlockDivider
  /// * PageBlockAnchor
  /// * PageBlockList
  /// * PageBlockBlockQuote
  /// * PageBlockPullQuote
  /// * PageBlockAnimation
  /// * PageBlockAudio
  /// * PageBlockPhoto
  /// * PageBlockVideo
  /// * PageBlockVoiceNote
  /// * PageBlockCover
  /// * PageBlockEmbedded
  /// * PageBlockEmbeddedPost
  /// * PageBlockCollage
  /// * PageBlockSlideshow
  /// * PageBlockChatLink
  /// * PageBlockTable
  /// * PageBlockDetails
  /// * PageBlockRelatedArticles
  /// * PageBlockMap
  factory PageBlock.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PageBlockTitle.CONSTRUCTOR:
        return PageBlockTitle.fromJson(json);
      case PageBlockSubtitle.CONSTRUCTOR:
        return PageBlockSubtitle.fromJson(json);
      case PageBlockAuthorDate.CONSTRUCTOR:
        return PageBlockAuthorDate.fromJson(json);
      case PageBlockHeader.CONSTRUCTOR:
        return PageBlockHeader.fromJson(json);
      case PageBlockSubheader.CONSTRUCTOR:
        return PageBlockSubheader.fromJson(json);
      case PageBlockKicker.CONSTRUCTOR:
        return PageBlockKicker.fromJson(json);
      case PageBlockParagraph.CONSTRUCTOR:
        return PageBlockParagraph.fromJson(json);
      case PageBlockPreformatted.CONSTRUCTOR:
        return PageBlockPreformatted.fromJson(json);
      case PageBlockFooter.CONSTRUCTOR:
        return PageBlockFooter.fromJson(json);
      case PageBlockDivider.CONSTRUCTOR:
        return PageBlockDivider.fromJson(json);
      case PageBlockAnchor.CONSTRUCTOR:
        return PageBlockAnchor.fromJson(json);
      case PageBlockList.CONSTRUCTOR:
        return PageBlockList.fromJson(json);
      case PageBlockBlockQuote.CONSTRUCTOR:
        return PageBlockBlockQuote.fromJson(json);
      case PageBlockPullQuote.CONSTRUCTOR:
        return PageBlockPullQuote.fromJson(json);
      case PageBlockAnimation.CONSTRUCTOR:
        return PageBlockAnimation.fromJson(json);
      case PageBlockAudio.CONSTRUCTOR:
        return PageBlockAudio.fromJson(json);
      case PageBlockPhoto.CONSTRUCTOR:
        return PageBlockPhoto.fromJson(json);
      case PageBlockVideo.CONSTRUCTOR:
        return PageBlockVideo.fromJson(json);
      case PageBlockVoiceNote.CONSTRUCTOR:
        return PageBlockVoiceNote.fromJson(json);
      case PageBlockCover.CONSTRUCTOR:
        return PageBlockCover.fromJson(json);
      case PageBlockEmbedded.CONSTRUCTOR:
        return PageBlockEmbedded.fromJson(json);
      case PageBlockEmbeddedPost.CONSTRUCTOR:
        return PageBlockEmbeddedPost.fromJson(json);
      case PageBlockCollage.CONSTRUCTOR:
        return PageBlockCollage.fromJson(json);
      case PageBlockSlideshow.CONSTRUCTOR:
        return PageBlockSlideshow.fromJson(json);
      case PageBlockChatLink.CONSTRUCTOR:
        return PageBlockChatLink.fromJson(json);
      case PageBlockTable.CONSTRUCTOR:
        return PageBlockTable.fromJson(json);
      case PageBlockDetails.CONSTRUCTOR:
        return PageBlockDetails.fromJson(json);
      case PageBlockRelatedArticles.CONSTRUCTOR:
        return PageBlockRelatedArticles.fromJson(json);
      case PageBlockMap.CONSTRUCTOR:
        return PageBlockMap.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  static const CONSTRUCTOR = 'pageBlock';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockTitle extends PageBlock {
  /// The title of a page
  PageBlockTitle({this.title});

  /// [title] Title
  RichText? title;

  /// Parse from a json
  PageBlockTitle.fromJson(Map<String, dynamic> json) {
    RichText? pre_title;
    try {
      pre_title = RichText.fromJson(json['title'] ?? <String, dynamic>{});
    } catch (_) {}
    title = pre_title;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "title": title == null ? null : title?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockTitle';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockSubtitle extends PageBlock {
  /// The subtitle of a page
  PageBlockSubtitle({this.subtitle});

  /// [subtitle] Subtitle
  RichText? subtitle;

  /// Parse from a json
  PageBlockSubtitle.fromJson(Map<String, dynamic> json) {
    RichText? pre_subtitle;
    try {
      pre_subtitle = RichText.fromJson(json['subtitle'] ?? <String, dynamic>{});
    } catch (_) {}
    subtitle = pre_subtitle;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "subtitle": subtitle == null ? null : subtitle?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockSubtitle';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockAuthorDate extends PageBlock {
  /// The author and publishing date of a page
  PageBlockAuthorDate({this.author, this.publishDate});

  /// [author] Author
  RichText? author;

  /// [publishDate] Point in time (Unix timestamp) when the article was published; 0 if unknown
  int? publishDate;

  /// Parse from a json
  PageBlockAuthorDate.fromJson(Map<String, dynamic> json) {
    RichText? pre_author;
    try {
      pre_author = RichText.fromJson(json['author'] ?? <String, dynamic>{});
    } catch (_) {}
    author = pre_author;
    int? pre_publishDate;
    try {
      pre_publishDate = json['publish_date'];
    } catch (_) {}
    publishDate = pre_publishDate;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "author": author == null ? null : author?.toJson(),
      "publish_date": publishDate,
    };
  }

  static const CONSTRUCTOR = 'pageBlockAuthorDate';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockHeader extends PageBlock {
  /// A header
  PageBlockHeader({this.header});

  /// [header] Header
  RichText? header;

  /// Parse from a json
  PageBlockHeader.fromJson(Map<String, dynamic> json) {
    RichText? pre_header;
    try {
      pre_header = RichText.fromJson(json['header'] ?? <String, dynamic>{});
    } catch (_) {}
    header = pre_header;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "header": header == null ? null : header?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockHeader';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockSubheader extends PageBlock {
  /// A subheader
  PageBlockSubheader({this.subheader});

  /// [subheader] Subheader
  RichText? subheader;

  /// Parse from a json
  PageBlockSubheader.fromJson(Map<String, dynamic> json) {
    RichText? pre_subheader;
    try {
      pre_subheader =
          RichText.fromJson(json['subheader'] ?? <String, dynamic>{});
    } catch (_) {}
    subheader = pre_subheader;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "subheader": subheader == null ? null : subheader?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockSubheader';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockKicker extends PageBlock {
  /// A kicker
  PageBlockKicker({this.kicker});

  /// [kicker] Kicker
  RichText? kicker;

  /// Parse from a json
  PageBlockKicker.fromJson(Map<String, dynamic> json) {
    RichText? pre_kicker;
    try {
      pre_kicker = RichText.fromJson(json['kicker'] ?? <String, dynamic>{});
    } catch (_) {}
    kicker = pre_kicker;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "kicker": kicker == null ? null : kicker?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockKicker';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockParagraph extends PageBlock {
  /// A text paragraph
  PageBlockParagraph({this.text});

  /// [text] Paragraph text
  RichText? text;

  /// Parse from a json
  PageBlockParagraph.fromJson(Map<String, dynamic> json) {
    RichText? pre_text;
    try {
      pre_text = RichText.fromJson(json['text'] ?? <String, dynamic>{});
    } catch (_) {}
    text = pre_text;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockParagraph';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockPreformatted extends PageBlock {
  /// A preformatted text paragraph
  PageBlockPreformatted({this.text, this.language});

  /// [text] Paragraph text
  RichText? text;

  /// [language] Programming language for which the text needs to be formatted
  String? language;

  /// Parse from a json
  PageBlockPreformatted.fromJson(Map<String, dynamic> json) {
    RichText? pre_text;
    try {
      pre_text = RichText.fromJson(json['text'] ?? <String, dynamic>{});
    } catch (_) {}
    text = pre_text;
    String? pre_language;
    try {
      pre_language = json['language'];
    } catch (_) {}
    language = pre_language;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
      "language": language,
    };
  }

  static const CONSTRUCTOR = 'pageBlockPreformatted';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockFooter extends PageBlock {
  /// The footer of a page
  PageBlockFooter({this.footer});

  /// [footer] Footer
  RichText? footer;

  /// Parse from a json
  PageBlockFooter.fromJson(Map<String, dynamic> json) {
    RichText? pre_footer;
    try {
      pre_footer = RichText.fromJson(json['footer'] ?? <String, dynamic>{});
    } catch (_) {}
    footer = pre_footer;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "footer": footer == null ? null : footer?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockFooter';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockDivider extends PageBlock {
  /// An empty block separating a page
  PageBlockDivider();

  /// Parse from a json
  PageBlockDivider.fromJson(Map<String, dynamic> json);

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'pageBlockDivider';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockAnchor extends PageBlock {
  /// An invisible anchor on a page, which can be used in a URL to open the page from the specified anchor
  PageBlockAnchor({this.name});

  /// [name] Name of the anchor
  String? name;

  /// Parse from a json
  PageBlockAnchor.fromJson(Map<String, dynamic> json) {
    String? pre_name;
    try {
      pre_name = json['name'];
    } catch (_) {}
    name = pre_name;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "name": name,
    };
  }

  static const CONSTRUCTOR = 'pageBlockAnchor';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockList extends PageBlock {
  /// A list of data blocks
  PageBlockList({this.items});

  /// [items] The items of the list
  List<PageBlockListItem>? items;

  /// Parse from a json
  PageBlockList.fromJson(Map<String, dynamic> json) {
    List<PageBlockListItem>? pre_items;
    try {
      pre_items = List<PageBlockListItem>.from((json['items'] ?? [])!
          .map(
              (item) => PageBlockListItem.fromJson(item ?? <String, dynamic>{}))
          .toList());
    } catch (_) {}
    items = pre_items;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "items": items?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockList';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockBlockQuote extends PageBlock {
  /// A block quote
  PageBlockBlockQuote({this.text, this.credit});

  /// [text] Quote text
  RichText? text;

  /// [credit] Quote credit
  RichText? credit;

  /// Parse from a json
  PageBlockBlockQuote.fromJson(Map<String, dynamic> json) {
    RichText? pre_text;
    try {
      pre_text = RichText.fromJson(json['text'] ?? <String, dynamic>{});
    } catch (_) {}
    text = pre_text;
    RichText? pre_credit;
    try {
      pre_credit = RichText.fromJson(json['credit'] ?? <String, dynamic>{});
    } catch (_) {}
    credit = pre_credit;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
      "credit": credit == null ? null : credit?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockBlockQuote';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockPullQuote extends PageBlock {
  /// A pull quote
  PageBlockPullQuote({this.text, this.credit});

  /// [text] Quote text
  RichText? text;

  /// [credit] Quote credit
  RichText? credit;

  /// Parse from a json
  PageBlockPullQuote.fromJson(Map<String, dynamic> json) {
    RichText? pre_text;
    try {
      pre_text = RichText.fromJson(json['text'] ?? <String, dynamic>{});
    } catch (_) {}
    text = pre_text;
    RichText? pre_credit;
    try {
      pre_credit = RichText.fromJson(json['credit'] ?? <String, dynamic>{});
    } catch (_) {}
    credit = pre_credit;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
      "credit": credit == null ? null : credit?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockPullQuote';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockAnimation extends PageBlock {
  /// An animation
  PageBlockAnimation({this.animation, this.caption, this.needAutoplay});

  /// [animation] Animation file; may be null
  Animation? animation;

  /// [caption] Animation caption
  PageBlockCaption? caption;

  /// [needAutoplay] True, if the animation must be played automatically
  bool? needAutoplay;

  /// Parse from a json
  PageBlockAnimation.fromJson(Map<String, dynamic> json) {
    Animation? pre_animation;
    try {
      pre_animation =
          Animation.fromJson(json['animation'] ?? <String, dynamic>{});
    } catch (_) {}
    animation = pre_animation;
    PageBlockCaption? pre_caption;
    try {
      pre_caption =
          PageBlockCaption.fromJson(json['caption'] ?? <String, dynamic>{});
    } catch (_) {}
    caption = pre_caption;
    bool? pre_needAutoplay;
    try {
      pre_needAutoplay = json['need_autoplay'];
    } catch (_) {}
    needAutoplay = pre_needAutoplay;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "animation": animation == null ? null : animation?.toJson(),
      "caption": caption == null ? null : caption?.toJson(),
      "need_autoplay": needAutoplay,
    };
  }

  static const CONSTRUCTOR = 'pageBlockAnimation';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockAudio extends PageBlock {
  /// An audio file
  PageBlockAudio({this.audio, this.caption});

  /// [audio] Audio file; may be null
  Audio? audio;

  /// [caption] Audio file caption
  PageBlockCaption? caption;

  /// Parse from a json
  PageBlockAudio.fromJson(Map<String, dynamic> json) {
    Audio? pre_audio;
    try {
      pre_audio = Audio.fromJson(json['audio'] ?? <String, dynamic>{});
    } catch (_) {}
    audio = pre_audio;
    PageBlockCaption? pre_caption;
    try {
      pre_caption =
          PageBlockCaption.fromJson(json['caption'] ?? <String, dynamic>{});
    } catch (_) {}
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

  static const CONSTRUCTOR = 'pageBlockAudio';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockPhoto extends PageBlock {
  /// A photo
  PageBlockPhoto({this.photo, this.caption, this.url});

  /// [photo] Photo file; may be null
  Photo? photo;

  /// [caption] Photo caption
  PageBlockCaption? caption;

  /// [url] URL that needs to be opened when the photo is clicked
  String? url;

  /// Parse from a json
  PageBlockPhoto.fromJson(Map<String, dynamic> json) {
    Photo? pre_photo;
    try {
      pre_photo = Photo.fromJson(json['photo'] ?? <String, dynamic>{});
    } catch (_) {}
    photo = pre_photo;
    PageBlockCaption? pre_caption;
    try {
      pre_caption =
          PageBlockCaption.fromJson(json['caption'] ?? <String, dynamic>{});
    } catch (_) {}
    caption = pre_caption;
    String? pre_url;
    try {
      pre_url = json['url'];
    } catch (_) {}
    url = pre_url;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "photo": photo == null ? null : photo?.toJson(),
      "caption": caption == null ? null : caption?.toJson(),
      "url": url,
    };
  }

  static const CONSTRUCTOR = 'pageBlockPhoto';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockVideo extends PageBlock {
  /// A video
  PageBlockVideo({this.video, this.caption, this.needAutoplay, this.isLooped});

  /// [video] Video file; may be null
  Video? video;

  /// [caption] Video caption
  PageBlockCaption? caption;

  /// [needAutoplay] True, if the video must be played automatically
  bool? needAutoplay;

  /// [isLooped] True, if the video must be looped
  bool? isLooped;

  /// Parse from a json
  PageBlockVideo.fromJson(Map<String, dynamic> json) {
    Video? pre_video;
    try {
      pre_video = Video.fromJson(json['video'] ?? <String, dynamic>{});
    } catch (_) {}
    video = pre_video;
    PageBlockCaption? pre_caption;
    try {
      pre_caption =
          PageBlockCaption.fromJson(json['caption'] ?? <String, dynamic>{});
    } catch (_) {}
    caption = pre_caption;
    bool? pre_needAutoplay;
    try {
      pre_needAutoplay = json['need_autoplay'];
    } catch (_) {}
    needAutoplay = pre_needAutoplay;
    bool? pre_isLooped;
    try {
      pre_isLooped = json['is_looped'];
    } catch (_) {}
    isLooped = pre_isLooped;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "video": video == null ? null : video?.toJson(),
      "caption": caption == null ? null : caption?.toJson(),
      "need_autoplay": needAutoplay,
      "is_looped": isLooped,
    };
  }

  static const CONSTRUCTOR = 'pageBlockVideo';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockVoiceNote extends PageBlock {
  /// A voice note
  PageBlockVoiceNote({this.voiceNote, this.caption});

  /// [voiceNote] Voice note; may be null
  VoiceNote? voiceNote;

  /// [caption] Voice note caption
  PageBlockCaption? caption;

  /// Parse from a json
  PageBlockVoiceNote.fromJson(Map<String, dynamic> json) {
    VoiceNote? pre_voiceNote;
    try {
      pre_voiceNote =
          VoiceNote.fromJson(json['voice_note'] ?? <String, dynamic>{});
    } catch (_) {}
    voiceNote = pre_voiceNote;
    PageBlockCaption? pre_caption;
    try {
      pre_caption =
          PageBlockCaption.fromJson(json['caption'] ?? <String, dynamic>{});
    } catch (_) {}
    caption = pre_caption;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "voice_note": voiceNote == null ? null : voiceNote?.toJson(),
      "caption": caption == null ? null : caption?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockVoiceNote';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockCover extends PageBlock {
  /// A page cover
  PageBlockCover({this.cover});

  /// [cover] Cover
  PageBlock? cover;

  /// Parse from a json
  PageBlockCover.fromJson(Map<String, dynamic> json) {
    PageBlock? pre_cover;
    try {
      pre_cover = PageBlock.fromJson(json['cover'] ?? <String, dynamic>{});
    } catch (_) {}
    cover = pre_cover;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "cover": cover == null ? null : cover?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockCover';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockEmbedded extends PageBlock {
  /// An embedded web page
  PageBlockEmbedded(
      {this.url,
      this.html,
      this.posterPhoto,
      this.width,
      this.height,
      this.caption,
      this.isFullWidth,
      this.allowScrolling});

  /// [url] Web page URL, if available
  String? url;

  /// [html] HTML-markup of the embedded page
  String? html;

  /// [posterPhoto] Poster photo, if available; may be null
  Photo? posterPhoto;

  /// [width] Block width; 0 if unknown
  int? width;

  /// [height] Block height; 0 if unknown
  int? height;

  /// [caption] Block caption
  PageBlockCaption? caption;

  /// [isFullWidth] True, if the block must be full width
  bool? isFullWidth;

  /// [allowScrolling] True, if scrolling needs to be allowed
  bool? allowScrolling;

  /// Parse from a json
  PageBlockEmbedded.fromJson(Map<String, dynamic> json) {
    String? pre_url;
    try {
      pre_url = json['url'];
    } catch (_) {}
    url = pre_url;
    String? pre_html;
    try {
      pre_html = json['html'];
    } catch (_) {}
    html = pre_html;
    Photo? pre_posterPhoto;
    try {
      pre_posterPhoto =
          Photo.fromJson(json['poster_photo'] ?? <String, dynamic>{});
    } catch (_) {}
    posterPhoto = pre_posterPhoto;
    int? pre_width;
    try {
      pre_width = json['width'];
    } catch (_) {}
    width = pre_width;
    int? pre_height;
    try {
      pre_height = json['height'];
    } catch (_) {}
    height = pre_height;
    PageBlockCaption? pre_caption;
    try {
      pre_caption =
          PageBlockCaption.fromJson(json['caption'] ?? <String, dynamic>{});
    } catch (_) {}
    caption = pre_caption;
    bool? pre_isFullWidth;
    try {
      pre_isFullWidth = json['is_full_width'];
    } catch (_) {}
    isFullWidth = pre_isFullWidth;
    bool? pre_allowScrolling;
    try {
      pre_allowScrolling = json['allow_scrolling'];
    } catch (_) {}
    allowScrolling = pre_allowScrolling;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "url": url,
      "html": html,
      "poster_photo": posterPhoto == null ? null : posterPhoto?.toJson(),
      "width": width,
      "height": height,
      "caption": caption == null ? null : caption?.toJson(),
      "is_full_width": isFullWidth,
      "allow_scrolling": allowScrolling,
    };
  }

  static const CONSTRUCTOR = 'pageBlockEmbedded';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockEmbeddedPost extends PageBlock {
  /// An embedded post
  PageBlockEmbeddedPost(
      {this.url,
      this.author,
      this.authorPhoto,
      this.date,
      this.pageBlocks,
      this.caption});

  /// [url] Web page URL
  String? url;

  /// [author] Post author
  String? author;

  /// [authorPhoto] Post author photo; may be null
  Photo? authorPhoto;

  /// [date] Point in time (Unix timestamp) when the post was created; 0 if unknown
  int? date;

  /// [pageBlocks] Post content
  List<PageBlock>? pageBlocks;

  /// [caption] Post caption
  PageBlockCaption? caption;

  /// Parse from a json
  PageBlockEmbeddedPost.fromJson(Map<String, dynamic> json) {
    String? pre_url;
    try {
      pre_url = json['url'];
    } catch (_) {}
    url = pre_url;
    String? pre_author;
    try {
      pre_author = json['author'];
    } catch (_) {}
    author = pre_author;
    Photo? pre_authorPhoto;
    try {
      pre_authorPhoto =
          Photo.fromJson(json['author_photo'] ?? <String, dynamic>{});
    } catch (_) {}
    authorPhoto = pre_authorPhoto;
    int? pre_date;
    try {
      pre_date = json['date'];
    } catch (_) {}
    date = pre_date;
    List<PageBlock>? pre_pageBlocks;
    try {
      pre_pageBlocks = List<PageBlock>.from((json['page_blocks'] ?? [])!
          .map((item) => PageBlock.fromJson(item ?? <String, dynamic>{}))
          .toList());
    } catch (_) {}
    pageBlocks = pre_pageBlocks;
    PageBlockCaption? pre_caption;
    try {
      pre_caption =
          PageBlockCaption.fromJson(json['caption'] ?? <String, dynamic>{});
    } catch (_) {}
    caption = pre_caption;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "url": url,
      "author": author,
      "author_photo": authorPhoto == null ? null : authorPhoto?.toJson(),
      "date": date,
      "page_blocks": pageBlocks?.map((i) => i.toJson()).toList(),
      "caption": caption == null ? null : caption?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockEmbeddedPost';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockCollage extends PageBlock {
  /// A collage
  PageBlockCollage({this.pageBlocks, this.caption});

  /// [pageBlocks] Collage item contents
  List<PageBlock>? pageBlocks;

  /// [caption] Block caption
  PageBlockCaption? caption;

  /// Parse from a json
  PageBlockCollage.fromJson(Map<String, dynamic> json) {
    List<PageBlock>? pre_pageBlocks;
    try {
      pre_pageBlocks = List<PageBlock>.from((json['page_blocks'] ?? [])!
          .map((item) => PageBlock.fromJson(item ?? <String, dynamic>{}))
          .toList());
    } catch (_) {}
    pageBlocks = pre_pageBlocks;
    PageBlockCaption? pre_caption;
    try {
      pre_caption =
          PageBlockCaption.fromJson(json['caption'] ?? <String, dynamic>{});
    } catch (_) {}
    caption = pre_caption;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "page_blocks": pageBlocks?.map((i) => i.toJson()).toList(),
      "caption": caption == null ? null : caption?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockCollage';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockSlideshow extends PageBlock {
  /// A slideshow
  PageBlockSlideshow({this.pageBlocks, this.caption});

  /// [pageBlocks] Slideshow item contents
  List<PageBlock>? pageBlocks;

  /// [caption] Block caption
  PageBlockCaption? caption;

  /// Parse from a json
  PageBlockSlideshow.fromJson(Map<String, dynamic> json) {
    List<PageBlock>? pre_pageBlocks;
    try {
      pre_pageBlocks = List<PageBlock>.from((json['page_blocks'] ?? [])!
          .map((item) => PageBlock.fromJson(item ?? <String, dynamic>{}))
          .toList());
    } catch (_) {}
    pageBlocks = pre_pageBlocks;
    PageBlockCaption? pre_caption;
    try {
      pre_caption =
          PageBlockCaption.fromJson(json['caption'] ?? <String, dynamic>{});
    } catch (_) {}
    caption = pre_caption;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "page_blocks": pageBlocks?.map((i) => i.toJson()).toList(),
      "caption": caption == null ? null : caption?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockSlideshow';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockChatLink extends PageBlock {
  /// A link to a chat
  PageBlockChatLink({this.title, this.photo, this.username});

  /// [title] Chat title
  String? title;

  /// [photo] Chat photo; may be null
  ChatPhotoInfo? photo;

  /// [username] Chat username, by which all other information about the chat can be resolved
  String? username;

  /// Parse from a json
  PageBlockChatLink.fromJson(Map<String, dynamic> json) {
    String? pre_title;
    try {
      pre_title = json['title'];
    } catch (_) {}
    title = pre_title;
    ChatPhotoInfo? pre_photo;
    try {
      pre_photo = ChatPhotoInfo.fromJson(json['photo'] ?? <String, dynamic>{});
    } catch (_) {}
    photo = pre_photo;
    String? pre_username;
    try {
      pre_username = json['username'];
    } catch (_) {}
    username = pre_username;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "title": title,
      "photo": photo == null ? null : photo?.toJson(),
      "username": username,
    };
  }

  static const CONSTRUCTOR = 'pageBlockChatLink';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockTable extends PageBlock {
  /// A table
  PageBlockTable({this.caption, this.cells, this.isBordered, this.isStriped});

  /// [caption] Table caption
  RichText? caption;

  /// [cells] Table cells
  List<List<PageBlockTableCell>>? cells;

  /// [isBordered] True, if the table is bordered
  bool? isBordered;

  /// [isStriped] True, if the table is striped
  bool? isStriped;

  /// Parse from a json
  PageBlockTable.fromJson(Map<String, dynamic> json) {
    RichText? pre_caption;
    try {
      pre_caption = RichText.fromJson(json['caption'] ?? <String, dynamic>{});
    } catch (_) {}
    caption = pre_caption;
    List<List<PageBlockTableCell>>? pre_cells;
    try {
      pre_cells = List<List<PageBlockTableCell>>.from((json['cells'] ?? [])!
          .map((item) => List<PageBlockTableCell>.from((item ?? [])!
              .map((innerItem) =>
                  PageBlockTableCell.fromJson(innerItem ?? <String, dynamic>{}))
              .toList()))
          .toList());
    } catch (_) {}
    cells = pre_cells;
    bool? pre_isBordered;
    try {
      pre_isBordered = json['is_bordered'];
    } catch (_) {}
    isBordered = pre_isBordered;
    bool? pre_isStriped;
    try {
      pre_isStriped = json['is_striped'];
    } catch (_) {}
    isStriped = pre_isStriped;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "caption": caption == null ? null : caption?.toJson(),
      "cells": cells?.map((i) => i.map((ii) => ii.toJson()).toList()).toList(),
      "is_bordered": isBordered,
      "is_striped": isStriped,
    };
  }

  static const CONSTRUCTOR = 'pageBlockTable';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockDetails extends PageBlock {
  /// A collapsible block
  PageBlockDetails({this.header, this.pageBlocks, this.isOpen});

  /// [header] Always visible heading for the block
  RichText? header;

  /// [pageBlocks] Block contents
  List<PageBlock>? pageBlocks;

  /// [isOpen] True, if the block is open by default
  bool? isOpen;

  /// Parse from a json
  PageBlockDetails.fromJson(Map<String, dynamic> json) {
    RichText? pre_header;
    try {
      pre_header = RichText.fromJson(json['header'] ?? <String, dynamic>{});
    } catch (_) {}
    header = pre_header;
    List<PageBlock>? pre_pageBlocks;
    try {
      pre_pageBlocks = List<PageBlock>.from((json['page_blocks'] ?? [])!
          .map((item) => PageBlock.fromJson(item ?? <String, dynamic>{}))
          .toList());
    } catch (_) {}
    pageBlocks = pre_pageBlocks;
    bool? pre_isOpen;
    try {
      pre_isOpen = json['is_open'];
    } catch (_) {}
    isOpen = pre_isOpen;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "header": header == null ? null : header?.toJson(),
      "page_blocks": pageBlocks?.map((i) => i.toJson()).toList(),
      "is_open": isOpen,
    };
  }

  static const CONSTRUCTOR = 'pageBlockDetails';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockRelatedArticles extends PageBlock {
  /// Related articles
  PageBlockRelatedArticles({this.header, this.articles});

  /// [header] Block header
  RichText? header;

  /// [articles] List of related articles
  List<PageBlockRelatedArticle>? articles;

  /// Parse from a json
  PageBlockRelatedArticles.fromJson(Map<String, dynamic> json) {
    RichText? pre_header;
    try {
      pre_header = RichText.fromJson(json['header'] ?? <String, dynamic>{});
    } catch (_) {}
    header = pre_header;
    List<PageBlockRelatedArticle>? pre_articles;
    try {
      pre_articles = List<PageBlockRelatedArticle>.from(
          (json['articles'] ?? [])!
              .map((item) =>
                  PageBlockRelatedArticle.fromJson(item ?? <String, dynamic>{}))
              .toList());
    } catch (_) {}
    articles = pre_articles;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "header": header == null ? null : header?.toJson(),
      "articles": articles?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockRelatedArticles';

  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockMap extends PageBlock {
  /// A map
  PageBlockMap(
      {this.location, this.zoom, this.width, this.height, this.caption});

  /// [location] Location of the map center
  Location? location;

  /// [zoom] Map zoom level
  int? zoom;

  /// [width] Map width
  int? width;

  /// [height] Map height
  int? height;

  /// [caption] Block caption
  PageBlockCaption? caption;

  /// Parse from a json
  PageBlockMap.fromJson(Map<String, dynamic> json) {
    Location? pre_location;
    try {
      pre_location = Location.fromJson(json['location'] ?? <String, dynamic>{});
    } catch (_) {}
    location = pre_location;
    int? pre_zoom;
    try {
      pre_zoom = json['zoom'];
    } catch (_) {}
    zoom = pre_zoom;
    int? pre_width;
    try {
      pre_width = json['width'];
    } catch (_) {}
    width = pre_width;
    int? pre_height;
    try {
      pre_height = json['height'];
    } catch (_) {}
    height = pre_height;
    PageBlockCaption? pre_caption;
    try {
      pre_caption =
          PageBlockCaption.fromJson(json['caption'] ?? <String, dynamic>{});
    } catch (_) {}
    caption = pre_caption;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "location": location == null ? null : location?.toJson(),
      "zoom": zoom,
      "width": width,
      "height": height,
      "caption": caption == null ? null : caption?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'pageBlockMap';

  @override
  String getConstructor() => CONSTRUCTOR;
}
