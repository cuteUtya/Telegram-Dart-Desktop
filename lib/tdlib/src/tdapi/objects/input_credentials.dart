part of '../tdapi.dart';

class InputCredentials extends TdObject {

  /// Contains information about the payment method chosen by the user
  InputCredentials();

  

  /// a InputCredentials return type can be :
  /// * InputCredentialsSaved
  /// * InputCredentialsNew
  /// * InputCredentialsApplePay
  /// * InputCredentialsGooglePay
  factory InputCredentials.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case InputCredentialsSaved.CONSTRUCTOR:
        return InputCredentialsSaved.fromJson(json);
      case InputCredentialsNew.CONSTRUCTOR:
        return InputCredentialsNew.fromJson(json);
      case InputCredentialsApplePay.CONSTRUCTOR:
        return InputCredentialsApplePay.fromJson(json);
      case InputCredentialsGooglePay.CONSTRUCTOR:
        return InputCredentialsGooglePay.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'inputCredentials';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputCredentialsSaved extends InputCredentials {

  /// Applies if a user chooses some previously saved payment credentials. To use their previously saved credentials, the user must have a valid temporary password
  InputCredentialsSaved({this.savedCredentialsId});

  /// [savedCredentialsId] Identifier of the saved credentials
  String? savedCredentialsId;

  /// Parse from a json
  InputCredentialsSaved.fromJson(Map<String, dynamic> json)  {
    savedCredentialsId = json['saved_credentials_id'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "saved_credentials_id": savedCredentialsId,
    };
  }

  static const CONSTRUCTOR = 'inputCredentialsSaved';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputCredentialsNew extends InputCredentials {

  /// Applies if a user enters new credentials on a payment provider website
  InputCredentialsNew({this.data,
    this.allowSave});

  /// [data] Contains JSON-encoded data with a credential identifier from the payment provider 
  String? data;

  /// [allowSave] True, if the credential identifier can be saved on the server side
  bool? allowSave;

  /// Parse from a json
  InputCredentialsNew.fromJson(Map<String, dynamic> json)  {
    data = json['data'];
    allowSave = json['allow_save'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "data": data,
      "allow_save": allowSave,
    };
  }

  static const CONSTRUCTOR = 'inputCredentialsNew';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputCredentialsApplePay extends InputCredentials {

  /// Applies if a user enters new credentials using Apple Pay
  InputCredentialsApplePay({this.data});

  /// [data] JSON-encoded data with the credential identifier
  String? data;

  /// Parse from a json
  InputCredentialsApplePay.fromJson(Map<String, dynamic> json)  {
    data = json['data'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "data": data,
    };
  }

  static const CONSTRUCTOR = 'inputCredentialsApplePay';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputCredentialsGooglePay extends InputCredentials {

  /// Applies if a user enters new credentials using Google Pay
  InputCredentialsGooglePay({this.data});

  /// [data] JSON-encoded data with the credential identifier
  String? data;

  /// Parse from a json
  InputCredentialsGooglePay.fromJson(Map<String, dynamic> json)  {
    data = json['data'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "data": data,
    };
  }

  static const CONSTRUCTOR = 'inputCredentialsGooglePay';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}