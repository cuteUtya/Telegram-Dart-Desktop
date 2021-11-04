part of '../tdapi.dart';

class InputPassportElementErrorSource extends TdObject {

  /// Contains the description of an error in a Telegram Passport element; for bots only
  InputPassportElementErrorSource();

  

  /// a InputPassportElementErrorSource return type can be :
  /// * InputPassportElementErrorSourceUnspecified
  /// * InputPassportElementErrorSourceDataField
  /// * InputPassportElementErrorSourceFrontSide
  /// * InputPassportElementErrorSourceReverseSide
  /// * InputPassportElementErrorSourceSelfie
  /// * InputPassportElementErrorSourceTranslationFile
  /// * InputPassportElementErrorSourceTranslationFiles
  /// * InputPassportElementErrorSourceFile
  /// * InputPassportElementErrorSourceFiles
  factory InputPassportElementErrorSource.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case InputPassportElementErrorSourceUnspecified.CONSTRUCTOR:
        return InputPassportElementErrorSourceUnspecified.fromJson(json);
      case InputPassportElementErrorSourceDataField.CONSTRUCTOR:
        return InputPassportElementErrorSourceDataField.fromJson(json);
      case InputPassportElementErrorSourceFrontSide.CONSTRUCTOR:
        return InputPassportElementErrorSourceFrontSide.fromJson(json);
      case InputPassportElementErrorSourceReverseSide.CONSTRUCTOR:
        return InputPassportElementErrorSourceReverseSide.fromJson(json);
      case InputPassportElementErrorSourceSelfie.CONSTRUCTOR:
        return InputPassportElementErrorSourceSelfie.fromJson(json);
      case InputPassportElementErrorSourceTranslationFile.CONSTRUCTOR:
        return InputPassportElementErrorSourceTranslationFile.fromJson(json);
      case InputPassportElementErrorSourceTranslationFiles.CONSTRUCTOR:
        return InputPassportElementErrorSourceTranslationFiles.fromJson(json);
      case InputPassportElementErrorSourceFile.CONSTRUCTOR:
        return InputPassportElementErrorSourceFile.fromJson(json);
      case InputPassportElementErrorSourceFiles.CONSTRUCTOR:
        return InputPassportElementErrorSourceFiles.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'inputPassportElementErrorSource';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputPassportElementErrorSourceUnspecified extends InputPassportElementErrorSource {

  /// The element contains an error in an unspecified place. The error will be considered resolved when new data is added
  InputPassportElementErrorSourceUnspecified({this.elementHash});

  /// [elementHash] Current hash of the entire element
  String? elementHash;

  /// Parse from a json
  InputPassportElementErrorSourceUnspecified.fromJson(Map<String, dynamic> json)  {
    elementHash = json['element_hash'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "element_hash": elementHash,
    };
  }

  static const CONSTRUCTOR = 'inputPassportElementErrorSourceUnspecified';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputPassportElementErrorSourceDataField extends InputPassportElementErrorSource {

  /// A data field contains an error. The error is considered resolved when the field's value changes
  InputPassportElementErrorSourceDataField({this.fieldName,
    this.dataHash});

  /// [fieldName] Field name 
  String? fieldName;

  /// [dataHash] Current data hash
  String? dataHash;

  /// Parse from a json
  InputPassportElementErrorSourceDataField.fromJson(Map<String, dynamic> json)  {
    fieldName = json['field_name'];
    dataHash = json['data_hash'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "field_name": fieldName,
      "data_hash": dataHash,
    };
  }

  static const CONSTRUCTOR = 'inputPassportElementErrorSourceDataField';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputPassportElementErrorSourceFrontSide extends InputPassportElementErrorSource {

  /// The front side of the document contains an error. The error is considered resolved when the file with the front side of the document changes
  InputPassportElementErrorSourceFrontSide({this.fileHash});

  /// [fileHash] Current hash of the file containing the front side
  String? fileHash;

  /// Parse from a json
  InputPassportElementErrorSourceFrontSide.fromJson(Map<String, dynamic> json)  {
    fileHash = json['file_hash'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "file_hash": fileHash,
    };
  }

  static const CONSTRUCTOR = 'inputPassportElementErrorSourceFrontSide';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputPassportElementErrorSourceReverseSide extends InputPassportElementErrorSource {

  /// The reverse side of the document contains an error. The error is considered resolved when the file with the reverse side of the document changes
  InputPassportElementErrorSourceReverseSide({this.fileHash});

  /// [fileHash] Current hash of the file containing the reverse side
  String? fileHash;

  /// Parse from a json
  InputPassportElementErrorSourceReverseSide.fromJson(Map<String, dynamic> json)  {
    fileHash = json['file_hash'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "file_hash": fileHash,
    };
  }

  static const CONSTRUCTOR = 'inputPassportElementErrorSourceReverseSide';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputPassportElementErrorSourceSelfie extends InputPassportElementErrorSource {

  /// The selfie contains an error. The error is considered resolved when the file with the selfie changes
  InputPassportElementErrorSourceSelfie({this.fileHash});

  /// [fileHash] Current hash of the file containing the selfie
  String? fileHash;

  /// Parse from a json
  InputPassportElementErrorSourceSelfie.fromJson(Map<String, dynamic> json)  {
    fileHash = json['file_hash'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "file_hash": fileHash,
    };
  }

  static const CONSTRUCTOR = 'inputPassportElementErrorSourceSelfie';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputPassportElementErrorSourceTranslationFile extends InputPassportElementErrorSource {

  /// One of the files containing the translation of the document contains an error. The error is considered resolved when the file with the translation changes
  InputPassportElementErrorSourceTranslationFile({this.fileHash});

  /// [fileHash] Current hash of the file containing the translation
  String? fileHash;

  /// Parse from a json
  InputPassportElementErrorSourceTranslationFile.fromJson(Map<String, dynamic> json)  {
    fileHash = json['file_hash'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "file_hash": fileHash,
    };
  }

  static const CONSTRUCTOR = 'inputPassportElementErrorSourceTranslationFile';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputPassportElementErrorSourceTranslationFiles extends InputPassportElementErrorSource {

  /// The translation of the document contains an error. The error is considered resolved when the list of files changes
  InputPassportElementErrorSourceTranslationFiles({this.fileHashes});

  /// [fileHashes] Current hashes of all files with the translation
  List<String>? fileHashes;

  /// Parse from a json
  InputPassportElementErrorSourceTranslationFiles.fromJson(Map<String, dynamic> json)  {
    fileHashes = List<String>.from((json['file_hashes'] ?? [])!.map((item) => item).toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "file_hashes": fileHashes?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'inputPassportElementErrorSourceTranslationFiles';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputPassportElementErrorSourceFile extends InputPassportElementErrorSource {

  /// The file contains an error. The error is considered resolved when the file changes
  InputPassportElementErrorSourceFile({this.fileHash});

  /// [fileHash] Current hash of the file which has the error
  String? fileHash;

  /// Parse from a json
  InputPassportElementErrorSourceFile.fromJson(Map<String, dynamic> json)  {
    fileHash = json['file_hash'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "file_hash": fileHash,
    };
  }

  static const CONSTRUCTOR = 'inputPassportElementErrorSourceFile';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputPassportElementErrorSourceFiles extends InputPassportElementErrorSource {

  /// The list of attached files contains an error. The error is considered resolved when the file list changes
  InputPassportElementErrorSourceFiles({this.fileHashes});

  /// [fileHashes] Current hashes of all attached files
  List<String>? fileHashes;

  /// Parse from a json
  InputPassportElementErrorSourceFiles.fromJson(Map<String, dynamic> json)  {
    fileHashes = List<String>.from((json['file_hashes'] ?? [])!.map((item) => item).toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "file_hashes": fileHashes?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'inputPassportElementErrorSourceFiles';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}