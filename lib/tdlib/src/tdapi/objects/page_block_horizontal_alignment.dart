part of '../tdapi.dart';

class PageBlockHorizontalAlignment extends TdObject {

  /// Describes a horizontal alignment of a table cell content
  PageBlockHorizontalAlignment();

  

  /// a PageBlockHorizontalAlignment return type can be :
  /// * PageBlockHorizontalAlignmentLeft
  /// * PageBlockHorizontalAlignmentCenter
  /// * PageBlockHorizontalAlignmentRight
  factory PageBlockHorizontalAlignment.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case PageBlockHorizontalAlignmentLeft.CONSTRUCTOR:
        return PageBlockHorizontalAlignmentLeft.fromJson(json);
      case PageBlockHorizontalAlignmentCenter.CONSTRUCTOR:
        return PageBlockHorizontalAlignmentCenter.fromJson(json);
      case PageBlockHorizontalAlignmentRight.CONSTRUCTOR:
        return PageBlockHorizontalAlignmentRight.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'pageBlockHorizontalAlignment';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockHorizontalAlignmentLeft extends PageBlockHorizontalAlignment {

  /// The content must be left-aligned
  PageBlockHorizontalAlignmentLeft();

  

  /// Parse from a json
  PageBlockHorizontalAlignmentLeft.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'pageBlockHorizontalAlignmentLeft';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockHorizontalAlignmentCenter extends PageBlockHorizontalAlignment {

  /// The content must be center-aligned
  PageBlockHorizontalAlignmentCenter();

  

  /// Parse from a json
  PageBlockHorizontalAlignmentCenter.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'pageBlockHorizontalAlignmentCenter';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class PageBlockHorizontalAlignmentRight extends PageBlockHorizontalAlignment {

  /// The content must be right-aligned
  PageBlockHorizontalAlignmentRight();

  

  /// Parse from a json
  PageBlockHorizontalAlignmentRight.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'pageBlockHorizontalAlignmentRight';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}