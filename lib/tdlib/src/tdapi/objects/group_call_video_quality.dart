part of '../tdapi.dart';

class GroupCallVideoQuality extends TdObject {

  /// Describes the quality of a group call video
  GroupCallVideoQuality();

  

  /// a GroupCallVideoQuality return type can be :
  /// * GroupCallVideoQualityThumbnail
  /// * GroupCallVideoQualityMedium
  /// * GroupCallVideoQualityFull
  factory GroupCallVideoQuality.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case GroupCallVideoQualityThumbnail.CONSTRUCTOR:
        return GroupCallVideoQualityThumbnail.fromJson(json);
      case GroupCallVideoQualityMedium.CONSTRUCTOR:
        return GroupCallVideoQualityMedium.fromJson(json);
      case GroupCallVideoQualityFull.CONSTRUCTOR:
        return GroupCallVideoQualityFull.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'groupCallVideoQuality';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class GroupCallVideoQualityThumbnail extends GroupCallVideoQuality {

  /// The worst available video quality
  GroupCallVideoQualityThumbnail();

  

  /// Parse from a json
  GroupCallVideoQualityThumbnail.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'groupCallVideoQualityThumbnail';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class GroupCallVideoQualityMedium extends GroupCallVideoQuality {

  /// The medium video quality
  GroupCallVideoQualityMedium();

  

  /// Parse from a json
  GroupCallVideoQualityMedium.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'groupCallVideoQualityMedium';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class GroupCallVideoQualityFull extends GroupCallVideoQuality {

  /// The best available video quality
  GroupCallVideoQualityFull();

  

  /// Parse from a json
  GroupCallVideoQualityFull.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'groupCallVideoQualityFull';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}