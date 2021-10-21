import 'base_classes.dart';
import 'utils.dart';

@reflector
class Error extends TdObject {
  @override
  String get tdType => 'error';

   late int code;
   late String message;

  @override
  Map<String, dynamic> get params => {
    'code': code,
    'message': message,
  };

  Error({
  required this.code,
  required this.message,
  });

  Error.fromJson(Map<String, dynamic> json) {
    code = tryConvertToTdObject(json['code']);
    message = tryConvertToTdObject(json['message']);
  }
}

@reflector
class Ok extends TdObject {
  @override
  String get tdType => 'ok';

  @override
  Map<String, dynamic> get params => {};

  Ok();

  Ok.fromJson(Map<String, dynamic> json);
}

@reflector
class TdlibParameters extends TdObject {
  @override
  String get tdType => 'tdlibParameters';

   late bool useTestDc;
   late String databaseDirectory;
   late String filesDirectory;
   late bool useFileDatabase;
   late bool useChatInfoDatabase;
   late bool useMessageDatabase;
   late bool useSecretChats;
   late int apiId;
   late String apiHash;
   late String systemLanguageCode;
   late String deviceModel;
   late String systemVersion;
   late String applicationVersion;
   late bool enableStorageOptimizer;
   late bool ignoreFileNames;

  @override
  Map<String, dynamic> get params => {
    'use_test_dc': useTestDc,
    'database_directory': databaseDirectory,
    'files_directory': filesDirectory,
    'use_file_database': useFileDatabase,
    'use_chat_info_database': useChatInfoDatabase,
    'use_message_database': useMessageDatabase,
    'use_secret_chats': useSecretChats,
    'api_id': apiId,
    'api_hash': apiHash,
    'system_language_code': systemLanguageCode,
    'device_model': deviceModel,
    'system_version': systemVersion,
    'application_version': applicationVersion,
    'enable_storage_optimizer': enableStorageOptimizer,
    'ignore_file_names': ignoreFileNames,
  };

  TdlibParameters({
  required this.useTestDc,
  required this.databaseDirectory,
  required this.filesDirectory,
  required this.useFileDatabase,
  required this.useChatInfoDatabase,
  required this.useMessageDatabase,
  required this.useSecretChats,
  required this.apiId,
  required this.apiHash,
  required this.systemLanguageCode,
  required this.deviceModel,
  required this.systemVersion,
  required this.applicationVersion,
  required this.enableStorageOptimizer,
  required this.ignoreFileNames,
  });

  TdlibParameters.fromJson(Map<String, dynamic> json) {
    useTestDc = tryConvertToTdObject(json['use_test_dc']);
    databaseDirectory = tryConvertToTdObject(json['database_directory']);
    filesDirectory = tryConvertToTdObject(json['files_directory']);
    useFileDatabase = tryConvertToTdObject(json['use_file_database']);
    useChatInfoDatabase = tryConvertToTdObject(json['use_chat_info_database']);
    useMessageDatabase = tryConvertToTdObject(json['use_message_database']);
    useSecretChats = tryConvertToTdObject(json['use_secret_chats']);
    apiId = tryConvertToTdObject(json['api_id']);
    apiHash = tryConvertToTdObject(json['api_hash']);
    systemLanguageCode = tryConvertToTdObject(json['system_language_code']);
    deviceModel = tryConvertToTdObject(json['device_model']);
    systemVersion = tryConvertToTdObject(json['system_version']);
    applicationVersion = tryConvertToTdObject(json['application_version']);
    enableStorageOptimizer = tryConvertToTdObject(json['enable_storage_optimizer']);
    ignoreFileNames = tryConvertToTdObject(json['ignore_file_names']);
  }
}

abstract class AuthenticationCodeType extends TdObject {}

@reflector
class AuthenticationCodeTypeTelegramMessage extends AuthenticationCodeType {
  @override
  String get tdType => 'authenticationCodeTypeTelegramMessage';

   late int length;

  @override
  Map<String, dynamic> get params => {
    'length': length,
  };

  AuthenticationCodeTypeTelegramMessage({
  required this.length,
  });

  AuthenticationCodeTypeTelegramMessage.fromJson(Map<String, dynamic> json) {
    length = tryConvertToTdObject(json['length']);
  }
}

@reflector
class AuthenticationCodeTypeSms extends AuthenticationCodeType {
  @override
  String get tdType => 'authenticationCodeTypeSms';

   late int length;

  @override
  Map<String, dynamic> get params => {
    'length': length,
  };

  AuthenticationCodeTypeSms({
  required this.length,
  });

  AuthenticationCodeTypeSms.fromJson(Map<String, dynamic> json) {
    length = tryConvertToTdObject(json['length']);
  }
}

@reflector
class AuthenticationCodeTypeCall extends AuthenticationCodeType {
  @override
  String get tdType => 'authenticationCodeTypeCall';

   late int length;

  @override
  Map<String, dynamic> get params => {
    'length': length,
  };

  AuthenticationCodeTypeCall({
  required this.length,
  });

  AuthenticationCodeTypeCall.fromJson(Map<String, dynamic> json) {
    length = tryConvertToTdObject(json['length']);
  }
}

@reflector
class AuthenticationCodeTypeFlashCall extends AuthenticationCodeType {
  @override
  String get tdType => 'authenticationCodeTypeFlashCall';

   late String pattern;

  @override
  Map<String, dynamic> get params => {
    'pattern': pattern,
  };

  AuthenticationCodeTypeFlashCall({
  required this.pattern,
  });

  AuthenticationCodeTypeFlashCall.fromJson(Map<String, dynamic> json) {
    pattern = tryConvertToTdObject(json['pattern']);
  }
}

@reflector
class AuthenticationCodeInfo extends TdObject {
  @override
  String get tdType => 'authenticationCodeInfo';

   late String phoneNumber;
   late AuthenticationCodeType type;
   late AuthenticationCodeType nextType;
   late int timeout;

  @override
  Map<String, dynamic> get params => {
    'phone_number': phoneNumber,
    'type': type,
    'next_type': nextType,
    'timeout': timeout,
  };

  AuthenticationCodeInfo({
  required this.phoneNumber,
  required this.type,
  required this.nextType,
  required this.timeout,
  });

  AuthenticationCodeInfo.fromJson(Map<String, dynamic> json) {
    phoneNumber = tryConvertToTdObject(json['phone_number']);
    type = tryConvertToTdObject(json['type']);
    nextType = tryConvertToTdObject(json['next_type']);
    timeout = tryConvertToTdObject(json['timeout']);
  }
}

@reflector
class EmailAddressAuthenticationCodeInfo extends TdObject {
  @override
  String get tdType => 'emailAddressAuthenticationCodeInfo';

   late String emailAddressPattern;
   late int length;

  @override
  Map<String, dynamic> get params => {
    'email_address_pattern': emailAddressPattern,
    'length': length,
  };

  EmailAddressAuthenticationCodeInfo({
  required this.emailAddressPattern,
  required this.length,
  });

  EmailAddressAuthenticationCodeInfo.fromJson(Map<String, dynamic> json) {
    emailAddressPattern = tryConvertToTdObject(json['email_address_pattern']);
    length = tryConvertToTdObject(json['length']);
  }
}

@reflector
class TextEntity extends TdObject {
  @override
  String get tdType => 'textEntity';

   late int offset;
   late int length;
   late TextEntityType type;

  @override
  Map<String, dynamic> get params => {
    'offset': offset,
    'length': length,
    'type': type,
  };

  TextEntity({
  required this.offset,
  required this.length,
  required this.type,
  });

  TextEntity.fromJson(Map<String, dynamic> json) {
    offset = tryConvertToTdObject(json['offset']);
    length = tryConvertToTdObject(json['length']);
    type = tryConvertToTdObject(json['type']);
  }
}

@reflector
class TextEntities extends TdObject {
  @override
  String get tdType => 'textEntities';

   late List<TextEntity> entities;

  @override
  Map<String, dynamic> get params => {
    'entities': entities,
  };

  TextEntities({
  required this.entities,
  });

  TextEntities.fromJson(Map<String, dynamic> json) {
    entities = tryConvertToTdObject(json['entities']);
  }
}

@reflector
class FormattedText extends TdObject {
  @override
  String get tdType => 'formattedText';

   late String text;
   late List<TextEntity> entities;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'entities': entities,
  };

  FormattedText({
  required this.text,
  required this.entities,
  });

  FormattedText.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    entities = tryConvertToTdObject(json['entities']);
  }
}

@reflector
class TermsOfService extends TdObject {
  @override
  String get tdType => 'termsOfService';

   late FormattedText text;
   late int minUserAge;
   late bool showPopup;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'min_user_age': minUserAge,
    'show_popup': showPopup,
  };

  TermsOfService({
  required this.text,
  required this.minUserAge,
  required this.showPopup,
  });

  TermsOfService.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    minUserAge = tryConvertToTdObject(json['min_user_age']);
    showPopup = tryConvertToTdObject(json['show_popup']);
  }
}

abstract class AuthorizationState extends TdObject {}

@reflector
class AuthorizationStateWaitTdlibParameters extends AuthorizationState {
  @override
  String get tdType => 'authorizationStateWaitTdlibParameters';

  @override
  Map<String, dynamic> get params => {};

  AuthorizationStateWaitTdlibParameters();

  AuthorizationStateWaitTdlibParameters.fromJson(Map<String, dynamic> json);
}

@reflector
class AuthorizationStateWaitEncryptionKey extends AuthorizationState {
  @override
  String get tdType => 'authorizationStateWaitEncryptionKey';

   late bool isEncrypted;

  @override
  Map<String, dynamic> get params => {
    'is_encrypted': isEncrypted,
  };

  AuthorizationStateWaitEncryptionKey({
  required this.isEncrypted,
  });

  AuthorizationStateWaitEncryptionKey.fromJson(Map<String, dynamic> json) {
    isEncrypted = tryConvertToTdObject(json['is_encrypted']);
  }
}

@reflector
class AuthorizationStateWaitPhoneNumber extends AuthorizationState {
  @override
  String get tdType => 'authorizationStateWaitPhoneNumber';

  @override
  Map<String, dynamic> get params => {};

  AuthorizationStateWaitPhoneNumber();

  AuthorizationStateWaitPhoneNumber.fromJson(Map<String, dynamic> json);
}

@reflector
class AuthorizationStateWaitCode extends AuthorizationState {
  @override
  String get tdType => 'authorizationStateWaitCode';

   late AuthenticationCodeInfo codeInfo;

  @override
  Map<String, dynamic> get params => {
    'code_info': codeInfo,
  };

  AuthorizationStateWaitCode({
  required this.codeInfo,
  });

  AuthorizationStateWaitCode.fromJson(Map<String, dynamic> json) {
    codeInfo = tryConvertToTdObject(json['code_info']);
  }
}

@reflector
class AuthorizationStateWaitOtherDeviceConfirmation extends AuthorizationState {
  @override
  String get tdType => 'authorizationStateWaitOtherDeviceConfirmation';

   late String link;

  @override
  Map<String, dynamic> get params => {
    'link': link,
  };

  AuthorizationStateWaitOtherDeviceConfirmation({
  required this.link,
  });

  AuthorizationStateWaitOtherDeviceConfirmation.fromJson(Map<String, dynamic> json) {
    link = tryConvertToTdObject(json['link']);
  }
}

@reflector
class AuthorizationStateWaitRegistration extends AuthorizationState {
  @override
  String get tdType => 'authorizationStateWaitRegistration';

   late TermsOfService termsOfService;

  @override
  Map<String, dynamic> get params => {
    'terms_of_service': termsOfService,
  };

  AuthorizationStateWaitRegistration({
  required this.termsOfService,
  });

  AuthorizationStateWaitRegistration.fromJson(Map<String, dynamic> json) {
    termsOfService = tryConvertToTdObject(json['terms_of_service']);
  }
}

@reflector
class AuthorizationStateWaitPassword extends AuthorizationState {
  @override
  String get tdType => 'authorizationStateWaitPassword';

   late String passwordHint;
   late bool hasRecoveryEmailAddress;
   late String recoveryEmailAddressPattern;

  @override
  Map<String, dynamic> get params => {
    'password_hint': passwordHint,
    'has_recovery_email_address': hasRecoveryEmailAddress,
    'recovery_email_address_pattern': recoveryEmailAddressPattern,
  };

  AuthorizationStateWaitPassword({
  required this.passwordHint,
  required this.hasRecoveryEmailAddress,
  required this.recoveryEmailAddressPattern,
  });

  AuthorizationStateWaitPassword.fromJson(Map<String, dynamic> json) {
    passwordHint = tryConvertToTdObject(json['password_hint']);
    hasRecoveryEmailAddress = tryConvertToTdObject(json['has_recovery_email_address']);
    recoveryEmailAddressPattern = tryConvertToTdObject(json['recovery_email_address_pattern']);
  }
}

@reflector
class AuthorizationStateReady extends AuthorizationState {
  @override
  String get tdType => 'authorizationStateReady';

  @override
  Map<String, dynamic> get params => {};

  AuthorizationStateReady();

  AuthorizationStateReady.fromJson(Map<String, dynamic> json);
}

@reflector
class AuthorizationStateLoggingOut extends AuthorizationState {
  @override
  String get tdType => 'authorizationStateLoggingOut';

  @override
  Map<String, dynamic> get params => {};

  AuthorizationStateLoggingOut();

  AuthorizationStateLoggingOut.fromJson(Map<String, dynamic> json);
}

@reflector
class AuthorizationStateClosing extends AuthorizationState {
  @override
  String get tdType => 'authorizationStateClosing';

  @override
  Map<String, dynamic> get params => {};

  AuthorizationStateClosing();

  AuthorizationStateClosing.fromJson(Map<String, dynamic> json);
}

@reflector
class AuthorizationStateClosed extends AuthorizationState {
  @override
  String get tdType => 'authorizationStateClosed';

  @override
  Map<String, dynamic> get params => {};

  AuthorizationStateClosed();

  AuthorizationStateClosed.fromJson(Map<String, dynamic> json);
}

@reflector
class PasswordState extends TdObject {
  @override
  String get tdType => 'passwordState';

   late bool hasPassword;
   late String passwordHint;
   late bool hasRecoveryEmailAddress;
   late bool hasPassportData;
   late EmailAddressAuthenticationCodeInfo recoveryEmailAddressCodeInfo;
   late int pendingResetDate;

  @override
  Map<String, dynamic> get params => {
    'has_password': hasPassword,
    'password_hint': passwordHint,
    'has_recovery_email_address': hasRecoveryEmailAddress,
    'has_passport_data': hasPassportData,
    'recovery_email_address_code_info': recoveryEmailAddressCodeInfo,
    'pending_reset_date': pendingResetDate,
  };

  PasswordState({
  required this.hasPassword,
  required this.passwordHint,
  required this.hasRecoveryEmailAddress,
  required this.hasPassportData,
  required this.recoveryEmailAddressCodeInfo,
  required this.pendingResetDate,
  });

  PasswordState.fromJson(Map<String, dynamic> json) {
    hasPassword = tryConvertToTdObject(json['has_password']);
    passwordHint = tryConvertToTdObject(json['password_hint']);
    hasRecoveryEmailAddress = tryConvertToTdObject(json['has_recovery_email_address']);
    hasPassportData = tryConvertToTdObject(json['has_passport_data']);
    recoveryEmailAddressCodeInfo = tryConvertToTdObject(json['recovery_email_address_code_info']);
    pendingResetDate = tryConvertToTdObject(json['pending_reset_date']);
  }
}

@reflector
class RecoveryEmailAddress extends TdObject {
  @override
  String get tdType => 'recoveryEmailAddress';

   late String recoveryEmailAddress;

  @override
  Map<String, dynamic> get params => {
    'recovery_email_address': recoveryEmailAddress,
  };

  RecoveryEmailAddress({
  required this.recoveryEmailAddress,
  });

  RecoveryEmailAddress.fromJson(Map<String, dynamic> json) {
    recoveryEmailAddress = tryConvertToTdObject(json['recovery_email_address']);
  }
}

@reflector
class TemporaryPasswordState extends TdObject {
  @override
  String get tdType => 'temporaryPasswordState';

   late bool hasPassword;
   late int validFor;

  @override
  Map<String, dynamic> get params => {
    'has_password': hasPassword,
    'valid_for': validFor,
  };

  TemporaryPasswordState({
  required this.hasPassword,
  required this.validFor,
  });

  TemporaryPasswordState.fromJson(Map<String, dynamic> json) {
    hasPassword = tryConvertToTdObject(json['has_password']);
    validFor = tryConvertToTdObject(json['valid_for']);
  }
}

@reflector
class LocalFile extends TdObject {
  @override
  String get tdType => 'localFile';

   late String path;
   late bool canBeDownloaded;
   late bool canBeDeleted;
   late bool isDownloadingActive;
   late bool isDownloadingCompleted;
   late int downloadOffset;
   late int downloadedPrefixSize;
   late int downloadedSize;

  @override
  Map<String, dynamic> get params => {
    'path': path,
    'can_be_downloaded': canBeDownloaded,
    'can_be_deleted': canBeDeleted,
    'is_downloading_active': isDownloadingActive,
    'is_downloading_completed': isDownloadingCompleted,
    'download_offset': downloadOffset,
    'downloaded_prefix_size': downloadedPrefixSize,
    'downloaded_size': downloadedSize,
  };

  LocalFile({
  required this.path,
  required this.canBeDownloaded,
  required this.canBeDeleted,
  required this.isDownloadingActive,
  required this.isDownloadingCompleted,
  required this.downloadOffset,
  required this.downloadedPrefixSize,
  required this.downloadedSize,
  });

  LocalFile.fromJson(Map<String, dynamic> json) {
    path = tryConvertToTdObject(json['path']);
    canBeDownloaded = tryConvertToTdObject(json['can_be_downloaded']);
    canBeDeleted = tryConvertToTdObject(json['can_be_deleted']);
    isDownloadingActive = tryConvertToTdObject(json['is_downloading_active']);
    isDownloadingCompleted = tryConvertToTdObject(json['is_downloading_completed']);
    downloadOffset = tryConvertToTdObject(json['download_offset']);
    downloadedPrefixSize = tryConvertToTdObject(json['downloaded_prefix_size']);
    downloadedSize = tryConvertToTdObject(json['downloaded_size']);
  }
}

@reflector
class RemoteFile extends TdObject {
  @override
  String get tdType => 'remoteFile';

   late String id;
   late String uniqueId;
   late bool isUploadingActive;
   late bool isUploadingCompleted;
   late int uploadedSize;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'unique_id': uniqueId,
    'is_uploading_active': isUploadingActive,
    'is_uploading_completed': isUploadingCompleted,
    'uploaded_size': uploadedSize,
  };

  RemoteFile({
  required this.id,
  required this.uniqueId,
  required this.isUploadingActive,
  required this.isUploadingCompleted,
  required this.uploadedSize,
  });

  RemoteFile.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    uniqueId = tryConvertToTdObject(json['unique_id']);
    isUploadingActive = tryConvertToTdObject(json['is_uploading_active']);
    isUploadingCompleted = tryConvertToTdObject(json['is_uploading_completed']);
    uploadedSize = tryConvertToTdObject(json['uploaded_size']);
  }
}

@reflector
class File extends TdObject {
  @override
  String get tdType => 'file';

   late int id;
   late int size;
   late int expectedSize;
   late LocalFile local;
   late RemoteFile remote;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'size': size,
    'expected_size': expectedSize,
    'local': local,
    'remote': remote,
  };

  File({
  required this.id,
  required this.size,
  required this.expectedSize,
  required this.local,
  required this.remote,
  });

  File.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    size = tryConvertToTdObject(json['size']);
    expectedSize = tryConvertToTdObject(json['expected_size']);
    local = tryConvertToTdObject(json['local']);
    remote = tryConvertToTdObject(json['remote']);
  }
}

abstract class InputFile extends TdObject {}

@reflector
class InputFileId extends InputFile {
  @override
  String get tdType => 'inputFileId';

   late int id;

  @override
  Map<String, dynamic> get params => {
    'id': id,
  };

  InputFileId({
  required this.id,
  });

  InputFileId.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
  }
}

@reflector
class InputFileRemote extends InputFile {
  @override
  String get tdType => 'inputFileRemote';

   late String id;

  @override
  Map<String, dynamic> get params => {
    'id': id,
  };

  InputFileRemote({
  required this.id,
  });

  InputFileRemote.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
  }
}

@reflector
class InputFileLocal extends InputFile {
  @override
  String get tdType => 'inputFileLocal';

   late String path;

  @override
  Map<String, dynamic> get params => {
    'path': path,
  };

  InputFileLocal({
  required this.path,
  });

  InputFileLocal.fromJson(Map<String, dynamic> json) {
    path = tryConvertToTdObject(json['path']);
  }
}

@reflector
class InputFileGenerated extends InputFile {
  @override
  String get tdType => 'inputFileGenerated';

   late String originalPath;
   late String conversion;
   late int expectedSize;

  @override
  Map<String, dynamic> get params => {
    'original_path': originalPath,
    'conversion': conversion,
    'expected_size': expectedSize,
  };

  InputFileGenerated({
  required this.originalPath,
  required this.conversion,
  required this.expectedSize,
  });

  InputFileGenerated.fromJson(Map<String, dynamic> json) {
    originalPath = tryConvertToTdObject(json['original_path']);
    conversion = tryConvertToTdObject(json['conversion']);
    expectedSize = tryConvertToTdObject(json['expected_size']);
  }
}

@reflector
class PhotoSize extends TdObject {
  @override
  String get tdType => 'photoSize';

   late String type;
   late File photo;
   late int width;
   late int height;
   late List<int> progressiveSizes;

  @override
  Map<String, dynamic> get params => {
    'type': type,
    'photo': photo,
    'width': width,
    'height': height,
    'progressive_sizes': progressiveSizes,
  };

  PhotoSize({
  required this.type,
  required this.photo,
  required this.width,
  required this.height,
  required this.progressiveSizes,
  });

  PhotoSize.fromJson(Map<String, dynamic> json) {
    type = tryConvertToTdObject(json['type']);
    photo = tryConvertToTdObject(json['photo']);
    width = tryConvertToTdObject(json['width']);
    height = tryConvertToTdObject(json['height']);
    progressiveSizes = tryConvertToTdObject(json['progressive_sizes']);
  }
}

@reflector
class Minithumbnail extends TdObject {
  @override
  String get tdType => 'minithumbnail';

   late int width;
   late int height;
   late String data;

  @override
  Map<String, dynamic> get params => {
    'width': width,
    'height': height,
    'data': data,
  };

  Minithumbnail({
  required this.width,
  required this.height,
  required this.data,
  });

  Minithumbnail.fromJson(Map<String, dynamic> json) {
    width = tryConvertToTdObject(json['width']);
    height = tryConvertToTdObject(json['height']);
    data = tryConvertToTdObject(json['data']);
  }
}

abstract class ThumbnailFormat extends TdObject {}

@reflector
class ThumbnailFormatJpeg extends ThumbnailFormat {
  @override
  String get tdType => 'thumbnailFormatJpeg';

  @override
  Map<String, dynamic> get params => {};

  ThumbnailFormatJpeg();

  ThumbnailFormatJpeg.fromJson(Map<String, dynamic> json);
}

@reflector
class ThumbnailFormatPng extends ThumbnailFormat {
  @override
  String get tdType => 'thumbnailFormatPng';

  @override
  Map<String, dynamic> get params => {};

  ThumbnailFormatPng();

  ThumbnailFormatPng.fromJson(Map<String, dynamic> json);
}

@reflector
class ThumbnailFormatWebp extends ThumbnailFormat {
  @override
  String get tdType => 'thumbnailFormatWebp';

  @override
  Map<String, dynamic> get params => {};

  ThumbnailFormatWebp();

  ThumbnailFormatWebp.fromJson(Map<String, dynamic> json);
}

@reflector
class ThumbnailFormatGif extends ThumbnailFormat {
  @override
  String get tdType => 'thumbnailFormatGif';

  @override
  Map<String, dynamic> get params => {};

  ThumbnailFormatGif();

  ThumbnailFormatGif.fromJson(Map<String, dynamic> json);
}

@reflector
class ThumbnailFormatTgs extends ThumbnailFormat {
  @override
  String get tdType => 'thumbnailFormatTgs';

  @override
  Map<String, dynamic> get params => {};

  ThumbnailFormatTgs();

  ThumbnailFormatTgs.fromJson(Map<String, dynamic> json);
}

@reflector
class ThumbnailFormatMpeg4 extends ThumbnailFormat {
  @override
  String get tdType => 'thumbnailFormatMpeg4';

  @override
  Map<String, dynamic> get params => {};

  ThumbnailFormatMpeg4();

  ThumbnailFormatMpeg4.fromJson(Map<String, dynamic> json);
}

@reflector
class Thumbnail extends TdObject {
  @override
  String get tdType => 'thumbnail';

   late ThumbnailFormat format;
   late int width;
   late int height;
   late File file;

  @override
  Map<String, dynamic> get params => {
    'format': format,
    'width': width,
    'height': height,
    'file': file,
  };

  Thumbnail({
  required this.format,
  required this.width,
  required this.height,
  required this.file,
  });

  Thumbnail.fromJson(Map<String, dynamic> json) {
    format = tryConvertToTdObject(json['format']);
    width = tryConvertToTdObject(json['width']);
    height = tryConvertToTdObject(json['height']);
    file = tryConvertToTdObject(json['file']);
  }
}

abstract class MaskPoint extends TdObject {}

@reflector
class MaskPointForehead extends MaskPoint {
  @override
  String get tdType => 'maskPointForehead';

  @override
  Map<String, dynamic> get params => {};

  MaskPointForehead();

  MaskPointForehead.fromJson(Map<String, dynamic> json);
}

@reflector
class MaskPointEyes extends MaskPoint {
  @override
  String get tdType => 'maskPointEyes';

  @override
  Map<String, dynamic> get params => {};

  MaskPointEyes();

  MaskPointEyes.fromJson(Map<String, dynamic> json);
}

@reflector
class MaskPointMouth extends MaskPoint {
  @override
  String get tdType => 'maskPointMouth';

  @override
  Map<String, dynamic> get params => {};

  MaskPointMouth();

  MaskPointMouth.fromJson(Map<String, dynamic> json);
}

@reflector
class MaskPointChin extends MaskPoint {
  @override
  String get tdType => 'maskPointChin';

  @override
  Map<String, dynamic> get params => {};

  MaskPointChin();

  MaskPointChin.fromJson(Map<String, dynamic> json);
}

@reflector
class MaskPosition extends TdObject {
  @override
  String get tdType => 'maskPosition';

   late MaskPoint point;
   late double xShift;
   late double yShift;
   late double scale;

  @override
  Map<String, dynamic> get params => {
    'point': point,
    'x_shift': xShift,
    'y_shift': yShift,
    'scale': scale,
  };

  MaskPosition({
  required this.point,
  required this.xShift,
  required this.yShift,
  required this.scale,
  });

  MaskPosition.fromJson(Map<String, dynamic> json) {
    point = tryConvertToTdObject(json['point']);
    xShift = tryConvertToTdObject(json['x_shift']);
    yShift = tryConvertToTdObject(json['y_shift']);
    scale = tryConvertToTdObject(json['scale']);
  }
}

@reflector
class ClosedVectorPath extends TdObject {
  @override
  String get tdType => 'closedVectorPath';

   late List<VectorPathCommand> commands;

  @override
  Map<String, dynamic> get params => {
    'commands': commands,
  };

  ClosedVectorPath({
  required this.commands,
  });

  ClosedVectorPath.fromJson(Map<String, dynamic> json) {
    commands = tryConvertToTdObject(json['commands']);
  }
}

@reflector
class PollOption extends TdObject {
  @override
  String get tdType => 'pollOption';

   late String text;
   late int voterCount;
   late int votePercentage;
   late bool isChosen;
   late bool isBeingChosen;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'voter_count': voterCount,
    'vote_percentage': votePercentage,
    'is_chosen': isChosen,
    'is_being_chosen': isBeingChosen,
  };

  PollOption({
  required this.text,
  required this.voterCount,
  required this.votePercentage,
  required this.isChosen,
  required this.isBeingChosen,
  });

  PollOption.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    voterCount = tryConvertToTdObject(json['voter_count']);
    votePercentage = tryConvertToTdObject(json['vote_percentage']);
    isChosen = tryConvertToTdObject(json['is_chosen']);
    isBeingChosen = tryConvertToTdObject(json['is_being_chosen']);
  }
}

abstract class PollType extends TdObject {}

@reflector
class PollTypeRegular extends PollType {
  @override
  String get tdType => 'pollTypeRegular';

   late bool allowMultipleAnswers;

  @override
  Map<String, dynamic> get params => {
    'allow_multiple_answers': allowMultipleAnswers,
  };

  PollTypeRegular({
  required this.allowMultipleAnswers,
  });

  PollTypeRegular.fromJson(Map<String, dynamic> json) {
    allowMultipleAnswers = tryConvertToTdObject(json['allow_multiple_answers']);
  }
}

@reflector
class PollTypeQuiz extends PollType {
  @override
  String get tdType => 'pollTypeQuiz';

   late int correctOptionId;
   late FormattedText explanation;

  @override
  Map<String, dynamic> get params => {
    'correct_option_id': correctOptionId,
    'explanation': explanation,
  };

  PollTypeQuiz({
  required this.correctOptionId,
  required this.explanation,
  });

  PollTypeQuiz.fromJson(Map<String, dynamic> json) {
    correctOptionId = tryConvertToTdObject(json['correct_option_id']);
    explanation = tryConvertToTdObject(json['explanation']);
  }
}

@reflector
class Animation extends TdObject {
  @override
  String get tdType => 'animation';

   late int duration;
   late int width;
   late int height;
   late String fileName;
   late String mimeType;
   late bool hasStickers;
   late Minithumbnail minithumbnail;
   late Thumbnail thumbnail;
   late File animation;

  @override
  Map<String, dynamic> get params => {
    'duration': duration,
    'width': width,
    'height': height,
    'file_name': fileName,
    'mime_type': mimeType,
    'has_stickers': hasStickers,
    'minithumbnail': minithumbnail,
    'thumbnail': thumbnail,
    'animation': animation,
  };

  Animation({
  required this.duration,
  required this.width,
  required this.height,
  required this.fileName,
  required this.mimeType,
  required this.hasStickers,
  required this.minithumbnail,
  required this.thumbnail,
  required this.animation,
  });

  Animation.fromJson(Map<String, dynamic> json) {
    duration = tryConvertToTdObject(json['duration']);
    width = tryConvertToTdObject(json['width']);
    height = tryConvertToTdObject(json['height']);
    fileName = tryConvertToTdObject(json['file_name']);
    mimeType = tryConvertToTdObject(json['mime_type']);
    hasStickers = tryConvertToTdObject(json['has_stickers']);
    minithumbnail = tryConvertToTdObject(json['minithumbnail']);
    thumbnail = tryConvertToTdObject(json['thumbnail']);
    animation = tryConvertToTdObject(json['animation']);
  }
}

@reflector
class Audio extends TdObject {
  @override
  String get tdType => 'audio';

   late int duration;
   late String title;
   late String performer;
   late String fileName;
   late String mimeType;
   late Minithumbnail albumCoverMinithumbnail;
   late Thumbnail albumCoverThumbnail;
   late File audio;

  @override
  Map<String, dynamic> get params => {
    'duration': duration,
    'title': title,
    'performer': performer,
    'file_name': fileName,
    'mime_type': mimeType,
    'album_cover_minithumbnail': albumCoverMinithumbnail,
    'album_cover_thumbnail': albumCoverThumbnail,
    'audio': audio,
  };

  Audio({
  required this.duration,
  required this.title,
  required this.performer,
  required this.fileName,
  required this.mimeType,
  required this.albumCoverMinithumbnail,
  required this.albumCoverThumbnail,
  required this.audio,
  });

  Audio.fromJson(Map<String, dynamic> json) {
    duration = tryConvertToTdObject(json['duration']);
    title = tryConvertToTdObject(json['title']);
    performer = tryConvertToTdObject(json['performer']);
    fileName = tryConvertToTdObject(json['file_name']);
    mimeType = tryConvertToTdObject(json['mime_type']);
    albumCoverMinithumbnail = tryConvertToTdObject(json['album_cover_minithumbnail']);
    albumCoverThumbnail = tryConvertToTdObject(json['album_cover_thumbnail']);
    audio = tryConvertToTdObject(json['audio']);
  }
}

@reflector
class Document extends TdObject {
  @override
  String get tdType => 'document';

   late String fileName;
   late String mimeType;
   late Minithumbnail minithumbnail;
   late Thumbnail thumbnail;
   late File document;

  @override
  Map<String, dynamic> get params => {
    'file_name': fileName,
    'mime_type': mimeType,
    'minithumbnail': minithumbnail,
    'thumbnail': thumbnail,
    'document': document,
  };

  Document({
  required this.fileName,
  required this.mimeType,
  required this.minithumbnail,
  required this.thumbnail,
  required this.document,
  });

  Document.fromJson(Map<String, dynamic> json) {
    fileName = tryConvertToTdObject(json['file_name']);
    mimeType = tryConvertToTdObject(json['mime_type']);
    minithumbnail = tryConvertToTdObject(json['minithumbnail']);
    thumbnail = tryConvertToTdObject(json['thumbnail']);
    document = tryConvertToTdObject(json['document']);
  }
}

@reflector
class Photo extends TdObject {
  @override
  String get tdType => 'photo';

   late bool hasStickers;
   late Minithumbnail minithumbnail;
   late List<PhotoSize> sizes;

  @override
  Map<String, dynamic> get params => {
    'has_stickers': hasStickers,
    'minithumbnail': minithumbnail,
    'sizes': sizes,
  };

  Photo({
  required this.hasStickers,
  required this.minithumbnail,
  required this.sizes,
  });

  Photo.fromJson(Map<String, dynamic> json) {
    hasStickers = tryConvertToTdObject(json['has_stickers']);
    minithumbnail = tryConvertToTdObject(json['minithumbnail']);
    sizes = tryConvertToTdObject(json['sizes']);
  }
}

@reflector
class Sticker extends TdObject {
  @override
  String get tdType => 'sticker';

   late int setId;
   late int width;
   late int height;
   late String emoji;
   late bool isAnimated;
   late bool isMask;
   late MaskPosition maskPosition;
   late List<ClosedVectorPath> outline;
   late Thumbnail thumbnail;
   late File sticker;

  @override
  Map<String, dynamic> get params => {
    'set_id': setId,
    'width': width,
    'height': height,
    'emoji': emoji,
    'is_animated': isAnimated,
    'is_mask': isMask,
    'mask_position': maskPosition,
    'outline': outline,
    'thumbnail': thumbnail,
    'sticker': sticker,
  };

  Sticker({
  required this.setId,
  required this.width,
  required this.height,
  required this.emoji,
  required this.isAnimated,
  required this.isMask,
  required this.maskPosition,
  required this.outline,
  required this.thumbnail,
  required this.sticker,
  });

  Sticker.fromJson(Map<String, dynamic> json) {
    setId = tryConvertToTdObject(json['set_id']);
    width = tryConvertToTdObject(json['width']);
    height = tryConvertToTdObject(json['height']);
    emoji = tryConvertToTdObject(json['emoji']);
    isAnimated = tryConvertToTdObject(json['is_animated']);
    isMask = tryConvertToTdObject(json['is_mask']);
    maskPosition = tryConvertToTdObject(json['mask_position']);
    outline = tryConvertToTdObject(json['outline']);
    thumbnail = tryConvertToTdObject(json['thumbnail']);
    sticker = tryConvertToTdObject(json['sticker']);
  }
}

@reflector
class Video extends TdObject {
  @override
  String get tdType => 'video';

   late int duration;
   late int width;
   late int height;
   late String fileName;
   late String mimeType;
   late bool hasStickers;
   late bool supportsStreaming;
   late Minithumbnail minithumbnail;
   late Thumbnail thumbnail;
   late File video;

  @override
  Map<String, dynamic> get params => {
    'duration': duration,
    'width': width,
    'height': height,
    'file_name': fileName,
    'mime_type': mimeType,
    'has_stickers': hasStickers,
    'supports_streaming': supportsStreaming,
    'minithumbnail': minithumbnail,
    'thumbnail': thumbnail,
    'video': video,
  };

  Video({
  required this.duration,
  required this.width,
  required this.height,
  required this.fileName,
  required this.mimeType,
  required this.hasStickers,
  required this.supportsStreaming,
  required this.minithumbnail,
  required this.thumbnail,
  required this.video,
  });

  Video.fromJson(Map<String, dynamic> json) {
    duration = tryConvertToTdObject(json['duration']);
    width = tryConvertToTdObject(json['width']);
    height = tryConvertToTdObject(json['height']);
    fileName = tryConvertToTdObject(json['file_name']);
    mimeType = tryConvertToTdObject(json['mime_type']);
    hasStickers = tryConvertToTdObject(json['has_stickers']);
    supportsStreaming = tryConvertToTdObject(json['supports_streaming']);
    minithumbnail = tryConvertToTdObject(json['minithumbnail']);
    thumbnail = tryConvertToTdObject(json['thumbnail']);
    video = tryConvertToTdObject(json['video']);
  }
}

@reflector
class VideoNote extends TdObject {
  @override
  String get tdType => 'videoNote';

   late int duration;
   late int length;
   late Minithumbnail minithumbnail;
   late Thumbnail thumbnail;
   late File video;

  @override
  Map<String, dynamic> get params => {
    'duration': duration,
    'length': length,
    'minithumbnail': minithumbnail,
    'thumbnail': thumbnail,
    'video': video,
  };

  VideoNote({
  required this.duration,
  required this.length,
  required this.minithumbnail,
  required this.thumbnail,
  required this.video,
  });

  VideoNote.fromJson(Map<String, dynamic> json) {
    duration = tryConvertToTdObject(json['duration']);
    length = tryConvertToTdObject(json['length']);
    minithumbnail = tryConvertToTdObject(json['minithumbnail']);
    thumbnail = tryConvertToTdObject(json['thumbnail']);
    video = tryConvertToTdObject(json['video']);
  }
}

@reflector
class VoiceNote extends TdObject {
  @override
  String get tdType => 'voiceNote';

   late int duration;
   late String waveform;
   late String mimeType;
   late File voice;

  @override
  Map<String, dynamic> get params => {
    'duration': duration,
    'waveform': waveform,
    'mime_type': mimeType,
    'voice': voice,
  };

  VoiceNote({
  required this.duration,
  required this.waveform,
  required this.mimeType,
  required this.voice,
  });

  VoiceNote.fromJson(Map<String, dynamic> json) {
    duration = tryConvertToTdObject(json['duration']);
    waveform = tryConvertToTdObject(json['waveform']);
    mimeType = tryConvertToTdObject(json['mime_type']);
    voice = tryConvertToTdObject(json['voice']);
  }
}

@reflector
class Contact extends TdObject {
  @override
  String get tdType => 'contact';

   late String phoneNumber;
   late String firstName;
   late String lastName;
   late String vcard;
   late int userId;

  @override
  Map<String, dynamic> get params => {
    'phone_number': phoneNumber,
    'first_name': firstName,
    'last_name': lastName,
    'vcard': vcard,
    'user_id': userId,
  };

  Contact({
  required this.phoneNumber,
  required this.firstName,
  required this.lastName,
  required this.vcard,
  required this.userId,
  });

  Contact.fromJson(Map<String, dynamic> json) {
    phoneNumber = tryConvertToTdObject(json['phone_number']);
    firstName = tryConvertToTdObject(json['first_name']);
    lastName = tryConvertToTdObject(json['last_name']);
    vcard = tryConvertToTdObject(json['vcard']);
    userId = tryConvertToTdObject(json['user_id']);
  }
}

@reflector
class Location extends TdObject {
  @override
  String get tdType => 'location';

   late double latitude;
   late double longitude;
   late double horizontalAccuracy;

  @override
  Map<String, dynamic> get params => {
    'latitude': latitude,
    'longitude': longitude,
    'horizontal_accuracy': horizontalAccuracy,
  };

  Location({
  required this.latitude,
  required this.longitude,
  required this.horizontalAccuracy,
  });

  Location.fromJson(Map<String, dynamic> json) {
    latitude = tryConvertToTdObject(json['latitude']);
    longitude = tryConvertToTdObject(json['longitude']);
    horizontalAccuracy = tryConvertToTdObject(json['horizontal_accuracy']);
  }
}

@reflector
class Venue extends TdObject {
  @override
  String get tdType => 'venue';

   late Location location;
   late String title;
   late String address;
   late String provider;
   late String id;
   late String type;

  @override
  Map<String, dynamic> get params => {
    'location': location,
    'title': title,
    'address': address,
    'provider': provider,
    'id': id,
    'type': type,
  };

  Venue({
  required this.location,
  required this.title,
  required this.address,
  required this.provider,
  required this.id,
  required this.type,
  });

  Venue.fromJson(Map<String, dynamic> json) {
    location = tryConvertToTdObject(json['location']);
    title = tryConvertToTdObject(json['title']);
    address = tryConvertToTdObject(json['address']);
    provider = tryConvertToTdObject(json['provider']);
    id = tryConvertToTdObject(json['id']);
    type = tryConvertToTdObject(json['type']);
  }
}

@reflector
class Game extends TdObject {
  @override
  String get tdType => 'game';

   late int id;
   late String shortName;
   late String title;
   late FormattedText text;
   late String description;
   late Photo photo;
   late Animation animation;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'short_name': shortName,
    'title': title,
    'text': text,
    'description': description,
    'photo': photo,
    'animation': animation,
  };

  Game({
  required this.id,
  required this.shortName,
  required this.title,
  required this.text,
  required this.description,
  required this.photo,
  required this.animation,
  });

  Game.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    shortName = tryConvertToTdObject(json['short_name']);
    title = tryConvertToTdObject(json['title']);
    text = tryConvertToTdObject(json['text']);
    description = tryConvertToTdObject(json['description']);
    photo = tryConvertToTdObject(json['photo']);
    animation = tryConvertToTdObject(json['animation']);
  }
}

@reflector
class Poll extends TdObject {
  @override
  String get tdType => 'poll';

   late int id;
   late String question;
   late List<PollOption> options;
   late int totalVoterCount;
   late List<int> recentVoterUserIds;
   late bool isAnonymous;
   late PollType type;
   late int openPeriod;
   late int closeDate;
   late bool isClosed;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'question': question,
    'options': options,
    'total_voter_count': totalVoterCount,
    'recent_voter_user_ids': recentVoterUserIds,
    'is_anonymous': isAnonymous,
    'type': type,
    'open_period': openPeriod,
    'close_date': closeDate,
    'is_closed': isClosed,
  };

  Poll({
  required this.id,
  required this.question,
  required this.options,
  required this.totalVoterCount,
  required this.recentVoterUserIds,
  required this.isAnonymous,
  required this.type,
  required this.openPeriod,
  required this.closeDate,
  required this.isClosed,
  });

  Poll.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    question = tryConvertToTdObject(json['question']);
    options = tryConvertToTdObject(json['options']);
    totalVoterCount = tryConvertToTdObject(json['total_voter_count']);
    recentVoterUserIds = tryConvertToTdObject(json['recent_voter_user_ids']);
    isAnonymous = tryConvertToTdObject(json['is_anonymous']);
    type = tryConvertToTdObject(json['type']);
    openPeriod = tryConvertToTdObject(json['open_period']);
    closeDate = tryConvertToTdObject(json['close_date']);
    isClosed = tryConvertToTdObject(json['is_closed']);
  }
}

@reflector
class ProfilePhoto extends TdObject {
  @override
  String get tdType => 'profilePhoto';

   late int id;
   late File small;
   late File big;
   late Minithumbnail minithumbnail;
   late bool hasAnimation;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'small': small,
    'big': big,
    'minithumbnail': minithumbnail,
    'has_animation': hasAnimation,
  };

  ProfilePhoto({
  required this.id,
  required this.small,
  required this.big,
  required this.minithumbnail,
  required this.hasAnimation,
  });

  ProfilePhoto.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    small = tryConvertToTdObject(json['small']);
    big = tryConvertToTdObject(json['big']);
    minithumbnail = tryConvertToTdObject(json['minithumbnail']);
    hasAnimation = tryConvertToTdObject(json['has_animation']);
  }
}

@reflector
class ChatPhotoInfo extends TdObject {
  @override
  String get tdType => 'chatPhotoInfo';

   late File small;
   late File big;
   late Minithumbnail minithumbnail;
   late bool hasAnimation;

  @override
  Map<String, dynamic> get params => {
    'small': small,
    'big': big,
    'minithumbnail': minithumbnail,
    'has_animation': hasAnimation,
  };

  ChatPhotoInfo({
  required this.small,
  required this.big,
  required this.minithumbnail,
  required this.hasAnimation,
  });

  ChatPhotoInfo.fromJson(Map<String, dynamic> json) {
    small = tryConvertToTdObject(json['small']);
    big = tryConvertToTdObject(json['big']);
    minithumbnail = tryConvertToTdObject(json['minithumbnail']);
    hasAnimation = tryConvertToTdObject(json['has_animation']);
  }
}

abstract class UserType extends TdObject {}

@reflector
class UserTypeRegular extends UserType {
  @override
  String get tdType => 'userTypeRegular';

  @override
  Map<String, dynamic> get params => {};

  UserTypeRegular();

  UserTypeRegular.fromJson(Map<String, dynamic> json);
}

@reflector
class UserTypeDeleted extends UserType {
  @override
  String get tdType => 'userTypeDeleted';

  @override
  Map<String, dynamic> get params => {};

  UserTypeDeleted();

  UserTypeDeleted.fromJson(Map<String, dynamic> json);
}

@reflector
class UserTypeBot extends UserType {
  @override
  String get tdType => 'userTypeBot';

   late bool canJoinGroups;
   late bool canReadAllGroupMessages;
   late bool isInline;
   late String inlineQueryPlaceholder;
   late bool needLocation;

  @override
  Map<String, dynamic> get params => {
    'can_join_groups': canJoinGroups,
    'can_read_all_group_messages': canReadAllGroupMessages,
    'is_inline': isInline,
    'inline_query_placeholder': inlineQueryPlaceholder,
    'need_location': needLocation,
  };

  UserTypeBot({
  required this.canJoinGroups,
  required this.canReadAllGroupMessages,
  required this.isInline,
  required this.inlineQueryPlaceholder,
  required this.needLocation,
  });

  UserTypeBot.fromJson(Map<String, dynamic> json) {
    canJoinGroups = tryConvertToTdObject(json['can_join_groups']);
    canReadAllGroupMessages = tryConvertToTdObject(json['can_read_all_group_messages']);
    isInline = tryConvertToTdObject(json['is_inline']);
    inlineQueryPlaceholder = tryConvertToTdObject(json['inline_query_placeholder']);
    needLocation = tryConvertToTdObject(json['need_location']);
  }
}

@reflector
class UserTypeUnknown extends UserType {
  @override
  String get tdType => 'userTypeUnknown';

  @override
  Map<String, dynamic> get params => {};

  UserTypeUnknown();

  UserTypeUnknown.fromJson(Map<String, dynamic> json);
}

@reflector
class BotCommand extends TdObject {
  @override
  String get tdType => 'botCommand';

   late String command;
   late String description;

  @override
  Map<String, dynamic> get params => {
    'command': command,
    'description': description,
  };

  BotCommand({
  required this.command,
  required this.description,
  });

  BotCommand.fromJson(Map<String, dynamic> json) {
    command = tryConvertToTdObject(json['command']);
    description = tryConvertToTdObject(json['description']);
  }
}

@reflector
class BotCommands extends TdObject {
  @override
  String get tdType => 'botCommands';

   late int botUserId;
   late List<BotCommand> commands;

  @override
  Map<String, dynamic> get params => {
    'bot_user_id': botUserId,
    'commands': commands,
  };

  BotCommands({
  required this.botUserId,
  required this.commands,
  });

  BotCommands.fromJson(Map<String, dynamic> json) {
    botUserId = tryConvertToTdObject(json['bot_user_id']);
    commands = tryConvertToTdObject(json['commands']);
  }
}

@reflector
class ChatLocation extends TdObject {
  @override
  String get tdType => 'chatLocation';

   late Location location;
   late String address;

  @override
  Map<String, dynamic> get params => {
    'location': location,
    'address': address,
  };

  ChatLocation({
  required this.location,
  required this.address,
  });

  ChatLocation.fromJson(Map<String, dynamic> json) {
    location = tryConvertToTdObject(json['location']);
    address = tryConvertToTdObject(json['address']);
  }
}

@reflector
class AnimatedChatPhoto extends TdObject {
  @override
  String get tdType => 'animatedChatPhoto';

   late int length;
   late File file;
   late double mainFrameTimestamp;

  @override
  Map<String, dynamic> get params => {
    'length': length,
    'file': file,
    'main_frame_timestamp': mainFrameTimestamp,
  };

  AnimatedChatPhoto({
  required this.length,
  required this.file,
  required this.mainFrameTimestamp,
  });

  AnimatedChatPhoto.fromJson(Map<String, dynamic> json) {
    length = tryConvertToTdObject(json['length']);
    file = tryConvertToTdObject(json['file']);
    mainFrameTimestamp = tryConvertToTdObject(json['main_frame_timestamp']);
  }
}

@reflector
class ChatPhoto extends TdObject {
  @override
  String get tdType => 'chatPhoto';

   late int id;
   late int addedDate;
   late Minithumbnail minithumbnail;
   late List<PhotoSize> sizes;
   late AnimatedChatPhoto animation;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'added_date': addedDate,
    'minithumbnail': minithumbnail,
    'sizes': sizes,
    'animation': animation,
  };

  ChatPhoto({
  required this.id,
  required this.addedDate,
  required this.minithumbnail,
  required this.sizes,
  required this.animation,
  });

  ChatPhoto.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    addedDate = tryConvertToTdObject(json['added_date']);
    minithumbnail = tryConvertToTdObject(json['minithumbnail']);
    sizes = tryConvertToTdObject(json['sizes']);
    animation = tryConvertToTdObject(json['animation']);
  }
}

@reflector
class ChatPhotos extends TdObject {
  @override
  String get tdType => 'chatPhotos';

   late int totalCount;
   late List<ChatPhoto> photos;

  @override
  Map<String, dynamic> get params => {
    'total_count': totalCount,
    'photos': photos,
  };

  ChatPhotos({
  required this.totalCount,
  required this.photos,
  });

  ChatPhotos.fromJson(Map<String, dynamic> json) {
    totalCount = tryConvertToTdObject(json['total_count']);
    photos = tryConvertToTdObject(json['photos']);
  }
}

abstract class InputChatPhoto extends TdObject {}

@reflector
class InputChatPhotoPrevious extends InputChatPhoto {
  @override
  String get tdType => 'inputChatPhotoPrevious';

   late int chatPhotoId;

  @override
  Map<String, dynamic> get params => {
    'chat_photo_id': chatPhotoId,
  };

  InputChatPhotoPrevious({
  required this.chatPhotoId,
  });

  InputChatPhotoPrevious.fromJson(Map<String, dynamic> json) {
    chatPhotoId = tryConvertToTdObject(json['chat_photo_id']);
  }
}

@reflector
class InputChatPhotoStatic extends InputChatPhoto {
  @override
  String get tdType => 'inputChatPhotoStatic';

   late InputFile photo;

  @override
  Map<String, dynamic> get params => {
    'photo': photo,
  };

  InputChatPhotoStatic({
  required this.photo,
  });

  InputChatPhotoStatic.fromJson(Map<String, dynamic> json) {
    photo = tryConvertToTdObject(json['photo']);
  }
}

@reflector
class InputChatPhotoAnimation extends InputChatPhoto {
  @override
  String get tdType => 'inputChatPhotoAnimation';

   late InputFile animation;
   late double mainFrameTimestamp;

  @override
  Map<String, dynamic> get params => {
    'animation': animation,
    'main_frame_timestamp': mainFrameTimestamp,
  };

  InputChatPhotoAnimation({
  required this.animation,
  required this.mainFrameTimestamp,
  });

  InputChatPhotoAnimation.fromJson(Map<String, dynamic> json) {
    animation = tryConvertToTdObject(json['animation']);
    mainFrameTimestamp = tryConvertToTdObject(json['main_frame_timestamp']);
  }
}

@reflector
class User extends TdObject {
  @override
  String get tdType => 'user';

   late int id;
   late String firstName;
   late String lastName;
   late String username;
   late String phoneNumber;
   late UserStatus status;
   late ProfilePhoto profilePhoto;
   late bool isContact;
   late bool isMutualContact;
   late bool isVerified;
   late bool isSupport;
   late String restrictionReason;
   late bool isScam;
   late bool isFake;
   late bool haveAccess;
   late UserType type;
   late String languageCode;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'first_name': firstName,
    'last_name': lastName,
    'username': username,
    'phone_number': phoneNumber,
    'status': status,
    'profile_photo': profilePhoto,
    'is_contact': isContact,
    'is_mutual_contact': isMutualContact,
    'is_verified': isVerified,
    'is_support': isSupport,
    'restriction_reason': restrictionReason,
    'is_scam': isScam,
    'is_fake': isFake,
    'have_access': haveAccess,
    'type': type,
    'language_code': languageCode,
  };

  User({
  required this.id,
  required this.firstName,
  required this.lastName,
  required this.username,
  required this.phoneNumber,
  required this.status,
  required this.profilePhoto,
  required this.isContact,
  required this.isMutualContact,
  required this.isVerified,
  required this.isSupport,
  required this.restrictionReason,
  required this.isScam,
  required this.isFake,
  required this.haveAccess,
  required this.type,
  required this.languageCode,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    firstName = tryConvertToTdObject(json['first_name']);
    lastName = tryConvertToTdObject(json['last_name']);
    username = tryConvertToTdObject(json['username']);
    phoneNumber = tryConvertToTdObject(json['phone_number']);
    status = tryConvertToTdObject(json['status']);
    profilePhoto = tryConvertToTdObject(json['profile_photo']);
    isContact = tryConvertToTdObject(json['is_contact']);
    isMutualContact = tryConvertToTdObject(json['is_mutual_contact']);
    isVerified = tryConvertToTdObject(json['is_verified']);
    isSupport = tryConvertToTdObject(json['is_support']);
    restrictionReason = tryConvertToTdObject(json['restriction_reason']);
    isScam = tryConvertToTdObject(json['is_scam']);
    isFake = tryConvertToTdObject(json['is_fake']);
    haveAccess = tryConvertToTdObject(json['have_access']);
    type = tryConvertToTdObject(json['type']);
    languageCode = tryConvertToTdObject(json['language_code']);
  }
}

@reflector
class UserFullInfo extends TdObject {
  @override
  String get tdType => 'userFullInfo';

   late ChatPhoto photo;
   late bool isBlocked;
   late bool canBeCalled;
   late bool supportsVideoCalls;
   late bool hasPrivateCalls;
   late bool needPhoneNumberPrivacyException;
   late String bio;
   late String shareText;
   late String description;
   late int groupInCommonCount;
   late List<BotCommand> commands;

  @override
  Map<String, dynamic> get params => {
    'photo': photo,
    'is_blocked': isBlocked,
    'can_be_called': canBeCalled,
    'supports_video_calls': supportsVideoCalls,
    'has_private_calls': hasPrivateCalls,
    'need_phone_number_privacy_exception': needPhoneNumberPrivacyException,
    'bio': bio,
    'share_text': shareText,
    'description': description,
    'group_in_common_count': groupInCommonCount,
    'commands': commands,
  };

  UserFullInfo({
  required this.photo,
  required this.isBlocked,
  required this.canBeCalled,
  required this.supportsVideoCalls,
  required this.hasPrivateCalls,
  required this.needPhoneNumberPrivacyException,
  required this.bio,
  required this.shareText,
  required this.description,
  required this.groupInCommonCount,
  required this.commands,
  });

  UserFullInfo.fromJson(Map<String, dynamic> json) {
    photo = tryConvertToTdObject(json['photo']);
    isBlocked = tryConvertToTdObject(json['is_blocked']);
    canBeCalled = tryConvertToTdObject(json['can_be_called']);
    supportsVideoCalls = tryConvertToTdObject(json['supports_video_calls']);
    hasPrivateCalls = tryConvertToTdObject(json['has_private_calls']);
    needPhoneNumberPrivacyException = tryConvertToTdObject(json['need_phone_number_privacy_exception']);
    bio = tryConvertToTdObject(json['bio']);
    shareText = tryConvertToTdObject(json['share_text']);
    description = tryConvertToTdObject(json['description']);
    groupInCommonCount = tryConvertToTdObject(json['group_in_common_count']);
    commands = tryConvertToTdObject(json['commands']);
  }
}

@reflector
class Users extends TdObject {
  @override
  String get tdType => 'users';

   late int totalCount;
   late List<int> userIds;

  @override
  Map<String, dynamic> get params => {
    'total_count': totalCount,
    'user_ids': userIds,
  };

  Users({
  required this.totalCount,
  required this.userIds,
  });

  Users.fromJson(Map<String, dynamic> json) {
    totalCount = tryConvertToTdObject(json['total_count']);
    userIds = tryConvertToTdObject(json['user_ids']);
  }
}

@reflector
class ChatAdministrator extends TdObject {
  @override
  String get tdType => 'chatAdministrator';

   late int userId;
   late String customTitle;
   late bool isOwner;

  @override
  Map<String, dynamic> get params => {
    'user_id': userId,
    'custom_title': customTitle,
    'is_owner': isOwner,
  };

  ChatAdministrator({
  required this.userId,
  required this.customTitle,
  required this.isOwner,
  });

  ChatAdministrator.fromJson(Map<String, dynamic> json) {
    userId = tryConvertToTdObject(json['user_id']);
    customTitle = tryConvertToTdObject(json['custom_title']);
    isOwner = tryConvertToTdObject(json['is_owner']);
  }
}

@reflector
class ChatAdministrators extends TdObject {
  @override
  String get tdType => 'chatAdministrators';

   late List<ChatAdministrator> administrators;

  @override
  Map<String, dynamic> get params => {
    'administrators': administrators,
  };

  ChatAdministrators({
  required this.administrators,
  });

  ChatAdministrators.fromJson(Map<String, dynamic> json) {
    administrators = tryConvertToTdObject(json['administrators']);
  }
}

@reflector
class ChatPermissions extends TdObject {
  @override
  String get tdType => 'chatPermissions';

   late bool canSendMessages;
   late bool canSendMediaMessages;
   late bool canSendPolls;
   late bool canSendOtherMessages;
   late bool canAddWebPagePreviews;
   late bool canChangeInfo;
   late bool canInviteUsers;
   late bool canPinMessages;

  @override
  Map<String, dynamic> get params => {
    'can_send_messages': canSendMessages,
    'can_send_media_messages': canSendMediaMessages,
    'can_send_polls': canSendPolls,
    'can_send_other_messages': canSendOtherMessages,
    'can_add_web_page_previews': canAddWebPagePreviews,
    'can_change_info': canChangeInfo,
    'can_invite_users': canInviteUsers,
    'can_pin_messages': canPinMessages,
  };

  ChatPermissions({
  required this.canSendMessages,
  required this.canSendMediaMessages,
  required this.canSendPolls,
  required this.canSendOtherMessages,
  required this.canAddWebPagePreviews,
  required this.canChangeInfo,
  required this.canInviteUsers,
  required this.canPinMessages,
  });

  ChatPermissions.fromJson(Map<String, dynamic> json) {
    canSendMessages = tryConvertToTdObject(json['can_send_messages']);
    canSendMediaMessages = tryConvertToTdObject(json['can_send_media_messages']);
    canSendPolls = tryConvertToTdObject(json['can_send_polls']);
    canSendOtherMessages = tryConvertToTdObject(json['can_send_other_messages']);
    canAddWebPagePreviews = tryConvertToTdObject(json['can_add_web_page_previews']);
    canChangeInfo = tryConvertToTdObject(json['can_change_info']);
    canInviteUsers = tryConvertToTdObject(json['can_invite_users']);
    canPinMessages = tryConvertToTdObject(json['can_pin_messages']);
  }
}

abstract class ChatMemberStatus extends TdObject {}

@reflector
class ChatMemberStatusCreator extends ChatMemberStatus {
  @override
  String get tdType => 'chatMemberStatusCreator';

   late String customTitle;
   late bool isAnonymous;
   late bool isMember;

  @override
  Map<String, dynamic> get params => {
    'custom_title': customTitle,
    'is_anonymous': isAnonymous,
    'is_member': isMember,
  };

  ChatMemberStatusCreator({
  required this.customTitle,
  required this.isAnonymous,
  required this.isMember,
  });

  ChatMemberStatusCreator.fromJson(Map<String, dynamic> json) {
    customTitle = tryConvertToTdObject(json['custom_title']);
    isAnonymous = tryConvertToTdObject(json['is_anonymous']);
    isMember = tryConvertToTdObject(json['is_member']);
  }
}

@reflector
class ChatMemberStatusAdministrator extends ChatMemberStatus {
  @override
  String get tdType => 'chatMemberStatusAdministrator';

   late String customTitle;
   late bool canBeEdited;
   late bool canManageChat;
   late bool canChangeInfo;
   late bool canPostMessages;
   late bool canEditMessages;
   late bool canDeleteMessages;
   late bool canInviteUsers;
   late bool canRestrictMembers;
   late bool canPinMessages;
   late bool canPromoteMembers;
   late bool canManageVoiceChats;
   late bool isAnonymous;

  @override
  Map<String, dynamic> get params => {
    'custom_title': customTitle,
    'can_be_edited': canBeEdited,
    'can_manage_chat': canManageChat,
    'can_change_info': canChangeInfo,
    'can_post_messages': canPostMessages,
    'can_edit_messages': canEditMessages,
    'can_delete_messages': canDeleteMessages,
    'can_invite_users': canInviteUsers,
    'can_restrict_members': canRestrictMembers,
    'can_pin_messages': canPinMessages,
    'can_promote_members': canPromoteMembers,
    'can_manage_voice_chats': canManageVoiceChats,
    'is_anonymous': isAnonymous,
  };

  ChatMemberStatusAdministrator({
  required this.customTitle,
  required this.canBeEdited,
  required this.canManageChat,
  required this.canChangeInfo,
  required this.canPostMessages,
  required this.canEditMessages,
  required this.canDeleteMessages,
  required this.canInviteUsers,
  required this.canRestrictMembers,
  required this.canPinMessages,
  required this.canPromoteMembers,
  required this.canManageVoiceChats,
  required this.isAnonymous,
  });

  ChatMemberStatusAdministrator.fromJson(Map<String, dynamic> json) {
    customTitle = tryConvertToTdObject(json['custom_title']);
    canBeEdited = tryConvertToTdObject(json['can_be_edited']);
    canManageChat = tryConvertToTdObject(json['can_manage_chat']);
    canChangeInfo = tryConvertToTdObject(json['can_change_info']);
    canPostMessages = tryConvertToTdObject(json['can_post_messages']);
    canEditMessages = tryConvertToTdObject(json['can_edit_messages']);
    canDeleteMessages = tryConvertToTdObject(json['can_delete_messages']);
    canInviteUsers = tryConvertToTdObject(json['can_invite_users']);
    canRestrictMembers = tryConvertToTdObject(json['can_restrict_members']);
    canPinMessages = tryConvertToTdObject(json['can_pin_messages']);
    canPromoteMembers = tryConvertToTdObject(json['can_promote_members']);
    canManageVoiceChats = tryConvertToTdObject(json['can_manage_voice_chats']);
    isAnonymous = tryConvertToTdObject(json['is_anonymous']);
  }
}

@reflector
class ChatMemberStatusMember extends ChatMemberStatus {
  @override
  String get tdType => 'chatMemberStatusMember';

  @override
  Map<String, dynamic> get params => {};

  ChatMemberStatusMember();

  ChatMemberStatusMember.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatMemberStatusRestricted extends ChatMemberStatus {
  @override
  String get tdType => 'chatMemberStatusRestricted';

   late bool isMember;
   late int restrictedUntilDate;
   late ChatPermissions permissions;

  @override
  Map<String, dynamic> get params => {
    'is_member': isMember,
    'restricted_until_date': restrictedUntilDate,
    'permissions': permissions,
  };

  ChatMemberStatusRestricted({
  required this.isMember,
  required this.restrictedUntilDate,
  required this.permissions,
  });

  ChatMemberStatusRestricted.fromJson(Map<String, dynamic> json) {
    isMember = tryConvertToTdObject(json['is_member']);
    restrictedUntilDate = tryConvertToTdObject(json['restricted_until_date']);
    permissions = tryConvertToTdObject(json['permissions']);
  }
}

@reflector
class ChatMemberStatusLeft extends ChatMemberStatus {
  @override
  String get tdType => 'chatMemberStatusLeft';

  @override
  Map<String, dynamic> get params => {};

  ChatMemberStatusLeft();

  ChatMemberStatusLeft.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatMemberStatusBanned extends ChatMemberStatus {
  @override
  String get tdType => 'chatMemberStatusBanned';

   late int bannedUntilDate;

  @override
  Map<String, dynamic> get params => {
    'banned_until_date': bannedUntilDate,
  };

  ChatMemberStatusBanned({
  required this.bannedUntilDate,
  });

  ChatMemberStatusBanned.fromJson(Map<String, dynamic> json) {
    bannedUntilDate = tryConvertToTdObject(json['banned_until_date']);
  }
}

@reflector
class ChatMember extends TdObject {
  @override
  String get tdType => 'chatMember';

   late MessageSender memberId;
   late int inviterUserId;
   late int joinedChatDate;
   late ChatMemberStatus status;

  @override
  Map<String, dynamic> get params => {
    'member_id': memberId,
    'inviter_user_id': inviterUserId,
    'joined_chat_date': joinedChatDate,
    'status': status,
  };

  ChatMember({
  required this.memberId,
  required this.inviterUserId,
  required this.joinedChatDate,
  required this.status,
  });

  ChatMember.fromJson(Map<String, dynamic> json) {
    memberId = tryConvertToTdObject(json['member_id']);
    inviterUserId = tryConvertToTdObject(json['inviter_user_id']);
    joinedChatDate = tryConvertToTdObject(json['joined_chat_date']);
    status = tryConvertToTdObject(json['status']);
  }
}

@reflector
class ChatMembers extends TdObject {
  @override
  String get tdType => 'chatMembers';

   late int totalCount;
   late List<ChatMember> members;

  @override
  Map<String, dynamic> get params => {
    'total_count': totalCount,
    'members': members,
  };

  ChatMembers({
  required this.totalCount,
  required this.members,
  });

  ChatMembers.fromJson(Map<String, dynamic> json) {
    totalCount = tryConvertToTdObject(json['total_count']);
    members = tryConvertToTdObject(json['members']);
  }
}

abstract class ChatMembersFilter extends TdObject {}

@reflector
class ChatMembersFilterContacts extends ChatMembersFilter {
  @override
  String get tdType => 'chatMembersFilterContacts';

  @override
  Map<String, dynamic> get params => {};

  ChatMembersFilterContacts();

  ChatMembersFilterContacts.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatMembersFilterAdministrators extends ChatMembersFilter {
  @override
  String get tdType => 'chatMembersFilterAdministrators';

  @override
  Map<String, dynamic> get params => {};

  ChatMembersFilterAdministrators();

  ChatMembersFilterAdministrators.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatMembersFilterMembers extends ChatMembersFilter {
  @override
  String get tdType => 'chatMembersFilterMembers';

  @override
  Map<String, dynamic> get params => {};

  ChatMembersFilterMembers();

  ChatMembersFilterMembers.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatMembersFilterMention extends ChatMembersFilter {
  @override
  String get tdType => 'chatMembersFilterMention';

   late int messageThreadId;

  @override
  Map<String, dynamic> get params => {
    'message_thread_id': messageThreadId,
  };

  ChatMembersFilterMention({
  required this.messageThreadId,
  });

  ChatMembersFilterMention.fromJson(Map<String, dynamic> json) {
    messageThreadId = tryConvertToTdObject(json['message_thread_id']);
  }
}

@reflector
class ChatMembersFilterRestricted extends ChatMembersFilter {
  @override
  String get tdType => 'chatMembersFilterRestricted';

  @override
  Map<String, dynamic> get params => {};

  ChatMembersFilterRestricted();

  ChatMembersFilterRestricted.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatMembersFilterBanned extends ChatMembersFilter {
  @override
  String get tdType => 'chatMembersFilterBanned';

  @override
  Map<String, dynamic> get params => {};

  ChatMembersFilterBanned();

  ChatMembersFilterBanned.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatMembersFilterBots extends ChatMembersFilter {
  @override
  String get tdType => 'chatMembersFilterBots';

  @override
  Map<String, dynamic> get params => {};

  ChatMembersFilterBots();

  ChatMembersFilterBots.fromJson(Map<String, dynamic> json);
}

abstract class SupergroupMembersFilter extends TdObject {}

@reflector
class SupergroupMembersFilterRecent extends SupergroupMembersFilter {
  @override
  String get tdType => 'supergroupMembersFilterRecent';

  @override
  Map<String, dynamic> get params => {};

  SupergroupMembersFilterRecent();

  SupergroupMembersFilterRecent.fromJson(Map<String, dynamic> json);
}

@reflector
class SupergroupMembersFilterContacts extends SupergroupMembersFilter {
  @override
  String get tdType => 'supergroupMembersFilterContacts';

   late String query;

  @override
  Map<String, dynamic> get params => {
    'query': query,
  };

  SupergroupMembersFilterContacts({
  required this.query,
  });

  SupergroupMembersFilterContacts.fromJson(Map<String, dynamic> json) {
    query = tryConvertToTdObject(json['query']);
  }
}

@reflector
class SupergroupMembersFilterAdministrators extends SupergroupMembersFilter {
  @override
  String get tdType => 'supergroupMembersFilterAdministrators';

  @override
  Map<String, dynamic> get params => {};

  SupergroupMembersFilterAdministrators();

  SupergroupMembersFilterAdministrators.fromJson(Map<String, dynamic> json);
}

@reflector
class SupergroupMembersFilterSearch extends SupergroupMembersFilter {
  @override
  String get tdType => 'supergroupMembersFilterSearch';

   late String query;

  @override
  Map<String, dynamic> get params => {
    'query': query,
  };

  SupergroupMembersFilterSearch({
  required this.query,
  });

  SupergroupMembersFilterSearch.fromJson(Map<String, dynamic> json) {
    query = tryConvertToTdObject(json['query']);
  }
}

@reflector
class SupergroupMembersFilterRestricted extends SupergroupMembersFilter {
  @override
  String get tdType => 'supergroupMembersFilterRestricted';

   late String query;

  @override
  Map<String, dynamic> get params => {
    'query': query,
  };

  SupergroupMembersFilterRestricted({
  required this.query,
  });

  SupergroupMembersFilterRestricted.fromJson(Map<String, dynamic> json) {
    query = tryConvertToTdObject(json['query']);
  }
}

@reflector
class SupergroupMembersFilterBanned extends SupergroupMembersFilter {
  @override
  String get tdType => 'supergroupMembersFilterBanned';

   late String query;

  @override
  Map<String, dynamic> get params => {
    'query': query,
  };

  SupergroupMembersFilterBanned({
  required this.query,
  });

  SupergroupMembersFilterBanned.fromJson(Map<String, dynamic> json) {
    query = tryConvertToTdObject(json['query']);
  }
}

@reflector
class SupergroupMembersFilterMention extends SupergroupMembersFilter {
  @override
  String get tdType => 'supergroupMembersFilterMention';

   late String query;
   late int messageThreadId;

  @override
  Map<String, dynamic> get params => {
    'query': query,
    'message_thread_id': messageThreadId,
  };

  SupergroupMembersFilterMention({
  required this.query,
  required this.messageThreadId,
  });

  SupergroupMembersFilterMention.fromJson(Map<String, dynamic> json) {
    query = tryConvertToTdObject(json['query']);
    messageThreadId = tryConvertToTdObject(json['message_thread_id']);
  }
}

@reflector
class SupergroupMembersFilterBots extends SupergroupMembersFilter {
  @override
  String get tdType => 'supergroupMembersFilterBots';

  @override
  Map<String, dynamic> get params => {};

  SupergroupMembersFilterBots();

  SupergroupMembersFilterBots.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatInviteLink extends TdObject {
  @override
  String get tdType => 'chatInviteLink';

   late String inviteLink;
   late int creatorUserId;
   late int date;
   late int editDate;
   late int expireDate;
   late int memberLimit;
   late int memberCount;
   late bool isPrimary;
   late bool isRevoked;

  @override
  Map<String, dynamic> get params => {
    'invite_link': inviteLink,
    'creator_user_id': creatorUserId,
    'date': date,
    'edit_date': editDate,
    'expire_date': expireDate,
    'member_limit': memberLimit,
    'member_count': memberCount,
    'is_primary': isPrimary,
    'is_revoked': isRevoked,
  };

  ChatInviteLink({
  required this.inviteLink,
  required this.creatorUserId,
  required this.date,
  required this.editDate,
  required this.expireDate,
  required this.memberLimit,
  required this.memberCount,
  required this.isPrimary,
  required this.isRevoked,
  });

  ChatInviteLink.fromJson(Map<String, dynamic> json) {
    inviteLink = tryConvertToTdObject(json['invite_link']);
    creatorUserId = tryConvertToTdObject(json['creator_user_id']);
    date = tryConvertToTdObject(json['date']);
    editDate = tryConvertToTdObject(json['edit_date']);
    expireDate = tryConvertToTdObject(json['expire_date']);
    memberLimit = tryConvertToTdObject(json['member_limit']);
    memberCount = tryConvertToTdObject(json['member_count']);
    isPrimary = tryConvertToTdObject(json['is_primary']);
    isRevoked = tryConvertToTdObject(json['is_revoked']);
  }
}

@reflector
class ChatInviteLinks extends TdObject {
  @override
  String get tdType => 'chatInviteLinks';

   late int totalCount;
   late List<ChatInviteLink> inviteLinks;

  @override
  Map<String, dynamic> get params => {
    'total_count': totalCount,
    'invite_links': inviteLinks,
  };

  ChatInviteLinks({
  required this.totalCount,
  required this.inviteLinks,
  });

  ChatInviteLinks.fromJson(Map<String, dynamic> json) {
    totalCount = tryConvertToTdObject(json['total_count']);
    inviteLinks = tryConvertToTdObject(json['invite_links']);
  }
}

@reflector
class ChatInviteLinkCount extends TdObject {
  @override
  String get tdType => 'chatInviteLinkCount';

   late int userId;
   late int inviteLinkCount;
   late int revokedInviteLinkCount;

  @override
  Map<String, dynamic> get params => {
    'user_id': userId,
    'invite_link_count': inviteLinkCount,
    'revoked_invite_link_count': revokedInviteLinkCount,
  };

  ChatInviteLinkCount({
  required this.userId,
  required this.inviteLinkCount,
  required this.revokedInviteLinkCount,
  });

  ChatInviteLinkCount.fromJson(Map<String, dynamic> json) {
    userId = tryConvertToTdObject(json['user_id']);
    inviteLinkCount = tryConvertToTdObject(json['invite_link_count']);
    revokedInviteLinkCount = tryConvertToTdObject(json['revoked_invite_link_count']);
  }
}

@reflector
class ChatInviteLinkCounts extends TdObject {
  @override
  String get tdType => 'chatInviteLinkCounts';

   late List<ChatInviteLinkCount> inviteLinkCounts;

  @override
  Map<String, dynamic> get params => {
    'invite_link_counts': inviteLinkCounts,
  };

  ChatInviteLinkCounts({
  required this.inviteLinkCounts,
  });

  ChatInviteLinkCounts.fromJson(Map<String, dynamic> json) {
    inviteLinkCounts = tryConvertToTdObject(json['invite_link_counts']);
  }
}

@reflector
class ChatInviteLinkMember extends TdObject {
  @override
  String get tdType => 'chatInviteLinkMember';

   late int userId;
   late int joinedChatDate;

  @override
  Map<String, dynamic> get params => {
    'user_id': userId,
    'joined_chat_date': joinedChatDate,
  };

  ChatInviteLinkMember({
  required this.userId,
  required this.joinedChatDate,
  });

  ChatInviteLinkMember.fromJson(Map<String, dynamic> json) {
    userId = tryConvertToTdObject(json['user_id']);
    joinedChatDate = tryConvertToTdObject(json['joined_chat_date']);
  }
}

@reflector
class ChatInviteLinkMembers extends TdObject {
  @override
  String get tdType => 'chatInviteLinkMembers';

   late int totalCount;
   late List<ChatInviteLinkMember> members;

  @override
  Map<String, dynamic> get params => {
    'total_count': totalCount,
    'members': members,
  };

  ChatInviteLinkMembers({
  required this.totalCount,
  required this.members,
  });

  ChatInviteLinkMembers.fromJson(Map<String, dynamic> json) {
    totalCount = tryConvertToTdObject(json['total_count']);
    members = tryConvertToTdObject(json['members']);
  }
}

@reflector
class ChatInviteLinkInfo extends TdObject {
  @override
  String get tdType => 'chatInviteLinkInfo';

   late int chatId;
   late int accessibleFor;
   late ChatType type;
   late String title;
   late ChatPhotoInfo photo;
   late int memberCount;
   late List<int> memberUserIds;
   late bool isPublic;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'accessible_for': accessibleFor,
    'type': type,
    'title': title,
    'photo': photo,
    'member_count': memberCount,
    'member_user_ids': memberUserIds,
    'is_public': isPublic,
  };

  ChatInviteLinkInfo({
  required this.chatId,
  required this.accessibleFor,
  required this.type,
  required this.title,
  required this.photo,
  required this.memberCount,
  required this.memberUserIds,
  required this.isPublic,
  });

  ChatInviteLinkInfo.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    accessibleFor = tryConvertToTdObject(json['accessible_for']);
    type = tryConvertToTdObject(json['type']);
    title = tryConvertToTdObject(json['title']);
    photo = tryConvertToTdObject(json['photo']);
    memberCount = tryConvertToTdObject(json['member_count']);
    memberUserIds = tryConvertToTdObject(json['member_user_ids']);
    isPublic = tryConvertToTdObject(json['is_public']);
  }
}

@reflector
class BasicGroup extends TdObject {
  @override
  String get tdType => 'basicGroup';

   late int id;
   late int memberCount;
   late ChatMemberStatus status;
   late bool isActive;
   late int upgradedToSupergroupId;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'member_count': memberCount,
    'status': status,
    'is_active': isActive,
    'upgraded_to_supergroup_id': upgradedToSupergroupId,
  };

  BasicGroup({
  required this.id,
  required this.memberCount,
  required this.status,
  required this.isActive,
  required this.upgradedToSupergroupId,
  });

  BasicGroup.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    memberCount = tryConvertToTdObject(json['member_count']);
    status = tryConvertToTdObject(json['status']);
    isActive = tryConvertToTdObject(json['is_active']);
    upgradedToSupergroupId = tryConvertToTdObject(json['upgraded_to_supergroup_id']);
  }
}

@reflector
class BasicGroupFullInfo extends TdObject {
  @override
  String get tdType => 'basicGroupFullInfo';

   late ChatPhoto photo;
   late String description;
   late int creatorUserId;
   late List<ChatMember> members;
   late ChatInviteLink inviteLink;
   late List<BotCommands> botCommands;

  @override
  Map<String, dynamic> get params => {
    'photo': photo,
    'description': description,
    'creator_user_id': creatorUserId,
    'members': members,
    'invite_link': inviteLink,
    'bot_commands': botCommands,
  };

  BasicGroupFullInfo({
  required this.photo,
  required this.description,
  required this.creatorUserId,
  required this.members,
  required this.inviteLink,
  required this.botCommands,
  });

  BasicGroupFullInfo.fromJson(Map<String, dynamic> json) {
    photo = tryConvertToTdObject(json['photo']);
    description = tryConvertToTdObject(json['description']);
    creatorUserId = tryConvertToTdObject(json['creator_user_id']);
    members = tryConvertToTdObject(json['members']);
    inviteLink = tryConvertToTdObject(json['invite_link']);
    botCommands = tryConvertToTdObject(json['bot_commands']);
  }
}

@reflector
class Supergroup extends TdObject {
  @override
  String get tdType => 'supergroup';

   late int id;
   late String username;
   late int date;
   late ChatMemberStatus status;
   late int memberCount;
   late bool hasLinkedChat;
   late bool hasLocation;
   late bool signMessages;
   late bool isSlowModeEnabled;
   late bool isChannel;
   late bool isBroadcastGroup;
   late bool isVerified;
   late String restrictionReason;
   late bool isScam;
   late bool isFake;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'username': username,
    'date': date,
    'status': status,
    'member_count': memberCount,
    'has_linked_chat': hasLinkedChat,
    'has_location': hasLocation,
    'sign_messages': signMessages,
    'is_slow_mode_enabled': isSlowModeEnabled,
    'is_channel': isChannel,
    'is_broadcast_group': isBroadcastGroup,
    'is_verified': isVerified,
    'restriction_reason': restrictionReason,
    'is_scam': isScam,
    'is_fake': isFake,
  };

  Supergroup({
  required this.id,
  required this.username,
  required this.date,
  required this.status,
  required this.memberCount,
  required this.hasLinkedChat,
  required this.hasLocation,
  required this.signMessages,
  required this.isSlowModeEnabled,
  required this.isChannel,
  required this.isBroadcastGroup,
  required this.isVerified,
  required this.restrictionReason,
  required this.isScam,
  required this.isFake,
  });

  Supergroup.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    username = tryConvertToTdObject(json['username']);
    date = tryConvertToTdObject(json['date']);
    status = tryConvertToTdObject(json['status']);
    memberCount = tryConvertToTdObject(json['member_count']);
    hasLinkedChat = tryConvertToTdObject(json['has_linked_chat']);
    hasLocation = tryConvertToTdObject(json['has_location']);
    signMessages = tryConvertToTdObject(json['sign_messages']);
    isSlowModeEnabled = tryConvertToTdObject(json['is_slow_mode_enabled']);
    isChannel = tryConvertToTdObject(json['is_channel']);
    isBroadcastGroup = tryConvertToTdObject(json['is_broadcast_group']);
    isVerified = tryConvertToTdObject(json['is_verified']);
    restrictionReason = tryConvertToTdObject(json['restriction_reason']);
    isScam = tryConvertToTdObject(json['is_scam']);
    isFake = tryConvertToTdObject(json['is_fake']);
  }
}

@reflector
class SupergroupFullInfo extends TdObject {
  @override
  String get tdType => 'supergroupFullInfo';

   late ChatPhoto photo;
   late String description;
   late int memberCount;
   late int administratorCount;
   late int restrictedCount;
   late int bannedCount;
   late int linkedChatId;
   late int slowModeDelay;
   late double slowModeDelayExpiresIn;
   late bool canGetMembers;
   late bool canSetUsername;
   late bool canSetStickerSet;
   late bool canSetLocation;
   late bool canGetStatistics;
   late bool isAllHistoryAvailable;
   late int stickerSetId;
   late ChatLocation location;
   late ChatInviteLink inviteLink;
   late List<BotCommands> botCommands;
   late int upgradedFromBasicGroupId;
   late int upgradedFromMaxMessageId;

  @override
  Map<String, dynamic> get params => {
    'photo': photo,
    'description': description,
    'member_count': memberCount,
    'administrator_count': administratorCount,
    'restricted_count': restrictedCount,
    'banned_count': bannedCount,
    'linked_chat_id': linkedChatId,
    'slow_mode_delay': slowModeDelay,
    'slow_mode_delay_expires_in': slowModeDelayExpiresIn,
    'can_get_members': canGetMembers,
    'can_set_username': canSetUsername,
    'can_set_sticker_set': canSetStickerSet,
    'can_set_location': canSetLocation,
    'can_get_statistics': canGetStatistics,
    'is_all_history_available': isAllHistoryAvailable,
    'sticker_set_id': stickerSetId,
    'location': location,
    'invite_link': inviteLink,
    'bot_commands': botCommands,
    'upgraded_from_basic_group_id': upgradedFromBasicGroupId,
    'upgraded_from_max_message_id': upgradedFromMaxMessageId,
  };

  SupergroupFullInfo({
  required this.photo,
  required this.description,
  required this.memberCount,
  required this.administratorCount,
  required this.restrictedCount,
  required this.bannedCount,
  required this.linkedChatId,
  required this.slowModeDelay,
  required this.slowModeDelayExpiresIn,
  required this.canGetMembers,
  required this.canSetUsername,
  required this.canSetStickerSet,
  required this.canSetLocation,
  required this.canGetStatistics,
  required this.isAllHistoryAvailable,
  required this.stickerSetId,
  required this.location,
  required this.inviteLink,
  required this.botCommands,
  required this.upgradedFromBasicGroupId,
  required this.upgradedFromMaxMessageId,
  });

  SupergroupFullInfo.fromJson(Map<String, dynamic> json) {
    photo = tryConvertToTdObject(json['photo']);
    description = tryConvertToTdObject(json['description']);
    memberCount = tryConvertToTdObject(json['member_count']);
    administratorCount = tryConvertToTdObject(json['administrator_count']);
    restrictedCount = tryConvertToTdObject(json['restricted_count']);
    bannedCount = tryConvertToTdObject(json['banned_count']);
    linkedChatId = tryConvertToTdObject(json['linked_chat_id']);
    slowModeDelay = tryConvertToTdObject(json['slow_mode_delay']);
    slowModeDelayExpiresIn = tryConvertToTdObject(json['slow_mode_delay_expires_in']);
    canGetMembers = tryConvertToTdObject(json['can_get_members']);
    canSetUsername = tryConvertToTdObject(json['can_set_username']);
    canSetStickerSet = tryConvertToTdObject(json['can_set_sticker_set']);
    canSetLocation = tryConvertToTdObject(json['can_set_location']);
    canGetStatistics = tryConvertToTdObject(json['can_get_statistics']);
    isAllHistoryAvailable = tryConvertToTdObject(json['is_all_history_available']);
    stickerSetId = tryConvertToTdObject(json['sticker_set_id']);
    location = tryConvertToTdObject(json['location']);
    inviteLink = tryConvertToTdObject(json['invite_link']);
    botCommands = tryConvertToTdObject(json['bot_commands']);
    upgradedFromBasicGroupId = tryConvertToTdObject(json['upgraded_from_basic_group_id']);
    upgradedFromMaxMessageId = tryConvertToTdObject(json['upgraded_from_max_message_id']);
  }
}

abstract class SecretChatState extends TdObject {}

@reflector
class SecretChatStatePending extends SecretChatState {
  @override
  String get tdType => 'secretChatStatePending';

  @override
  Map<String, dynamic> get params => {};

  SecretChatStatePending();

  SecretChatStatePending.fromJson(Map<String, dynamic> json);
}

@reflector
class SecretChatStateReady extends SecretChatState {
  @override
  String get tdType => 'secretChatStateReady';

  @override
  Map<String, dynamic> get params => {};

  SecretChatStateReady();

  SecretChatStateReady.fromJson(Map<String, dynamic> json);
}

@reflector
class SecretChatStateClosed extends SecretChatState {
  @override
  String get tdType => 'secretChatStateClosed';

  @override
  Map<String, dynamic> get params => {};

  SecretChatStateClosed();

  SecretChatStateClosed.fromJson(Map<String, dynamic> json);
}

@reflector
class SecretChat extends TdObject {
  @override
  String get tdType => 'secretChat';

   late int id;
   late int userId;
   late SecretChatState state;
   late bool isOutbound;
   late String keyHash;
   late int layer;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'user_id': userId,
    'state': state,
    'is_outbound': isOutbound,
    'key_hash': keyHash,
    'layer': layer,
  };

  SecretChat({
  required this.id,
  required this.userId,
  required this.state,
  required this.isOutbound,
  required this.keyHash,
  required this.layer,
  });

  SecretChat.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    userId = tryConvertToTdObject(json['user_id']);
    state = tryConvertToTdObject(json['state']);
    isOutbound = tryConvertToTdObject(json['is_outbound']);
    keyHash = tryConvertToTdObject(json['key_hash']);
    layer = tryConvertToTdObject(json['layer']);
  }
}

abstract class MessageSender extends TdObject {}

@reflector
class MessageSenderUser extends MessageSender {
  @override
  String get tdType => 'messageSenderUser';

   late int userId;

  @override
  Map<String, dynamic> get params => {
    'user_id': userId,
  };

  MessageSenderUser({
  required this.userId,
  });

  MessageSenderUser.fromJson(Map<String, dynamic> json) {
    userId = tryConvertToTdObject(json['user_id']);
  }
}

@reflector
class MessageSenderChat extends MessageSender {
  @override
  String get tdType => 'messageSenderChat';

   late int chatId;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
  };

  MessageSenderChat({
  required this.chatId,
  });

  MessageSenderChat.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
  }
}

@reflector
class MessageSenders extends TdObject {
  @override
  String get tdType => 'messageSenders';

   late int totalCount;
   late List<MessageSender> senders;

  @override
  Map<String, dynamic> get params => {
    'total_count': totalCount,
    'senders': senders,
  };

  MessageSenders({
  required this.totalCount,
  required this.senders,
  });

  MessageSenders.fromJson(Map<String, dynamic> json) {
    totalCount = tryConvertToTdObject(json['total_count']);
    senders = tryConvertToTdObject(json['senders']);
  }
}

abstract class MessageForwardOrigin extends TdObject {}

@reflector
class MessageForwardOriginUser extends MessageForwardOrigin {
  @override
  String get tdType => 'messageForwardOriginUser';

   late int senderUserId;

  @override
  Map<String, dynamic> get params => {
    'sender_user_id': senderUserId,
  };

  MessageForwardOriginUser({
  required this.senderUserId,
  });

  MessageForwardOriginUser.fromJson(Map<String, dynamic> json) {
    senderUserId = tryConvertToTdObject(json['sender_user_id']);
  }
}

@reflector
class MessageForwardOriginChat extends MessageForwardOrigin {
  @override
  String get tdType => 'messageForwardOriginChat';

   late int senderChatId;
   late String authorSignature;

  @override
  Map<String, dynamic> get params => {
    'sender_chat_id': senderChatId,
    'author_signature': authorSignature,
  };

  MessageForwardOriginChat({
  required this.senderChatId,
  required this.authorSignature,
  });

  MessageForwardOriginChat.fromJson(Map<String, dynamic> json) {
    senderChatId = tryConvertToTdObject(json['sender_chat_id']);
    authorSignature = tryConvertToTdObject(json['author_signature']);
  }
}

@reflector
class MessageForwardOriginHiddenUser extends MessageForwardOrigin {
  @override
  String get tdType => 'messageForwardOriginHiddenUser';

   late String senderName;

  @override
  Map<String, dynamic> get params => {
    'sender_name': senderName,
  };

  MessageForwardOriginHiddenUser({
  required this.senderName,
  });

  MessageForwardOriginHiddenUser.fromJson(Map<String, dynamic> json) {
    senderName = tryConvertToTdObject(json['sender_name']);
  }
}

@reflector
class MessageForwardOriginChannel extends MessageForwardOrigin {
  @override
  String get tdType => 'messageForwardOriginChannel';

   late int chatId;
   late int messageId;
   late String authorSignature;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'message_id': messageId,
    'author_signature': authorSignature,
  };

  MessageForwardOriginChannel({
  required this.chatId,
  required this.messageId,
  required this.authorSignature,
  });

  MessageForwardOriginChannel.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    messageId = tryConvertToTdObject(json['message_id']);
    authorSignature = tryConvertToTdObject(json['author_signature']);
  }
}

@reflector
class MessageForwardOriginMessageImport extends MessageForwardOrigin {
  @override
  String get tdType => 'messageForwardOriginMessageImport';

   late String senderName;

  @override
  Map<String, dynamic> get params => {
    'sender_name': senderName,
  };

  MessageForwardOriginMessageImport({
  required this.senderName,
  });

  MessageForwardOriginMessageImport.fromJson(Map<String, dynamic> json) {
    senderName = tryConvertToTdObject(json['sender_name']);
  }
}

@reflector
class MessageForwardInfo extends TdObject {
  @override
  String get tdType => 'messageForwardInfo';

   late MessageForwardOrigin origin;
   late int date;
   late String publicServiceAnnouncementType;
   late int fromChatId;
   late int fromMessageId;

  @override
  Map<String, dynamic> get params => {
    'origin': origin,
    'date': date,
    'public_service_announcement_type': publicServiceAnnouncementType,
    'from_chat_id': fromChatId,
    'from_message_id': fromMessageId,
  };

  MessageForwardInfo({
  required this.origin,
  required this.date,
  required this.publicServiceAnnouncementType,
  required this.fromChatId,
  required this.fromMessageId,
  });

  MessageForwardInfo.fromJson(Map<String, dynamic> json) {
    origin = tryConvertToTdObject(json['origin']);
    date = tryConvertToTdObject(json['date']);
    publicServiceAnnouncementType = tryConvertToTdObject(json['public_service_announcement_type']);
    fromChatId = tryConvertToTdObject(json['from_chat_id']);
    fromMessageId = tryConvertToTdObject(json['from_message_id']);
  }
}

@reflector
class MessageReplyInfo extends TdObject {
  @override
  String get tdType => 'messageReplyInfo';

   late int replyCount;
   late List<MessageSender> recentRepliers;
   late int lastReadInboxMessageId;
   late int lastReadOutboxMessageId;
   late int lastMessageId;

  @override
  Map<String, dynamic> get params => {
    'reply_count': replyCount,
    'recent_repliers': recentRepliers,
    'last_read_inbox_message_id': lastReadInboxMessageId,
    'last_read_outbox_message_id': lastReadOutboxMessageId,
    'last_message_id': lastMessageId,
  };

  MessageReplyInfo({
  required this.replyCount,
  required this.recentRepliers,
  required this.lastReadInboxMessageId,
  required this.lastReadOutboxMessageId,
  required this.lastMessageId,
  });

  MessageReplyInfo.fromJson(Map<String, dynamic> json) {
    replyCount = tryConvertToTdObject(json['reply_count']);
    recentRepliers = tryConvertToTdObject(json['recent_repliers']);
    lastReadInboxMessageId = tryConvertToTdObject(json['last_read_inbox_message_id']);
    lastReadOutboxMessageId = tryConvertToTdObject(json['last_read_outbox_message_id']);
    lastMessageId = tryConvertToTdObject(json['last_message_id']);
  }
}

@reflector
class MessageInteractionInfo extends TdObject {
  @override
  String get tdType => 'messageInteractionInfo';

   late int viewCount;
   late int forwardCount;
   late MessageReplyInfo replyInfo;

  @override
  Map<String, dynamic> get params => {
    'view_count': viewCount,
    'forward_count': forwardCount,
    'reply_info': replyInfo,
  };

  MessageInteractionInfo({
  required this.viewCount,
  required this.forwardCount,
  required this.replyInfo,
  });

  MessageInteractionInfo.fromJson(Map<String, dynamic> json) {
    viewCount = tryConvertToTdObject(json['view_count']);
    forwardCount = tryConvertToTdObject(json['forward_count']);
    replyInfo = tryConvertToTdObject(json['reply_info']);
  }
}

abstract class MessageSendingState extends TdObject {}

@reflector
class MessageSendingStatePending extends MessageSendingState {
  @override
  String get tdType => 'messageSendingStatePending';

  @override
  Map<String, dynamic> get params => {};

  MessageSendingStatePending();

  MessageSendingStatePending.fromJson(Map<String, dynamic> json);
}

@reflector
class MessageSendingStateFailed extends MessageSendingState {
  @override
  String get tdType => 'messageSendingStateFailed';

   late int errorCode;
   late String errorMessage;
   late bool canRetry;
   late double retryAfter;

  @override
  Map<String, dynamic> get params => {
    'error_code': errorCode,
    'error_message': errorMessage,
    'can_retry': canRetry,
    'retry_after': retryAfter,
  };

  MessageSendingStateFailed({
  required this.errorCode,
  required this.errorMessage,
  required this.canRetry,
  required this.retryAfter,
  });

  MessageSendingStateFailed.fromJson(Map<String, dynamic> json) {
    errorCode = tryConvertToTdObject(json['error_code']);
    errorMessage = tryConvertToTdObject(json['error_message']);
    canRetry = tryConvertToTdObject(json['can_retry']);
    retryAfter = tryConvertToTdObject(json['retry_after']);
  }
}

@reflector
class Message extends TdObject {
  @override
  String get tdType => 'message';

   late int id;
   late MessageSender sender;
   late int chatId;
   late MessageSendingState sendingState;
   late MessageSchedulingState schedulingState;
   late bool isOutgoing;
   late bool isPinned;
   late bool canBeEdited;
   late bool canBeForwarded;
   late bool canBeDeletedOnlyForSelf;
   late bool canBeDeletedForAllUsers;
   late bool canGetStatistics;
   late bool canGetMessageThread;
   late bool canGetViewers;
   late bool canGetMediaTimestampLinks;
   late bool hasTimestampedMedia;
   late bool isChannelPost;
   late bool containsUnreadMention;
   late int date;
   late int editDate;
   late MessageForwardInfo forwardInfo;
   late MessageInteractionInfo interactionInfo;
   late int replyInChatId;
   late int replyToMessageId;
   late int messageThreadId;
   late int ttl;
   late double ttlExpiresIn;
   late int viaBotUserId;
   late String authorSignature;
   late int mediaAlbumId;
   late String restrictionReason;
   late MessageContent content;
   late ReplyMarkup replyMarkup;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'sender': sender,
    'chat_id': chatId,
    'sending_state': sendingState,
    'scheduling_state': schedulingState,
    'is_outgoing': isOutgoing,
    'is_pinned': isPinned,
    'can_be_edited': canBeEdited,
    'can_be_forwarded': canBeForwarded,
    'can_be_deleted_only_for_self': canBeDeletedOnlyForSelf,
    'can_be_deleted_for_all_users': canBeDeletedForAllUsers,
    'can_get_statistics': canGetStatistics,
    'can_get_message_thread': canGetMessageThread,
    'can_get_viewers': canGetViewers,
    'can_get_media_timestamp_links': canGetMediaTimestampLinks,
    'has_timestamped_media': hasTimestampedMedia,
    'is_channel_post': isChannelPost,
    'contains_unread_mention': containsUnreadMention,
    'date': date,
    'edit_date': editDate,
    'forward_info': forwardInfo,
    'interaction_info': interactionInfo,
    'reply_in_chat_id': replyInChatId,
    'reply_to_message_id': replyToMessageId,
    'message_thread_id': messageThreadId,
    'ttl': ttl,
    'ttl_expires_in': ttlExpiresIn,
    'via_bot_user_id': viaBotUserId,
    'author_signature': authorSignature,
    'media_album_id': mediaAlbumId,
    'restriction_reason': restrictionReason,
    'content': content,
    'reply_markup': replyMarkup,
  };

  Message({
  required this.id,
  required this.sender,
  required this.chatId,
  required this.sendingState,
  required this.schedulingState,
  required this.isOutgoing,
  required this.isPinned,
  required this.canBeEdited,
  required this.canBeForwarded,
  required this.canBeDeletedOnlyForSelf,
  required this.canBeDeletedForAllUsers,
  required this.canGetStatistics,
  required this.canGetMessageThread,
  required this.canGetViewers,
  required this.canGetMediaTimestampLinks,
  required this.hasTimestampedMedia,
  required this.isChannelPost,
  required this.containsUnreadMention,
  required this.date,
  required this.editDate,
  required this.forwardInfo,
  required this.interactionInfo,
  required this.replyInChatId,
  required this.replyToMessageId,
  required this.messageThreadId,
  required this.ttl,
  required this.ttlExpiresIn,
  required this.viaBotUserId,
  required this.authorSignature,
  required this.mediaAlbumId,
  required this.restrictionReason,
  required this.content,
  required this.replyMarkup,
  });

  Message.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    sender = tryConvertToTdObject(json['sender']);
    chatId = tryConvertToTdObject(json['chat_id']);
    sendingState = tryConvertToTdObject(json['sending_state']);
    schedulingState = tryConvertToTdObject(json['scheduling_state']);
    isOutgoing = tryConvertToTdObject(json['is_outgoing']);
    isPinned = tryConvertToTdObject(json['is_pinned']);
    canBeEdited = tryConvertToTdObject(json['can_be_edited']);
    canBeForwarded = tryConvertToTdObject(json['can_be_forwarded']);
    canBeDeletedOnlyForSelf = tryConvertToTdObject(json['can_be_deleted_only_for_self']);
    canBeDeletedForAllUsers = tryConvertToTdObject(json['can_be_deleted_for_all_users']);
    canGetStatistics = tryConvertToTdObject(json['can_get_statistics']);
    canGetMessageThread = tryConvertToTdObject(json['can_get_message_thread']);
    canGetViewers = tryConvertToTdObject(json['can_get_viewers']);
    canGetMediaTimestampLinks = tryConvertToTdObject(json['can_get_media_timestamp_links']);
    hasTimestampedMedia = tryConvertToTdObject(json['has_timestamped_media']);
    isChannelPost = tryConvertToTdObject(json['is_channel_post']);
    containsUnreadMention = tryConvertToTdObject(json['contains_unread_mention']);
    date = tryConvertToTdObject(json['date']);
    editDate = tryConvertToTdObject(json['edit_date']);
    forwardInfo = tryConvertToTdObject(json['forward_info']);
    interactionInfo = tryConvertToTdObject(json['interaction_info']);
    replyInChatId = tryConvertToTdObject(json['reply_in_chat_id']);
    replyToMessageId = tryConvertToTdObject(json['reply_to_message_id']);
    messageThreadId = tryConvertToTdObject(json['message_thread_id']);
    ttl = tryConvertToTdObject(json['ttl']);
    ttlExpiresIn = tryConvertToTdObject(json['ttl_expires_in']);
    viaBotUserId = tryConvertToTdObject(json['via_bot_user_id']);
    authorSignature = tryConvertToTdObject(json['author_signature']);
    mediaAlbumId = tryConvertToTdObject(json['media_album_id']);
    restrictionReason = tryConvertToTdObject(json['restriction_reason']);
    content = tryConvertToTdObject(json['content']);
    replyMarkup = tryConvertToTdObject(json['reply_markup']);
  }
}

@reflector
class Messages extends TdObject {
  @override
  String get tdType => 'messages';

   late int totalCount;
   late List<Message> messages;

  @override
  Map<String, dynamic> get params => {
    'total_count': totalCount,
    'messages': messages,
  };

  Messages({
  required this.totalCount,
  required this.messages,
  });

  Messages.fromJson(Map<String, dynamic> json) {
    totalCount = tryConvertToTdObject(json['total_count']);
    messages = tryConvertToTdObject(json['messages']);
  }
}

@reflector
class FoundMessages extends TdObject {
  @override
  String get tdType => 'foundMessages';

   late int totalCount;
   late List<Message> messages;
   late String nextOffset;

  @override
  Map<String, dynamic> get params => {
    'total_count': totalCount,
    'messages': messages,
    'next_offset': nextOffset,
  };

  FoundMessages({
  required this.totalCount,
  required this.messages,
  required this.nextOffset,
  });

  FoundMessages.fromJson(Map<String, dynamic> json) {
    totalCount = tryConvertToTdObject(json['total_count']);
    messages = tryConvertToTdObject(json['messages']);
    nextOffset = tryConvertToTdObject(json['next_offset']);
  }
}

@reflector
class SponsoredMessage extends TdObject {
  @override
  String get tdType => 'sponsoredMessage';

   late int id;
   late int sponsorChatId;
   late InternalLinkType link;
   late MessageContent content;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'sponsor_chat_id': sponsorChatId,
    'link': link,
    'content': content,
  };

  SponsoredMessage({
  required this.id,
  required this.sponsorChatId,
  required this.link,
  required this.content,
  });

  SponsoredMessage.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    sponsorChatId = tryConvertToTdObject(json['sponsor_chat_id']);
    link = tryConvertToTdObject(json['link']);
    content = tryConvertToTdObject(json['content']);
  }
}

@reflector
class SponsoredMessages extends TdObject {
  @override
  String get tdType => 'sponsoredMessages';

   late List<SponsoredMessage> messages;

  @override
  Map<String, dynamic> get params => {
    'messages': messages,
  };

  SponsoredMessages({
  required this.messages,
  });

  SponsoredMessages.fromJson(Map<String, dynamic> json) {
    messages = tryConvertToTdObject(json['messages']);
  }
}

abstract class NotificationSettingsScope extends TdObject {}

@reflector
class NotificationSettingsScopePrivateChats extends NotificationSettingsScope {
  @override
  String get tdType => 'notificationSettingsScopePrivateChats';

  @override
  Map<String, dynamic> get params => {};

  NotificationSettingsScopePrivateChats();

  NotificationSettingsScopePrivateChats.fromJson(Map<String, dynamic> json);
}

@reflector
class NotificationSettingsScopeGroupChats extends NotificationSettingsScope {
  @override
  String get tdType => 'notificationSettingsScopeGroupChats';

  @override
  Map<String, dynamic> get params => {};

  NotificationSettingsScopeGroupChats();

  NotificationSettingsScopeGroupChats.fromJson(Map<String, dynamic> json);
}

@reflector
class NotificationSettingsScopeChannelChats extends NotificationSettingsScope {
  @override
  String get tdType => 'notificationSettingsScopeChannelChats';

  @override
  Map<String, dynamic> get params => {};

  NotificationSettingsScopeChannelChats();

  NotificationSettingsScopeChannelChats.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatNotificationSettings extends TdObject {
  @override
  String get tdType => 'chatNotificationSettings';

   late bool useDefaultMuteFor;
   late int muteFor;
   late bool useDefaultSound;
   late String sound;
   late bool useDefaultShowPreview;
   late bool showPreview;
   late bool useDefaultDisablePinnedMessageNotifications;
   late bool disablePinnedMessageNotifications;
   late bool useDefaultDisableMentionNotifications;
   late bool disableMentionNotifications;

  @override
  Map<String, dynamic> get params => {
    'use_default_mute_for': useDefaultMuteFor,
    'mute_for': muteFor,
    'use_default_sound': useDefaultSound,
    'sound': sound,
    'use_default_show_preview': useDefaultShowPreview,
    'show_preview': showPreview,
    'use_default_disable_pinned_message_notifications': useDefaultDisablePinnedMessageNotifications,
    'disable_pinned_message_notifications': disablePinnedMessageNotifications,
    'use_default_disable_mention_notifications': useDefaultDisableMentionNotifications,
    'disable_mention_notifications': disableMentionNotifications,
  };

  ChatNotificationSettings({
  required this.useDefaultMuteFor,
  required this.muteFor,
  required this.useDefaultSound,
  required this.sound,
  required this.useDefaultShowPreview,
  required this.showPreview,
  required this.useDefaultDisablePinnedMessageNotifications,
  required this.disablePinnedMessageNotifications,
  required this.useDefaultDisableMentionNotifications,
  required this.disableMentionNotifications,
  });

  ChatNotificationSettings.fromJson(Map<String, dynamic> json) {
    useDefaultMuteFor = tryConvertToTdObject(json['use_default_mute_for']);
    muteFor = tryConvertToTdObject(json['mute_for']);
    useDefaultSound = tryConvertToTdObject(json['use_default_sound']);
    sound = tryConvertToTdObject(json['sound']);
    useDefaultShowPreview = tryConvertToTdObject(json['use_default_show_preview']);
    showPreview = tryConvertToTdObject(json['show_preview']);
    useDefaultDisablePinnedMessageNotifications = tryConvertToTdObject(json['use_default_disable_pinned_message_notifications']);
    disablePinnedMessageNotifications = tryConvertToTdObject(json['disable_pinned_message_notifications']);
    useDefaultDisableMentionNotifications = tryConvertToTdObject(json['use_default_disable_mention_notifications']);
    disableMentionNotifications = tryConvertToTdObject(json['disable_mention_notifications']);
  }
}

@reflector
class ScopeNotificationSettings extends TdObject {
  @override
  String get tdType => 'scopeNotificationSettings';

   late int muteFor;
   late String sound;
   late bool showPreview;
   late bool disablePinnedMessageNotifications;
   late bool disableMentionNotifications;

  @override
  Map<String, dynamic> get params => {
    'mute_for': muteFor,
    'sound': sound,
    'show_preview': showPreview,
    'disable_pinned_message_notifications': disablePinnedMessageNotifications,
    'disable_mention_notifications': disableMentionNotifications,
  };

  ScopeNotificationSettings({
  required this.muteFor,
  required this.sound,
  required this.showPreview,
  required this.disablePinnedMessageNotifications,
  required this.disableMentionNotifications,
  });

  ScopeNotificationSettings.fromJson(Map<String, dynamic> json) {
    muteFor = tryConvertToTdObject(json['mute_for']);
    sound = tryConvertToTdObject(json['sound']);
    showPreview = tryConvertToTdObject(json['show_preview']);
    disablePinnedMessageNotifications = tryConvertToTdObject(json['disable_pinned_message_notifications']);
    disableMentionNotifications = tryConvertToTdObject(json['disable_mention_notifications']);
  }
}

@reflector
class DraftMessage extends TdObject {
  @override
  String get tdType => 'draftMessage';

   late int replyToMessageId;
   late int date;
   late InputMessageContent inputMessageText;

  @override
  Map<String, dynamic> get params => {
    'reply_to_message_id': replyToMessageId,
    'date': date,
    'input_message_text': inputMessageText,
  };

  DraftMessage({
  required this.replyToMessageId,
  required this.date,
  required this.inputMessageText,
  });

  DraftMessage.fromJson(Map<String, dynamic> json) {
    replyToMessageId = tryConvertToTdObject(json['reply_to_message_id']);
    date = tryConvertToTdObject(json['date']);
    inputMessageText = tryConvertToTdObject(json['input_message_text']);
  }
}

abstract class ChatType extends TdObject {}

@reflector
class ChatTypePrivate extends ChatType {
  @override
  String get tdType => 'chatTypePrivate';

   late int userId;

  @override
  Map<String, dynamic> get params => {
    'user_id': userId,
  };

  ChatTypePrivate({
  required this.userId,
  });

  ChatTypePrivate.fromJson(Map<String, dynamic> json) {
    userId = tryConvertToTdObject(json['user_id']);
  }
}

@reflector
class ChatTypeBasicGroup extends ChatType {
  @override
  String get tdType => 'chatTypeBasicGroup';

   late int basicGroupId;

  @override
  Map<String, dynamic> get params => {
    'basic_group_id': basicGroupId,
  };

  ChatTypeBasicGroup({
  required this.basicGroupId,
  });

  ChatTypeBasicGroup.fromJson(Map<String, dynamic> json) {
    basicGroupId = tryConvertToTdObject(json['basic_group_id']);
  }
}

@reflector
class ChatTypeSupergroup extends ChatType {
  @override
  String get tdType => 'chatTypeSupergroup';

   late int supergroupId;
   late bool isChannel;

  @override
  Map<String, dynamic> get params => {
    'supergroup_id': supergroupId,
    'is_channel': isChannel,
  };

  ChatTypeSupergroup({
  required this.supergroupId,
  required this.isChannel,
  });

  ChatTypeSupergroup.fromJson(Map<String, dynamic> json) {
    supergroupId = tryConvertToTdObject(json['supergroup_id']);
    isChannel = tryConvertToTdObject(json['is_channel']);
  }
}

@reflector
class ChatTypeSecret extends ChatType {
  @override
  String get tdType => 'chatTypeSecret';

   late int secretChatId;
   late int userId;

  @override
  Map<String, dynamic> get params => {
    'secret_chat_id': secretChatId,
    'user_id': userId,
  };

  ChatTypeSecret({
  required this.secretChatId,
  required this.userId,
  });

  ChatTypeSecret.fromJson(Map<String, dynamic> json) {
    secretChatId = tryConvertToTdObject(json['secret_chat_id']);
    userId = tryConvertToTdObject(json['user_id']);
  }
}

@reflector
class ChatFilter extends TdObject {
  @override
  String get tdType => 'chatFilter';

   late String title;
   late String iconName;
   late List<int> pinnedChatIds;
   late List<int> includedChatIds;
   late List<int> excludedChatIds;
   late bool excludeMuted;
   late bool excludeRead;
   late bool excludeArchived;
   late bool includeContacts;
   late bool includeNonContacts;
   late bool includeBots;
   late bool includeGroups;
   late bool includeChannels;

  @override
  Map<String, dynamic> get params => {
    'title': title,
    'icon_name': iconName,
    'pinned_chat_ids': pinnedChatIds,
    'included_chat_ids': includedChatIds,
    'excluded_chat_ids': excludedChatIds,
    'exclude_muted': excludeMuted,
    'exclude_read': excludeRead,
    'exclude_archived': excludeArchived,
    'include_contacts': includeContacts,
    'include_non_contacts': includeNonContacts,
    'include_bots': includeBots,
    'include_groups': includeGroups,
    'include_channels': includeChannels,
  };

  ChatFilter({
  required this.title,
  required this.iconName,
  required this.pinnedChatIds,
  required this.includedChatIds,
  required this.excludedChatIds,
  required this.excludeMuted,
  required this.excludeRead,
  required this.excludeArchived,
  required this.includeContacts,
  required this.includeNonContacts,
  required this.includeBots,
  required this.includeGroups,
  required this.includeChannels,
  });

  ChatFilter.fromJson(Map<String, dynamic> json) {
    title = tryConvertToTdObject(json['title']);
    iconName = tryConvertToTdObject(json['icon_name']);
    pinnedChatIds = tryConvertToTdObject(json['pinned_chat_ids']);
    includedChatIds = tryConvertToTdObject(json['included_chat_ids']);
    excludedChatIds = tryConvertToTdObject(json['excluded_chat_ids']);
    excludeMuted = tryConvertToTdObject(json['exclude_muted']);
    excludeRead = tryConvertToTdObject(json['exclude_read']);
    excludeArchived = tryConvertToTdObject(json['exclude_archived']);
    includeContacts = tryConvertToTdObject(json['include_contacts']);
    includeNonContacts = tryConvertToTdObject(json['include_non_contacts']);
    includeBots = tryConvertToTdObject(json['include_bots']);
    includeGroups = tryConvertToTdObject(json['include_groups']);
    includeChannels = tryConvertToTdObject(json['include_channels']);
  }
}

@reflector
class ChatFilterInfo extends TdObject {
  @override
  String get tdType => 'chatFilterInfo';

   late int id;
   late String title;
   late String iconName;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'title': title,
    'icon_name': iconName,
  };

  ChatFilterInfo({
  required this.id,
  required this.title,
  required this.iconName,
  });

  ChatFilterInfo.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    title = tryConvertToTdObject(json['title']);
    iconName = tryConvertToTdObject(json['icon_name']);
  }
}

@reflector
class RecommendedChatFilter extends TdObject {
  @override
  String get tdType => 'recommendedChatFilter';

   late ChatFilter filter;
   late String description;

  @override
  Map<String, dynamic> get params => {
    'filter': filter,
    'description': description,
  };

  RecommendedChatFilter({
  required this.filter,
  required this.description,
  });

  RecommendedChatFilter.fromJson(Map<String, dynamic> json) {
    filter = tryConvertToTdObject(json['filter']);
    description = tryConvertToTdObject(json['description']);
  }
}

@reflector
class RecommendedChatFilters extends TdObject {
  @override
  String get tdType => 'recommendedChatFilters';

   late List<RecommendedChatFilter> chatFilters;

  @override
  Map<String, dynamic> get params => {
    'chat_filters': chatFilters,
  };

  RecommendedChatFilters({
  required this.chatFilters,
  });

  RecommendedChatFilters.fromJson(Map<String, dynamic> json) {
    chatFilters = tryConvertToTdObject(json['chat_filters']);
  }
}

abstract class ChatList extends TdObject {}

@reflector
class ChatListMain extends ChatList {
  @override
  String get tdType => 'chatListMain';

  @override
  Map<String, dynamic> get params => {};

  ChatListMain();

  ChatListMain.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatListArchive extends ChatList {
  @override
  String get tdType => 'chatListArchive';

  @override
  Map<String, dynamic> get params => {};

  ChatListArchive();

  ChatListArchive.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatListFilter extends ChatList {
  @override
  String get tdType => 'chatListFilter';

   late int chatFilterId;

  @override
  Map<String, dynamic> get params => {
    'chat_filter_id': chatFilterId,
  };

  ChatListFilter({
  required this.chatFilterId,
  });

  ChatListFilter.fromJson(Map<String, dynamic> json) {
    chatFilterId = tryConvertToTdObject(json['chat_filter_id']);
  }
}

@reflector
class ChatLists extends TdObject {
  @override
  String get tdType => 'chatLists';

   late List<ChatList> chatLists;

  @override
  Map<String, dynamic> get params => {
    'chat_lists': chatLists,
  };

  ChatLists({
  required this.chatLists,
  });

  ChatLists.fromJson(Map<String, dynamic> json) {
    chatLists = tryConvertToTdObject(json['chat_lists']);
  }
}

abstract class ChatSource extends TdObject {}

@reflector
class ChatSourceMtprotoProxy extends ChatSource {
  @override
  String get tdType => 'chatSourceMtprotoProxy';

  @override
  Map<String, dynamic> get params => {};

  ChatSourceMtprotoProxy();

  ChatSourceMtprotoProxy.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatSourcePublicServiceAnnouncement extends ChatSource {
  @override
  String get tdType => 'chatSourcePublicServiceAnnouncement';

   late String type;
   late String text;

  @override
  Map<String, dynamic> get params => {
    'type': type,
    'text': text,
  };

  ChatSourcePublicServiceAnnouncement({
  required this.type,
  required this.text,
  });

  ChatSourcePublicServiceAnnouncement.fromJson(Map<String, dynamic> json) {
    type = tryConvertToTdObject(json['type']);
    text = tryConvertToTdObject(json['text']);
  }
}

@reflector
class ChatPosition extends TdObject {
  @override
  String get tdType => 'chatPosition';

   late ChatList list;
   late int order;
   late bool isPinned;
   late ChatSource source;

  @override
  Map<String, dynamic> get params => {
    'list': list,
    'order': order,
    'is_pinned': isPinned,
    'source': source,
  };

  ChatPosition({
  required this.list,
  required this.order,
  required this.isPinned,
  required this.source,
  });

  ChatPosition.fromJson(Map<String, dynamic> json) {
    list = tryConvertToTdObject(json['list']);
    order = tryConvertToTdObject(json['order']);
    isPinned = tryConvertToTdObject(json['is_pinned']);
    source = tryConvertToTdObject(json['source']);
  }
}

@reflector
class VoiceChat extends TdObject {
  @override
  String get tdType => 'voiceChat';

   late int groupCallId;
   late bool hasParticipants;
   late MessageSender defaultParticipantId;

  @override
  Map<String, dynamic> get params => {
    'group_call_id': groupCallId,
    'has_participants': hasParticipants,
    'default_participant_id': defaultParticipantId,
  };

  VoiceChat({
  required this.groupCallId,
  required this.hasParticipants,
  required this.defaultParticipantId,
  });

  VoiceChat.fromJson(Map<String, dynamic> json) {
    groupCallId = tryConvertToTdObject(json['group_call_id']);
    hasParticipants = tryConvertToTdObject(json['has_participants']);
    defaultParticipantId = tryConvertToTdObject(json['default_participant_id']);
  }
}

@reflector
class Chat extends TdObject {
  @override
  String get tdType => 'chat';

   late int id;
   late ChatType type;
   late String title;
   late ChatPhotoInfo photo;
   late ChatPermissions permissions;
   late Message lastMessage;
   late List<ChatPosition> positions;
   late bool isMarkedAsUnread;
   late bool isBlocked;
   late bool hasScheduledMessages;
   late bool canBeDeletedOnlyForSelf;
   late bool canBeDeletedForAllUsers;
   late bool canBeReported;
   late bool defaultDisableNotification;
   late int unreadCount;
   late int lastReadInboxMessageId;
   late int lastReadOutboxMessageId;
   late int unreadMentionCount;
   late ChatNotificationSettings notificationSettings;
   late int messageTtlSetting;
   late String themeName;
   late ChatActionBar actionBar;
   late VoiceChat voiceChat;
   late int replyMarkupMessageId;
   late DraftMessage draftMessage;
   late String clientData;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'type': type,
    'title': title,
    'photo': photo,
    'permissions': permissions,
    'last_message': lastMessage,
    'positions': positions,
    'is_marked_as_unread': isMarkedAsUnread,
    'is_blocked': isBlocked,
    'has_scheduled_messages': hasScheduledMessages,
    'can_be_deleted_only_for_self': canBeDeletedOnlyForSelf,
    'can_be_deleted_for_all_users': canBeDeletedForAllUsers,
    'can_be_reported': canBeReported,
    'default_disable_notification': defaultDisableNotification,
    'unread_count': unreadCount,
    'last_read_inbox_message_id': lastReadInboxMessageId,
    'last_read_outbox_message_id': lastReadOutboxMessageId,
    'unread_mention_count': unreadMentionCount,
    'notification_settings': notificationSettings,
    'message_ttl_setting': messageTtlSetting,
    'theme_name': themeName,
    'action_bar': actionBar,
    'voice_chat': voiceChat,
    'reply_markup_message_id': replyMarkupMessageId,
    'draft_message': draftMessage,
    'client_data': clientData,
  };

  Chat({
  required this.id,
  required this.type,
  required this.title,
  required this.photo,
  required this.permissions,
  required this.lastMessage,
  required this.positions,
  required this.isMarkedAsUnread,
  required this.isBlocked,
  required this.hasScheduledMessages,
  required this.canBeDeletedOnlyForSelf,
  required this.canBeDeletedForAllUsers,
  required this.canBeReported,
  required this.defaultDisableNotification,
  required this.unreadCount,
  required this.lastReadInboxMessageId,
  required this.lastReadOutboxMessageId,
  required this.unreadMentionCount,
  required this.notificationSettings,
  required this.messageTtlSetting,
  required this.themeName,
  required this.actionBar,
  required this.voiceChat,
  required this.replyMarkupMessageId,
  required this.draftMessage,
  required this.clientData,
  });

  Chat.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    type = tryConvertToTdObject(json['type']);
    title = tryConvertToTdObject(json['title']);
    photo = tryConvertToTdObject(json['photo']);
    permissions = tryConvertToTdObject(json['permissions']);
    lastMessage = tryConvertToTdObject(json['last_message']);
    positions = tryConvertToTdObject(json['positions']);
    isMarkedAsUnread = tryConvertToTdObject(json['is_marked_as_unread']);
    isBlocked = tryConvertToTdObject(json['is_blocked']);
    hasScheduledMessages = tryConvertToTdObject(json['has_scheduled_messages']);
    canBeDeletedOnlyForSelf = tryConvertToTdObject(json['can_be_deleted_only_for_self']);
    canBeDeletedForAllUsers = tryConvertToTdObject(json['can_be_deleted_for_all_users']);
    canBeReported = tryConvertToTdObject(json['can_be_reported']);
    defaultDisableNotification = tryConvertToTdObject(json['default_disable_notification']);
    unreadCount = tryConvertToTdObject(json['unread_count']);
    lastReadInboxMessageId = tryConvertToTdObject(json['last_read_inbox_message_id']);
    lastReadOutboxMessageId = tryConvertToTdObject(json['last_read_outbox_message_id']);
    unreadMentionCount = tryConvertToTdObject(json['unread_mention_count']);
    notificationSettings = tryConvertToTdObject(json['notification_settings']);
    messageTtlSetting = tryConvertToTdObject(json['message_ttl_setting']);
    themeName = tryConvertToTdObject(json['theme_name']);
    actionBar = tryConvertToTdObject(json['action_bar']);
    voiceChat = tryConvertToTdObject(json['voice_chat']);
    replyMarkupMessageId = tryConvertToTdObject(json['reply_markup_message_id']);
    draftMessage = tryConvertToTdObject(json['draft_message']);
    clientData = tryConvertToTdObject(json['client_data']);
  }
}

@reflector
class Chats extends TdObject {
  @override
  String get tdType => 'chats';

   late int totalCount;
   late List<int> chatIds;

  @override
  Map<String, dynamic> get params => {
    'total_count': totalCount,
    'chat_ids': chatIds,
  };

  Chats({
  required this.totalCount,
  required this.chatIds,
  });

  Chats.fromJson(Map<String, dynamic> json) {
    totalCount = tryConvertToTdObject(json['total_count']);
    chatIds = tryConvertToTdObject(json['chat_ids']);
  }
}

@reflector
class ChatNearby extends TdObject {
  @override
  String get tdType => 'chatNearby';

   late int chatId;
   late int distance;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'distance': distance,
  };

  ChatNearby({
  required this.chatId,
  required this.distance,
  });

  ChatNearby.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    distance = tryConvertToTdObject(json['distance']);
  }
}

@reflector
class ChatsNearby extends TdObject {
  @override
  String get tdType => 'chatsNearby';

   late List<ChatNearby> usersNearby;
   late List<ChatNearby> supergroupsNearby;

  @override
  Map<String, dynamic> get params => {
    'users_nearby': usersNearby,
    'supergroups_nearby': supergroupsNearby,
  };

  ChatsNearby({
  required this.usersNearby,
  required this.supergroupsNearby,
  });

  ChatsNearby.fromJson(Map<String, dynamic> json) {
    usersNearby = tryConvertToTdObject(json['users_nearby']);
    supergroupsNearby = tryConvertToTdObject(json['supergroups_nearby']);
  }
}

abstract class PublicChatType extends TdObject {}

@reflector
class PublicChatTypeHasUsername extends PublicChatType {
  @override
  String get tdType => 'publicChatTypeHasUsername';

  @override
  Map<String, dynamic> get params => {};

  PublicChatTypeHasUsername();

  PublicChatTypeHasUsername.fromJson(Map<String, dynamic> json);
}

@reflector
class PublicChatTypeIsLocationBased extends PublicChatType {
  @override
  String get tdType => 'publicChatTypeIsLocationBased';

  @override
  Map<String, dynamic> get params => {};

  PublicChatTypeIsLocationBased();

  PublicChatTypeIsLocationBased.fromJson(Map<String, dynamic> json);
}

abstract class ChatActionBar extends TdObject {}

@reflector
class ChatActionBarReportSpam extends ChatActionBar {
  @override
  String get tdType => 'chatActionBarReportSpam';

   late bool canUnarchive;

  @override
  Map<String, dynamic> get params => {
    'can_unarchive': canUnarchive,
  };

  ChatActionBarReportSpam({
  required this.canUnarchive,
  });

  ChatActionBarReportSpam.fromJson(Map<String, dynamic> json) {
    canUnarchive = tryConvertToTdObject(json['can_unarchive']);
  }
}

@reflector
class ChatActionBarReportUnrelatedLocation extends ChatActionBar {
  @override
  String get tdType => 'chatActionBarReportUnrelatedLocation';

  @override
  Map<String, dynamic> get params => {};

  ChatActionBarReportUnrelatedLocation();

  ChatActionBarReportUnrelatedLocation.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatActionBarInviteMembers extends ChatActionBar {
  @override
  String get tdType => 'chatActionBarInviteMembers';

  @override
  Map<String, dynamic> get params => {};

  ChatActionBarInviteMembers();

  ChatActionBarInviteMembers.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatActionBarReportAddBlock extends ChatActionBar {
  @override
  String get tdType => 'chatActionBarReportAddBlock';

   late bool canUnarchive;
   late int distance;

  @override
  Map<String, dynamic> get params => {
    'can_unarchive': canUnarchive,
    'distance': distance,
  };

  ChatActionBarReportAddBlock({
  required this.canUnarchive,
  required this.distance,
  });

  ChatActionBarReportAddBlock.fromJson(Map<String, dynamic> json) {
    canUnarchive = tryConvertToTdObject(json['can_unarchive']);
    distance = tryConvertToTdObject(json['distance']);
  }
}

@reflector
class ChatActionBarAddContact extends ChatActionBar {
  @override
  String get tdType => 'chatActionBarAddContact';

  @override
  Map<String, dynamic> get params => {};

  ChatActionBarAddContact();

  ChatActionBarAddContact.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatActionBarSharePhoneNumber extends ChatActionBar {
  @override
  String get tdType => 'chatActionBarSharePhoneNumber';

  @override
  Map<String, dynamic> get params => {};

  ChatActionBarSharePhoneNumber();

  ChatActionBarSharePhoneNumber.fromJson(Map<String, dynamic> json);
}

abstract class KeyboardButtonType extends TdObject {}

@reflector
class KeyboardButtonTypeText extends KeyboardButtonType {
  @override
  String get tdType => 'keyboardButtonTypeText';

  @override
  Map<String, dynamic> get params => {};

  KeyboardButtonTypeText();

  KeyboardButtonTypeText.fromJson(Map<String, dynamic> json);
}

@reflector
class KeyboardButtonTypeRequestPhoneNumber extends KeyboardButtonType {
  @override
  String get tdType => 'keyboardButtonTypeRequestPhoneNumber';

  @override
  Map<String, dynamic> get params => {};

  KeyboardButtonTypeRequestPhoneNumber();

  KeyboardButtonTypeRequestPhoneNumber.fromJson(Map<String, dynamic> json);
}

@reflector
class KeyboardButtonTypeRequestLocation extends KeyboardButtonType {
  @override
  String get tdType => 'keyboardButtonTypeRequestLocation';

  @override
  Map<String, dynamic> get params => {};

  KeyboardButtonTypeRequestLocation();

  KeyboardButtonTypeRequestLocation.fromJson(Map<String, dynamic> json);
}

@reflector
class KeyboardButtonTypeRequestPoll extends KeyboardButtonType {
  @override
  String get tdType => 'keyboardButtonTypeRequestPoll';

   late bool forceRegular;
   late bool forceQuiz;

  @override
  Map<String, dynamic> get params => {
    'force_regular': forceRegular,
    'force_quiz': forceQuiz,
  };

  KeyboardButtonTypeRequestPoll({
  required this.forceRegular,
  required this.forceQuiz,
  });

  KeyboardButtonTypeRequestPoll.fromJson(Map<String, dynamic> json) {
    forceRegular = tryConvertToTdObject(json['force_regular']);
    forceQuiz = tryConvertToTdObject(json['force_quiz']);
  }
}

@reflector
class KeyboardButton extends TdObject {
  @override
  String get tdType => 'keyboardButton';

   late String text;
   late KeyboardButtonType type;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'type': type,
  };

  KeyboardButton({
  required this.text,
  required this.type,
  });

  KeyboardButton.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    type = tryConvertToTdObject(json['type']);
  }
}

abstract class InlineKeyboardButtonType extends TdObject {}

@reflector
class InlineKeyboardButtonTypeUrl extends InlineKeyboardButtonType {
  @override
  String get tdType => 'inlineKeyboardButtonTypeUrl';

   late String url;

  @override
  Map<String, dynamic> get params => {
    'url': url,
  };

  InlineKeyboardButtonTypeUrl({
  required this.url,
  });

  InlineKeyboardButtonTypeUrl.fromJson(Map<String, dynamic> json) {
    url = tryConvertToTdObject(json['url']);
  }
}

@reflector
class InlineKeyboardButtonTypeLoginUrl extends InlineKeyboardButtonType {
  @override
  String get tdType => 'inlineKeyboardButtonTypeLoginUrl';

   late String url;
   late int id;
   late String forwardText;

  @override
  Map<String, dynamic> get params => {
    'url': url,
    'id': id,
    'forward_text': forwardText,
  };

  InlineKeyboardButtonTypeLoginUrl({
  required this.url,
  required this.id,
  required this.forwardText,
  });

  InlineKeyboardButtonTypeLoginUrl.fromJson(Map<String, dynamic> json) {
    url = tryConvertToTdObject(json['url']);
    id = tryConvertToTdObject(json['id']);
    forwardText = tryConvertToTdObject(json['forward_text']);
  }
}

@reflector
class InlineKeyboardButtonTypeCallback extends InlineKeyboardButtonType {
  @override
  String get tdType => 'inlineKeyboardButtonTypeCallback';

   late String data;

  @override
  Map<String, dynamic> get params => {
    'data': data,
  };

  InlineKeyboardButtonTypeCallback({
  required this.data,
  });

  InlineKeyboardButtonTypeCallback.fromJson(Map<String, dynamic> json) {
    data = tryConvertToTdObject(json['data']);
  }
}

@reflector
class InlineKeyboardButtonTypeCallbackWithPassword extends InlineKeyboardButtonType {
  @override
  String get tdType => 'inlineKeyboardButtonTypeCallbackWithPassword';

   late String data;

  @override
  Map<String, dynamic> get params => {
    'data': data,
  };

  InlineKeyboardButtonTypeCallbackWithPassword({
  required this.data,
  });

  InlineKeyboardButtonTypeCallbackWithPassword.fromJson(Map<String, dynamic> json) {
    data = tryConvertToTdObject(json['data']);
  }
}

@reflector
class InlineKeyboardButtonTypeCallbackGame extends InlineKeyboardButtonType {
  @override
  String get tdType => 'inlineKeyboardButtonTypeCallbackGame';

  @override
  Map<String, dynamic> get params => {};

  InlineKeyboardButtonTypeCallbackGame();

  InlineKeyboardButtonTypeCallbackGame.fromJson(Map<String, dynamic> json);
}

@reflector
class InlineKeyboardButtonTypeSwitchInline extends InlineKeyboardButtonType {
  @override
  String get tdType => 'inlineKeyboardButtonTypeSwitchInline';

   late String query;
   late bool inCurrentChat;

  @override
  Map<String, dynamic> get params => {
    'query': query,
    'in_current_chat': inCurrentChat,
  };

  InlineKeyboardButtonTypeSwitchInline({
  required this.query,
  required this.inCurrentChat,
  });

  InlineKeyboardButtonTypeSwitchInline.fromJson(Map<String, dynamic> json) {
    query = tryConvertToTdObject(json['query']);
    inCurrentChat = tryConvertToTdObject(json['in_current_chat']);
  }
}

@reflector
class InlineKeyboardButtonTypeBuy extends InlineKeyboardButtonType {
  @override
  String get tdType => 'inlineKeyboardButtonTypeBuy';

  @override
  Map<String, dynamic> get params => {};

  InlineKeyboardButtonTypeBuy();

  InlineKeyboardButtonTypeBuy.fromJson(Map<String, dynamic> json);
}

@reflector
class InlineKeyboardButton extends TdObject {
  @override
  String get tdType => 'inlineKeyboardButton';

   late String text;
   late InlineKeyboardButtonType type;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'type': type,
  };

  InlineKeyboardButton({
  required this.text,
  required this.type,
  });

  InlineKeyboardButton.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    type = tryConvertToTdObject(json['type']);
  }
}

abstract class ReplyMarkup extends TdObject {}

@reflector
class ReplyMarkupRemoveKeyboard extends ReplyMarkup {
  @override
  String get tdType => 'replyMarkupRemoveKeyboard';

   late bool isPersonal;

  @override
  Map<String, dynamic> get params => {
    'is_personal': isPersonal,
  };

  ReplyMarkupRemoveKeyboard({
  required this.isPersonal,
  });

  ReplyMarkupRemoveKeyboard.fromJson(Map<String, dynamic> json) {
    isPersonal = tryConvertToTdObject(json['is_personal']);
  }
}

@reflector
class ReplyMarkupForceReply extends ReplyMarkup {
  @override
  String get tdType => 'replyMarkupForceReply';

   late bool isPersonal;
   late String inputFieldPlaceholder;

  @override
  Map<String, dynamic> get params => {
    'is_personal': isPersonal,
    'input_field_placeholder': inputFieldPlaceholder,
  };

  ReplyMarkupForceReply({
  required this.isPersonal,
  required this.inputFieldPlaceholder,
  });

  ReplyMarkupForceReply.fromJson(Map<String, dynamic> json) {
    isPersonal = tryConvertToTdObject(json['is_personal']);
    inputFieldPlaceholder = tryConvertToTdObject(json['input_field_placeholder']);
  }
}

@reflector
class ReplyMarkupShowKeyboard extends ReplyMarkup {
  @override
  String get tdType => 'replyMarkupShowKeyboard';

   late List<List<KeyboardButton>> rows;
   late bool resizeKeyboard;
   late bool oneTime;
   late bool isPersonal;
   late String inputFieldPlaceholder;

  @override
  Map<String, dynamic> get params => {
    'rows': rows,
    'resize_keyboard': resizeKeyboard,
    'one_time': oneTime,
    'is_personal': isPersonal,
    'input_field_placeholder': inputFieldPlaceholder,
  };

  ReplyMarkupShowKeyboard({
  required this.rows,
  required this.resizeKeyboard,
  required this.oneTime,
  required this.isPersonal,
  required this.inputFieldPlaceholder,
  });

  ReplyMarkupShowKeyboard.fromJson(Map<String, dynamic> json) {
    rows = tryConvertToTdObject(json['rows']);
    resizeKeyboard = tryConvertToTdObject(json['resize_keyboard']);
    oneTime = tryConvertToTdObject(json['one_time']);
    isPersonal = tryConvertToTdObject(json['is_personal']);
    inputFieldPlaceholder = tryConvertToTdObject(json['input_field_placeholder']);
  }
}

@reflector
class ReplyMarkupInlineKeyboard extends ReplyMarkup {
  @override
  String get tdType => 'replyMarkupInlineKeyboard';

   late List<List<InlineKeyboardButton>> rows;

  @override
  Map<String, dynamic> get params => {
    'rows': rows,
  };

  ReplyMarkupInlineKeyboard({
  required this.rows,
  });

  ReplyMarkupInlineKeyboard.fromJson(Map<String, dynamic> json) {
    rows = tryConvertToTdObject(json['rows']);
  }
}

abstract class LoginUrlInfo extends TdObject {}

@reflector
class LoginUrlInfoOpen extends LoginUrlInfo {
  @override
  String get tdType => 'loginUrlInfoOpen';

   late String url;
   late bool skipConfirm;

  @override
  Map<String, dynamic> get params => {
    'url': url,
    'skip_confirm': skipConfirm,
  };

  LoginUrlInfoOpen({
  required this.url,
  required this.skipConfirm,
  });

  LoginUrlInfoOpen.fromJson(Map<String, dynamic> json) {
    url = tryConvertToTdObject(json['url']);
    skipConfirm = tryConvertToTdObject(json['skip_confirm']);
  }
}

@reflector
class LoginUrlInfoRequestConfirmation extends LoginUrlInfo {
  @override
  String get tdType => 'loginUrlInfoRequestConfirmation';

   late String url;
   late String domain;
   late int botUserId;
   late bool requestWriteAccess;

  @override
  Map<String, dynamic> get params => {
    'url': url,
    'domain': domain,
    'bot_user_id': botUserId,
    'request_write_access': requestWriteAccess,
  };

  LoginUrlInfoRequestConfirmation({
  required this.url,
  required this.domain,
  required this.botUserId,
  required this.requestWriteAccess,
  });

  LoginUrlInfoRequestConfirmation.fromJson(Map<String, dynamic> json) {
    url = tryConvertToTdObject(json['url']);
    domain = tryConvertToTdObject(json['domain']);
    botUserId = tryConvertToTdObject(json['bot_user_id']);
    requestWriteAccess = tryConvertToTdObject(json['request_write_access']);
  }
}

@reflector
class MessageThreadInfo extends TdObject {
  @override
  String get tdType => 'messageThreadInfo';

   late int chatId;
   late int messageThreadId;
   late MessageReplyInfo replyInfo;
   late int unreadMessageCount;
   late List<Message> messages;
   late DraftMessage draftMessage;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'message_thread_id': messageThreadId,
    'reply_info': replyInfo,
    'unread_message_count': unreadMessageCount,
    'messages': messages,
    'draft_message': draftMessage,
  };

  MessageThreadInfo({
  required this.chatId,
  required this.messageThreadId,
  required this.replyInfo,
  required this.unreadMessageCount,
  required this.messages,
  required this.draftMessage,
  });

  MessageThreadInfo.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    messageThreadId = tryConvertToTdObject(json['message_thread_id']);
    replyInfo = tryConvertToTdObject(json['reply_info']);
    unreadMessageCount = tryConvertToTdObject(json['unread_message_count']);
    messages = tryConvertToTdObject(json['messages']);
    draftMessage = tryConvertToTdObject(json['draft_message']);
  }
}

abstract class RichText extends TdObject {}

@reflector
class RichTextPlain extends RichText {
  @override
  String get tdType => 'richTextPlain';

   late String text;

  @override
  Map<String, dynamic> get params => {
    'text': text,
  };

  RichTextPlain({
  required this.text,
  });

  RichTextPlain.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
  }
}

@reflector
class RichTextBold extends RichText {
  @override
  String get tdType => 'richTextBold';

   late RichText text;

  @override
  Map<String, dynamic> get params => {
    'text': text,
  };

  RichTextBold({
  required this.text,
  });

  RichTextBold.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
  }
}

@reflector
class RichTextItalic extends RichText {
  @override
  String get tdType => 'richTextItalic';

   late RichText text;

  @override
  Map<String, dynamic> get params => {
    'text': text,
  };

  RichTextItalic({
  required this.text,
  });

  RichTextItalic.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
  }
}

@reflector
class RichTextUnderline extends RichText {
  @override
  String get tdType => 'richTextUnderline';

   late RichText text;

  @override
  Map<String, dynamic> get params => {
    'text': text,
  };

  RichTextUnderline({
  required this.text,
  });

  RichTextUnderline.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
  }
}

@reflector
class RichTextStrikethrough extends RichText {
  @override
  String get tdType => 'richTextStrikethrough';

   late RichText text;

  @override
  Map<String, dynamic> get params => {
    'text': text,
  };

  RichTextStrikethrough({
  required this.text,
  });

  RichTextStrikethrough.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
  }
}

@reflector
class RichTextFixed extends RichText {
  @override
  String get tdType => 'richTextFixed';

   late RichText text;

  @override
  Map<String, dynamic> get params => {
    'text': text,
  };

  RichTextFixed({
  required this.text,
  });

  RichTextFixed.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
  }
}

@reflector
class RichTextUrl extends RichText {
  @override
  String get tdType => 'richTextUrl';

   late RichText text;
   late String url;
   late bool isCached;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'url': url,
    'is_cached': isCached,
  };

  RichTextUrl({
  required this.text,
  required this.url,
  required this.isCached,
  });

  RichTextUrl.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    url = tryConvertToTdObject(json['url']);
    isCached = tryConvertToTdObject(json['is_cached']);
  }
}

@reflector
class RichTextEmailAddress extends RichText {
  @override
  String get tdType => 'richTextEmailAddress';

   late RichText text;
   late String emailAddress;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'email_address': emailAddress,
  };

  RichTextEmailAddress({
  required this.text,
  required this.emailAddress,
  });

  RichTextEmailAddress.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    emailAddress = tryConvertToTdObject(json['email_address']);
  }
}

@reflector
class RichTextSubscript extends RichText {
  @override
  String get tdType => 'richTextSubscript';

   late RichText text;

  @override
  Map<String, dynamic> get params => {
    'text': text,
  };

  RichTextSubscript({
  required this.text,
  });

  RichTextSubscript.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
  }
}

@reflector
class RichTextSuperscript extends RichText {
  @override
  String get tdType => 'richTextSuperscript';

   late RichText text;

  @override
  Map<String, dynamic> get params => {
    'text': text,
  };

  RichTextSuperscript({
  required this.text,
  });

  RichTextSuperscript.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
  }
}

@reflector
class RichTextMarked extends RichText {
  @override
  String get tdType => 'richTextMarked';

   late RichText text;

  @override
  Map<String, dynamic> get params => {
    'text': text,
  };

  RichTextMarked({
  required this.text,
  });

  RichTextMarked.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
  }
}

@reflector
class RichTextPhoneNumber extends RichText {
  @override
  String get tdType => 'richTextPhoneNumber';

   late RichText text;
   late String phoneNumber;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'phone_number': phoneNumber,
  };

  RichTextPhoneNumber({
  required this.text,
  required this.phoneNumber,
  });

  RichTextPhoneNumber.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    phoneNumber = tryConvertToTdObject(json['phone_number']);
  }
}

@reflector
class RichTextIcon extends RichText {
  @override
  String get tdType => 'richTextIcon';

   late Document document;
   late int width;
   late int height;

  @override
  Map<String, dynamic> get params => {
    'document': document,
    'width': width,
    'height': height,
  };

  RichTextIcon({
  required this.document,
  required this.width,
  required this.height,
  });

  RichTextIcon.fromJson(Map<String, dynamic> json) {
    document = tryConvertToTdObject(json['document']);
    width = tryConvertToTdObject(json['width']);
    height = tryConvertToTdObject(json['height']);
  }
}

@reflector
class RichTextReference extends RichText {
  @override
  String get tdType => 'richTextReference';

   late RichText text;
   late String anchorName;
   late String url;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'anchor_name': anchorName,
    'url': url,
  };

  RichTextReference({
  required this.text,
  required this.anchorName,
  required this.url,
  });

  RichTextReference.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    anchorName = tryConvertToTdObject(json['anchor_name']);
    url = tryConvertToTdObject(json['url']);
  }
}

@reflector
class RichTextAnchor extends RichText {
  @override
  String get tdType => 'richTextAnchor';

   late String name;

  @override
  Map<String, dynamic> get params => {
    'name': name,
  };

  RichTextAnchor({
  required this.name,
  });

  RichTextAnchor.fromJson(Map<String, dynamic> json) {
    name = tryConvertToTdObject(json['name']);
  }
}

@reflector
class RichTextAnchorLink extends RichText {
  @override
  String get tdType => 'richTextAnchorLink';

   late RichText text;
   late String anchorName;
   late String url;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'anchor_name': anchorName,
    'url': url,
  };

  RichTextAnchorLink({
  required this.text,
  required this.anchorName,
  required this.url,
  });

  RichTextAnchorLink.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    anchorName = tryConvertToTdObject(json['anchor_name']);
    url = tryConvertToTdObject(json['url']);
  }
}

@reflector
class RichTexts extends RichText {
  @override
  String get tdType => 'richTexts';

   late List<RichText> texts;

  @override
  Map<String, dynamic> get params => {
    'texts': texts,
  };

  RichTexts({
  required this.texts,
  });

  RichTexts.fromJson(Map<String, dynamic> json) {
    texts = tryConvertToTdObject(json['texts']);
  }
}

@reflector
class PageBlockCaption extends TdObject {
  @override
  String get tdType => 'pageBlockCaption';

   late RichText text;
   late RichText credit;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'credit': credit,
  };

  PageBlockCaption({
  required this.text,
  required this.credit,
  });

  PageBlockCaption.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    credit = tryConvertToTdObject(json['credit']);
  }
}

@reflector
class PageBlockListItem extends TdObject {
  @override
  String get tdType => 'pageBlockListItem';

   late String label;
   late List<PageBlock> pageBlocks;

  @override
  Map<String, dynamic> get params => {
    'label': label,
    'page_blocks': pageBlocks,
  };

  PageBlockListItem({
  required this.label,
  required this.pageBlocks,
  });

  PageBlockListItem.fromJson(Map<String, dynamic> json) {
    label = tryConvertToTdObject(json['label']);
    pageBlocks = tryConvertToTdObject(json['page_blocks']);
  }
}

abstract class PageBlockHorizontalAlignment extends TdObject {}

@reflector
class PageBlockHorizontalAlignmentLeft extends PageBlockHorizontalAlignment {
  @override
  String get tdType => 'pageBlockHorizontalAlignmentLeft';

  @override
  Map<String, dynamic> get params => {};

  PageBlockHorizontalAlignmentLeft();

  PageBlockHorizontalAlignmentLeft.fromJson(Map<String, dynamic> json);
}

@reflector
class PageBlockHorizontalAlignmentCenter extends PageBlockHorizontalAlignment {
  @override
  String get tdType => 'pageBlockHorizontalAlignmentCenter';

  @override
  Map<String, dynamic> get params => {};

  PageBlockHorizontalAlignmentCenter();

  PageBlockHorizontalAlignmentCenter.fromJson(Map<String, dynamic> json);
}

@reflector
class PageBlockHorizontalAlignmentRight extends PageBlockHorizontalAlignment {
  @override
  String get tdType => 'pageBlockHorizontalAlignmentRight';

  @override
  Map<String, dynamic> get params => {};

  PageBlockHorizontalAlignmentRight();

  PageBlockHorizontalAlignmentRight.fromJson(Map<String, dynamic> json);
}

abstract class PageBlockVerticalAlignment extends TdObject {}

@reflector
class PageBlockVerticalAlignmentTop extends PageBlockVerticalAlignment {
  @override
  String get tdType => 'pageBlockVerticalAlignmentTop';

  @override
  Map<String, dynamic> get params => {};

  PageBlockVerticalAlignmentTop();

  PageBlockVerticalAlignmentTop.fromJson(Map<String, dynamic> json);
}

@reflector
class PageBlockVerticalAlignmentMiddle extends PageBlockVerticalAlignment {
  @override
  String get tdType => 'pageBlockVerticalAlignmentMiddle';

  @override
  Map<String, dynamic> get params => {};

  PageBlockVerticalAlignmentMiddle();

  PageBlockVerticalAlignmentMiddle.fromJson(Map<String, dynamic> json);
}

@reflector
class PageBlockVerticalAlignmentBottom extends PageBlockVerticalAlignment {
  @override
  String get tdType => 'pageBlockVerticalAlignmentBottom';

  @override
  Map<String, dynamic> get params => {};

  PageBlockVerticalAlignmentBottom();

  PageBlockVerticalAlignmentBottom.fromJson(Map<String, dynamic> json);
}

@reflector
class PageBlockTableCell extends TdObject {
  @override
  String get tdType => 'pageBlockTableCell';

   late RichText text;
   late bool isHeader;
   late int colspan;
   late int rowspan;
   late PageBlockHorizontalAlignment align;
   late PageBlockVerticalAlignment valign;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'is_header': isHeader,
    'colspan': colspan,
    'rowspan': rowspan,
    'align': align,
    'valign': valign,
  };

  PageBlockTableCell({
  required this.text,
  required this.isHeader,
  required this.colspan,
  required this.rowspan,
  required this.align,
  required this.valign,
  });

  PageBlockTableCell.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    isHeader = tryConvertToTdObject(json['is_header']);
    colspan = tryConvertToTdObject(json['colspan']);
    rowspan = tryConvertToTdObject(json['rowspan']);
    align = tryConvertToTdObject(json['align']);
    valign = tryConvertToTdObject(json['valign']);
  }
}

@reflector
class PageBlockRelatedArticle extends TdObject {
  @override
  String get tdType => 'pageBlockRelatedArticle';

   late String url;
   late String title;
   late String description;
   late Photo photo;
   late String author;
   late int publishDate;

  @override
  Map<String, dynamic> get params => {
    'url': url,
    'title': title,
    'description': description,
    'photo': photo,
    'author': author,
    'publish_date': publishDate,
  };

  PageBlockRelatedArticle({
  required this.url,
  required this.title,
  required this.description,
  required this.photo,
  required this.author,
  required this.publishDate,
  });

  PageBlockRelatedArticle.fromJson(Map<String, dynamic> json) {
    url = tryConvertToTdObject(json['url']);
    title = tryConvertToTdObject(json['title']);
    description = tryConvertToTdObject(json['description']);
    photo = tryConvertToTdObject(json['photo']);
    author = tryConvertToTdObject(json['author']);
    publishDate = tryConvertToTdObject(json['publish_date']);
  }
}

abstract class PageBlock extends TdObject {}

@reflector
class PageBlockTitle extends PageBlock {
  @override
  String get tdType => 'pageBlockTitle';

   late RichText title;

  @override
  Map<String, dynamic> get params => {
    'title': title,
  };

  PageBlockTitle({
  required this.title,
  });

  PageBlockTitle.fromJson(Map<String, dynamic> json) {
    title = tryConvertToTdObject(json['title']);
  }
}

@reflector
class PageBlockSubtitle extends PageBlock {
  @override
  String get tdType => 'pageBlockSubtitle';

   late RichText subtitle;

  @override
  Map<String, dynamic> get params => {
    'subtitle': subtitle,
  };

  PageBlockSubtitle({
  required this.subtitle,
  });

  PageBlockSubtitle.fromJson(Map<String, dynamic> json) {
    subtitle = tryConvertToTdObject(json['subtitle']);
  }
}

@reflector
class PageBlockAuthorDate extends PageBlock {
  @override
  String get tdType => 'pageBlockAuthorDate';

   late RichText author;
   late int publishDate;

  @override
  Map<String, dynamic> get params => {
    'author': author,
    'publish_date': publishDate,
  };

  PageBlockAuthorDate({
  required this.author,
  required this.publishDate,
  });

  PageBlockAuthorDate.fromJson(Map<String, dynamic> json) {
    author = tryConvertToTdObject(json['author']);
    publishDate = tryConvertToTdObject(json['publish_date']);
  }
}

@reflector
class PageBlockHeader extends PageBlock {
  @override
  String get tdType => 'pageBlockHeader';

   late RichText header;

  @override
  Map<String, dynamic> get params => {
    'header': header,
  };

  PageBlockHeader({
  required this.header,
  });

  PageBlockHeader.fromJson(Map<String, dynamic> json) {
    header = tryConvertToTdObject(json['header']);
  }
}

@reflector
class PageBlockSubheader extends PageBlock {
  @override
  String get tdType => 'pageBlockSubheader';

   late RichText subheader;

  @override
  Map<String, dynamic> get params => {
    'subheader': subheader,
  };

  PageBlockSubheader({
  required this.subheader,
  });

  PageBlockSubheader.fromJson(Map<String, dynamic> json) {
    subheader = tryConvertToTdObject(json['subheader']);
  }
}

@reflector
class PageBlockKicker extends PageBlock {
  @override
  String get tdType => 'pageBlockKicker';

   late RichText kicker;

  @override
  Map<String, dynamic> get params => {
    'kicker': kicker,
  };

  PageBlockKicker({
  required this.kicker,
  });

  PageBlockKicker.fromJson(Map<String, dynamic> json) {
    kicker = tryConvertToTdObject(json['kicker']);
  }
}

@reflector
class PageBlockParagraph extends PageBlock {
  @override
  String get tdType => 'pageBlockParagraph';

   late RichText text;

  @override
  Map<String, dynamic> get params => {
    'text': text,
  };

  PageBlockParagraph({
  required this.text,
  });

  PageBlockParagraph.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
  }
}

@reflector
class PageBlockPreformatted extends PageBlock {
  @override
  String get tdType => 'pageBlockPreformatted';

   late RichText text;
   late String language;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'language': language,
  };

  PageBlockPreformatted({
  required this.text,
  required this.language,
  });

  PageBlockPreformatted.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    language = tryConvertToTdObject(json['language']);
  }
}

@reflector
class PageBlockFooter extends PageBlock {
  @override
  String get tdType => 'pageBlockFooter';

   late RichText footer;

  @override
  Map<String, dynamic> get params => {
    'footer': footer,
  };

  PageBlockFooter({
  required this.footer,
  });

  PageBlockFooter.fromJson(Map<String, dynamic> json) {
    footer = tryConvertToTdObject(json['footer']);
  }
}

@reflector
class PageBlockDivider extends PageBlock {
  @override
  String get tdType => 'pageBlockDivider';

  @override
  Map<String, dynamic> get params => {};

  PageBlockDivider();

  PageBlockDivider.fromJson(Map<String, dynamic> json);
}

@reflector
class PageBlockAnchor extends PageBlock {
  @override
  String get tdType => 'pageBlockAnchor';

   late String name;

  @override
  Map<String, dynamic> get params => {
    'name': name,
  };

  PageBlockAnchor({
  required this.name,
  });

  PageBlockAnchor.fromJson(Map<String, dynamic> json) {
    name = tryConvertToTdObject(json['name']);
  }
}

@reflector
class PageBlockList extends PageBlock {
  @override
  String get tdType => 'pageBlockList';

   late List<PageBlockListItem> items;

  @override
  Map<String, dynamic> get params => {
    'items': items,
  };

  PageBlockList({
  required this.items,
  });

  PageBlockList.fromJson(Map<String, dynamic> json) {
    items = tryConvertToTdObject(json['items']);
  }
}

@reflector
class PageBlockBlockQuote extends PageBlock {
  @override
  String get tdType => 'pageBlockBlockQuote';

   late RichText text;
   late RichText credit;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'credit': credit,
  };

  PageBlockBlockQuote({
  required this.text,
  required this.credit,
  });

  PageBlockBlockQuote.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    credit = tryConvertToTdObject(json['credit']);
  }
}

@reflector
class PageBlockPullQuote extends PageBlock {
  @override
  String get tdType => 'pageBlockPullQuote';

   late RichText text;
   late RichText credit;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'credit': credit,
  };

  PageBlockPullQuote({
  required this.text,
  required this.credit,
  });

  PageBlockPullQuote.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    credit = tryConvertToTdObject(json['credit']);
  }
}

@reflector
class PageBlockAnimation extends PageBlock {
  @override
  String get tdType => 'pageBlockAnimation';

   late Animation animation;
   late PageBlockCaption caption;
   late bool needAutoplay;

  @override
  Map<String, dynamic> get params => {
    'animation': animation,
    'caption': caption,
    'need_autoplay': needAutoplay,
  };

  PageBlockAnimation({
  required this.animation,
  required this.caption,
  required this.needAutoplay,
  });

  PageBlockAnimation.fromJson(Map<String, dynamic> json) {
    animation = tryConvertToTdObject(json['animation']);
    caption = tryConvertToTdObject(json['caption']);
    needAutoplay = tryConvertToTdObject(json['need_autoplay']);
  }
}

@reflector
class PageBlockAudio extends PageBlock {
  @override
  String get tdType => 'pageBlockAudio';

   late Audio audio;
   late PageBlockCaption caption;

  @override
  Map<String, dynamic> get params => {
    'audio': audio,
    'caption': caption,
  };

  PageBlockAudio({
  required this.audio,
  required this.caption,
  });

  PageBlockAudio.fromJson(Map<String, dynamic> json) {
    audio = tryConvertToTdObject(json['audio']);
    caption = tryConvertToTdObject(json['caption']);
  }
}

@reflector
class PageBlockPhoto extends PageBlock {
  @override
  String get tdType => 'pageBlockPhoto';

   late Photo photo;
   late PageBlockCaption caption;
   late String url;

  @override
  Map<String, dynamic> get params => {
    'photo': photo,
    'caption': caption,
    'url': url,
  };

  PageBlockPhoto({
  required this.photo,
  required this.caption,
  required this.url,
  });

  PageBlockPhoto.fromJson(Map<String, dynamic> json) {
    photo = tryConvertToTdObject(json['photo']);
    caption = tryConvertToTdObject(json['caption']);
    url = tryConvertToTdObject(json['url']);
  }
}

@reflector
class PageBlockVideo extends PageBlock {
  @override
  String get tdType => 'pageBlockVideo';

   late Video video;
   late PageBlockCaption caption;
   late bool needAutoplay;
   late bool isLooped;

  @override
  Map<String, dynamic> get params => {
    'video': video,
    'caption': caption,
    'need_autoplay': needAutoplay,
    'is_looped': isLooped,
  };

  PageBlockVideo({
  required this.video,
  required this.caption,
  required this.needAutoplay,
  required this.isLooped,
  });

  PageBlockVideo.fromJson(Map<String, dynamic> json) {
    video = tryConvertToTdObject(json['video']);
    caption = tryConvertToTdObject(json['caption']);
    needAutoplay = tryConvertToTdObject(json['need_autoplay']);
    isLooped = tryConvertToTdObject(json['is_looped']);
  }
}

@reflector
class PageBlockVoiceNote extends PageBlock {
  @override
  String get tdType => 'pageBlockVoiceNote';

   late VoiceNote voiceNote;
   late PageBlockCaption caption;

  @override
  Map<String, dynamic> get params => {
    'voice_note': voiceNote,
    'caption': caption,
  };

  PageBlockVoiceNote({
  required this.voiceNote,
  required this.caption,
  });

  PageBlockVoiceNote.fromJson(Map<String, dynamic> json) {
    voiceNote = tryConvertToTdObject(json['voice_note']);
    caption = tryConvertToTdObject(json['caption']);
  }
}

@reflector
class PageBlockCover extends PageBlock {
  @override
  String get tdType => 'pageBlockCover';

   late PageBlock cover;

  @override
  Map<String, dynamic> get params => {
    'cover': cover,
  };

  PageBlockCover({
  required this.cover,
  });

  PageBlockCover.fromJson(Map<String, dynamic> json) {
    cover = tryConvertToTdObject(json['cover']);
  }
}

@reflector
class PageBlockEmbedded extends PageBlock {
  @override
  String get tdType => 'pageBlockEmbedded';

   late String url;
   late String html;
   late Photo posterPhoto;
   late int width;
   late int height;
   late PageBlockCaption caption;
   late bool isFullWidth;
   late bool allowScrolling;

  @override
  Map<String, dynamic> get params => {
    'url': url,
    'html': html,
    'poster_photo': posterPhoto,
    'width': width,
    'height': height,
    'caption': caption,
    'is_full_width': isFullWidth,
    'allow_scrolling': allowScrolling,
  };

  PageBlockEmbedded({
  required this.url,
  required this.html,
  required this.posterPhoto,
  required this.width,
  required this.height,
  required this.caption,
  required this.isFullWidth,
  required this.allowScrolling,
  });

  PageBlockEmbedded.fromJson(Map<String, dynamic> json) {
    url = tryConvertToTdObject(json['url']);
    html = tryConvertToTdObject(json['html']);
    posterPhoto = tryConvertToTdObject(json['poster_photo']);
    width = tryConvertToTdObject(json['width']);
    height = tryConvertToTdObject(json['height']);
    caption = tryConvertToTdObject(json['caption']);
    isFullWidth = tryConvertToTdObject(json['is_full_width']);
    allowScrolling = tryConvertToTdObject(json['allow_scrolling']);
  }
}

@reflector
class PageBlockEmbeddedPost extends PageBlock {
  @override
  String get tdType => 'pageBlockEmbeddedPost';

   late String url;
   late String author;
   late Photo authorPhoto;
   late int date;
   late List<PageBlock> pageBlocks;
   late PageBlockCaption caption;

  @override
  Map<String, dynamic> get params => {
    'url': url,
    'author': author,
    'author_photo': authorPhoto,
    'date': date,
    'page_blocks': pageBlocks,
    'caption': caption,
  };

  PageBlockEmbeddedPost({
  required this.url,
  required this.author,
  required this.authorPhoto,
  required this.date,
  required this.pageBlocks,
  required this.caption,
  });

  PageBlockEmbeddedPost.fromJson(Map<String, dynamic> json) {
    url = tryConvertToTdObject(json['url']);
    author = tryConvertToTdObject(json['author']);
    authorPhoto = tryConvertToTdObject(json['author_photo']);
    date = tryConvertToTdObject(json['date']);
    pageBlocks = tryConvertToTdObject(json['page_blocks']);
    caption = tryConvertToTdObject(json['caption']);
  }
}

@reflector
class PageBlockCollage extends PageBlock {
  @override
  String get tdType => 'pageBlockCollage';

   late List<PageBlock> pageBlocks;
   late PageBlockCaption caption;

  @override
  Map<String, dynamic> get params => {
    'page_blocks': pageBlocks,
    'caption': caption,
  };

  PageBlockCollage({
  required this.pageBlocks,
  required this.caption,
  });

  PageBlockCollage.fromJson(Map<String, dynamic> json) {
    pageBlocks = tryConvertToTdObject(json['page_blocks']);
    caption = tryConvertToTdObject(json['caption']);
  }
}

@reflector
class PageBlockSlideshow extends PageBlock {
  @override
  String get tdType => 'pageBlockSlideshow';

   late List<PageBlock> pageBlocks;
   late PageBlockCaption caption;

  @override
  Map<String, dynamic> get params => {
    'page_blocks': pageBlocks,
    'caption': caption,
  };

  PageBlockSlideshow({
  required this.pageBlocks,
  required this.caption,
  });

  PageBlockSlideshow.fromJson(Map<String, dynamic> json) {
    pageBlocks = tryConvertToTdObject(json['page_blocks']);
    caption = tryConvertToTdObject(json['caption']);
  }
}

@reflector
class PageBlockChatLink extends PageBlock {
  @override
  String get tdType => 'pageBlockChatLink';

   late String title;
   late ChatPhotoInfo photo;
   late String username;

  @override
  Map<String, dynamic> get params => {
    'title': title,
    'photo': photo,
    'username': username,
  };

  PageBlockChatLink({
  required this.title,
  required this.photo,
  required this.username,
  });

  PageBlockChatLink.fromJson(Map<String, dynamic> json) {
    title = tryConvertToTdObject(json['title']);
    photo = tryConvertToTdObject(json['photo']);
    username = tryConvertToTdObject(json['username']);
  }
}

@reflector
class PageBlockTable extends PageBlock {
  @override
  String get tdType => 'pageBlockTable';

   late RichText caption;
   late List<List<PageBlockTableCell>> cells;
   late bool isBordered;
   late bool isStriped;

  @override
  Map<String, dynamic> get params => {
    'caption': caption,
    'cells': cells,
    'is_bordered': isBordered,
    'is_striped': isStriped,
  };

  PageBlockTable({
  required this.caption,
  required this.cells,
  required this.isBordered,
  required this.isStriped,
  });

  PageBlockTable.fromJson(Map<String, dynamic> json) {
    caption = tryConvertToTdObject(json['caption']);
    cells = tryConvertToTdObject(json['cells']);
    isBordered = tryConvertToTdObject(json['is_bordered']);
    isStriped = tryConvertToTdObject(json['is_striped']);
  }
}

@reflector
class PageBlockDetails extends PageBlock {
  @override
  String get tdType => 'pageBlockDetails';

   late RichText header;
   late List<PageBlock> pageBlocks;
   late bool isOpen;

  @override
  Map<String, dynamic> get params => {
    'header': header,
    'page_blocks': pageBlocks,
    'is_open': isOpen,
  };

  PageBlockDetails({
  required this.header,
  required this.pageBlocks,
  required this.isOpen,
  });

  PageBlockDetails.fromJson(Map<String, dynamic> json) {
    header = tryConvertToTdObject(json['header']);
    pageBlocks = tryConvertToTdObject(json['page_blocks']);
    isOpen = tryConvertToTdObject(json['is_open']);
  }
}

@reflector
class PageBlockRelatedArticles extends PageBlock {
  @override
  String get tdType => 'pageBlockRelatedArticles';

   late RichText header;
   late List<PageBlockRelatedArticle> articles;

  @override
  Map<String, dynamic> get params => {
    'header': header,
    'articles': articles,
  };

  PageBlockRelatedArticles({
  required this.header,
  required this.articles,
  });

  PageBlockRelatedArticles.fromJson(Map<String, dynamic> json) {
    header = tryConvertToTdObject(json['header']);
    articles = tryConvertToTdObject(json['articles']);
  }
}

@reflector
class PageBlockMap extends PageBlock {
  @override
  String get tdType => 'pageBlockMap';

   late Location location;
   late int zoom;
   late int width;
   late int height;
   late PageBlockCaption caption;

  @override
  Map<String, dynamic> get params => {
    'location': location,
    'zoom': zoom,
    'width': width,
    'height': height,
    'caption': caption,
  };

  PageBlockMap({
  required this.location,
  required this.zoom,
  required this.width,
  required this.height,
  required this.caption,
  });

  PageBlockMap.fromJson(Map<String, dynamic> json) {
    location = tryConvertToTdObject(json['location']);
    zoom = tryConvertToTdObject(json['zoom']);
    width = tryConvertToTdObject(json['width']);
    height = tryConvertToTdObject(json['height']);
    caption = tryConvertToTdObject(json['caption']);
  }
}

@reflector
class WebPageInstantView extends TdObject {
  @override
  String get tdType => 'webPageInstantView';

   late List<PageBlock> pageBlocks;
   late int viewCount;
   late int version;
   late bool isRtl;
   late bool isFull;
   late InternalLinkType feedbackLink;

  @override
  Map<String, dynamic> get params => {
    'page_blocks': pageBlocks,
    'view_count': viewCount,
    'version': version,
    'is_rtl': isRtl,
    'is_full': isFull,
    'feedback_link': feedbackLink,
  };

  WebPageInstantView({
  required this.pageBlocks,
  required this.viewCount,
  required this.version,
  required this.isRtl,
  required this.isFull,
  required this.feedbackLink,
  });

  WebPageInstantView.fromJson(Map<String, dynamic> json) {
    pageBlocks = tryConvertToTdObject(json['page_blocks']);
    viewCount = tryConvertToTdObject(json['view_count']);
    version = tryConvertToTdObject(json['version']);
    isRtl = tryConvertToTdObject(json['is_rtl']);
    isFull = tryConvertToTdObject(json['is_full']);
    feedbackLink = tryConvertToTdObject(json['feedback_link']);
  }
}

@reflector
class WebPage extends TdObject {
  @override
  String get tdType => 'webPage';

   late String url;
   late String displayUrl;
   late String type;
   late String siteName;
   late String title;
   late FormattedText description;
   late Photo photo;
   late String embedUrl;
   late String embedType;
   late int embedWidth;
   late int embedHeight;
   late int duration;
   late String author;
   late Animation animation;
   late Audio audio;
   late Document document;
   late Sticker sticker;
   late Video video;
   late VideoNote videoNote;
   late VoiceNote voiceNote;
   late int instantViewVersion;

  @override
  Map<String, dynamic> get params => {
    'url': url,
    'display_url': displayUrl,
    'type': type,
    'site_name': siteName,
    'title': title,
    'description': description,
    'photo': photo,
    'embed_url': embedUrl,
    'embed_type': embedType,
    'embed_width': embedWidth,
    'embed_height': embedHeight,
    'duration': duration,
    'author': author,
    'animation': animation,
    'audio': audio,
    'document': document,
    'sticker': sticker,
    'video': video,
    'video_note': videoNote,
    'voice_note': voiceNote,
    'instant_view_version': instantViewVersion,
  };

  WebPage({
  required this.url,
  required this.displayUrl,
  required this.type,
  required this.siteName,
  required this.title,
  required this.description,
  required this.photo,
  required this.embedUrl,
  required this.embedType,
  required this.embedWidth,
  required this.embedHeight,
  required this.duration,
  required this.author,
  required this.animation,
  required this.audio,
  required this.document,
  required this.sticker,
  required this.video,
  required this.videoNote,
  required this.voiceNote,
  required this.instantViewVersion,
  });

  WebPage.fromJson(Map<String, dynamic> json) {
    url = tryConvertToTdObject(json['url']);
    displayUrl = tryConvertToTdObject(json['display_url']);
    type = tryConvertToTdObject(json['type']);
    siteName = tryConvertToTdObject(json['site_name']);
    title = tryConvertToTdObject(json['title']);
    description = tryConvertToTdObject(json['description']);
    photo = tryConvertToTdObject(json['photo']);
    embedUrl = tryConvertToTdObject(json['embed_url']);
    embedType = tryConvertToTdObject(json['embed_type']);
    embedWidth = tryConvertToTdObject(json['embed_width']);
    embedHeight = tryConvertToTdObject(json['embed_height']);
    duration = tryConvertToTdObject(json['duration']);
    author = tryConvertToTdObject(json['author']);
    animation = tryConvertToTdObject(json['animation']);
    audio = tryConvertToTdObject(json['audio']);
    document = tryConvertToTdObject(json['document']);
    sticker = tryConvertToTdObject(json['sticker']);
    video = tryConvertToTdObject(json['video']);
    videoNote = tryConvertToTdObject(json['video_note']);
    voiceNote = tryConvertToTdObject(json['voice_note']);
    instantViewVersion = tryConvertToTdObject(json['instant_view_version']);
  }
}

@reflector
class CountryInfo extends TdObject {
  @override
  String get tdType => 'countryInfo';

   late String countryCode;
   late String name;
   late String englishName;
   late bool isHidden;
   late List<String> callingCodes;

  @override
  Map<String, dynamic> get params => {
    'country_code': countryCode,
    'name': name,
    'english_name': englishName,
    'is_hidden': isHidden,
    'calling_codes': callingCodes,
  };

  CountryInfo({
  required this.countryCode,
  required this.name,
  required this.englishName,
  required this.isHidden,
  required this.callingCodes,
  });

  CountryInfo.fromJson(Map<String, dynamic> json) {
    countryCode = tryConvertToTdObject(json['country_code']);
    name = tryConvertToTdObject(json['name']);
    englishName = tryConvertToTdObject(json['english_name']);
    isHidden = tryConvertToTdObject(json['is_hidden']);
    callingCodes = tryConvertToTdObject(json['calling_codes']);
  }
}

@reflector
class Countries extends TdObject {
  @override
  String get tdType => 'countries';

   late List<CountryInfo> countries;

  @override
  Map<String, dynamic> get params => {
    'countries': countries,
  };

  Countries({
  required this.countries,
  });

  Countries.fromJson(Map<String, dynamic> json) {
    countries = tryConvertToTdObject(json['countries']);
  }
}

@reflector
class PhoneNumberInfo extends TdObject {
  @override
  String get tdType => 'phoneNumberInfo';

   late CountryInfo country;
   late String countryCallingCode;
   late String formattedPhoneNumber;

  @override
  Map<String, dynamic> get params => {
    'country': country,
    'country_calling_code': countryCallingCode,
    'formatted_phone_number': formattedPhoneNumber,
  };

  PhoneNumberInfo({
  required this.country,
  required this.countryCallingCode,
  required this.formattedPhoneNumber,
  });

  PhoneNumberInfo.fromJson(Map<String, dynamic> json) {
    country = tryConvertToTdObject(json['country']);
    countryCallingCode = tryConvertToTdObject(json['country_calling_code']);
    formattedPhoneNumber = tryConvertToTdObject(json['formatted_phone_number']);
  }
}

@reflector
class BankCardActionOpenUrl extends TdObject {
  @override
  String get tdType => 'bankCardActionOpenUrl';

   late String text;
   late String url;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'url': url,
  };

  BankCardActionOpenUrl({
  required this.text,
  required this.url,
  });

  BankCardActionOpenUrl.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    url = tryConvertToTdObject(json['url']);
  }
}

@reflector
class BankCardInfo extends TdObject {
  @override
  String get tdType => 'bankCardInfo';

   late String title;
   late List<BankCardActionOpenUrl> actions;

  @override
  Map<String, dynamic> get params => {
    'title': title,
    'actions': actions,
  };

  BankCardInfo({
  required this.title,
  required this.actions,
  });

  BankCardInfo.fromJson(Map<String, dynamic> json) {
    title = tryConvertToTdObject(json['title']);
    actions = tryConvertToTdObject(json['actions']);
  }
}

@reflector
class Address extends TdObject {
  @override
  String get tdType => 'address';

   late String countryCode;
   late String state;
   late String city;
   late String streetLine1;
   late String streetLine2;
   late String postalCode;

  @override
  Map<String, dynamic> get params => {
    'country_code': countryCode,
    'state': state,
    'city': city,
    'street_line1': streetLine1,
    'street_line2': streetLine2,
    'postal_code': postalCode,
  };

  Address({
  required this.countryCode,
  required this.state,
  required this.city,
  required this.streetLine1,
  required this.streetLine2,
  required this.postalCode,
  });

  Address.fromJson(Map<String, dynamic> json) {
    countryCode = tryConvertToTdObject(json['country_code']);
    state = tryConvertToTdObject(json['state']);
    city = tryConvertToTdObject(json['city']);
    streetLine1 = tryConvertToTdObject(json['street_line1']);
    streetLine2 = tryConvertToTdObject(json['street_line2']);
    postalCode = tryConvertToTdObject(json['postal_code']);
  }
}

@reflector
class LabeledPricePart extends TdObject {
  @override
  String get tdType => 'labeledPricePart';

   late String label;
   late int amount;

  @override
  Map<String, dynamic> get params => {
    'label': label,
    'amount': amount,
  };

  LabeledPricePart({
  required this.label,
  required this.amount,
  });

  LabeledPricePart.fromJson(Map<String, dynamic> json) {
    label = tryConvertToTdObject(json['label']);
    amount = tryConvertToTdObject(json['amount']);
  }
}

@reflector
class Invoice extends TdObject {
  @override
  String get tdType => 'invoice';

   late String currency;
   late List<LabeledPricePart> priceParts;
   late int maxTipAmount;
   late List<int> suggestedTipAmounts;
   late bool isTest;
   late bool needName;
   late bool needPhoneNumber;
   late bool needEmailAddress;
   late bool needShippingAddress;
   late bool sendPhoneNumberToProvider;
   late bool sendEmailAddressToProvider;
   late bool isFlexible;

  @override
  Map<String, dynamic> get params => {
    'currency': currency,
    'price_parts': priceParts,
    'max_tip_amount': maxTipAmount,
    'suggested_tip_amounts': suggestedTipAmounts,
    'is_test': isTest,
    'need_name': needName,
    'need_phone_number': needPhoneNumber,
    'need_email_address': needEmailAddress,
    'need_shipping_address': needShippingAddress,
    'send_phone_number_to_provider': sendPhoneNumberToProvider,
    'send_email_address_to_provider': sendEmailAddressToProvider,
    'is_flexible': isFlexible,
  };

  Invoice({
  required this.currency,
  required this.priceParts,
  required this.maxTipAmount,
  required this.suggestedTipAmounts,
  required this.isTest,
  required this.needName,
  required this.needPhoneNumber,
  required this.needEmailAddress,
  required this.needShippingAddress,
  required this.sendPhoneNumberToProvider,
  required this.sendEmailAddressToProvider,
  required this.isFlexible,
  });

  Invoice.fromJson(Map<String, dynamic> json) {
    currency = tryConvertToTdObject(json['currency']);
    priceParts = tryConvertToTdObject(json['price_parts']);
    maxTipAmount = tryConvertToTdObject(json['max_tip_amount']);
    suggestedTipAmounts = tryConvertToTdObject(json['suggested_tip_amounts']);
    isTest = tryConvertToTdObject(json['is_test']);
    needName = tryConvertToTdObject(json['need_name']);
    needPhoneNumber = tryConvertToTdObject(json['need_phone_number']);
    needEmailAddress = tryConvertToTdObject(json['need_email_address']);
    needShippingAddress = tryConvertToTdObject(json['need_shipping_address']);
    sendPhoneNumberToProvider = tryConvertToTdObject(json['send_phone_number_to_provider']);
    sendEmailAddressToProvider = tryConvertToTdObject(json['send_email_address_to_provider']);
    isFlexible = tryConvertToTdObject(json['is_flexible']);
  }
}

@reflector
class OrderInfo extends TdObject {
  @override
  String get tdType => 'orderInfo';

   late String name;
   late String phoneNumber;
   late String emailAddress;
   late Address shippingAddress;

  @override
  Map<String, dynamic> get params => {
    'name': name,
    'phone_number': phoneNumber,
    'email_address': emailAddress,
    'shipping_address': shippingAddress,
  };

  OrderInfo({
  required this.name,
  required this.phoneNumber,
  required this.emailAddress,
  required this.shippingAddress,
  });

  OrderInfo.fromJson(Map<String, dynamic> json) {
    name = tryConvertToTdObject(json['name']);
    phoneNumber = tryConvertToTdObject(json['phone_number']);
    emailAddress = tryConvertToTdObject(json['email_address']);
    shippingAddress = tryConvertToTdObject(json['shipping_address']);
  }
}

@reflector
class ShippingOption extends TdObject {
  @override
  String get tdType => 'shippingOption';

   late String id;
   late String title;
   late List<LabeledPricePart> priceParts;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'title': title,
    'price_parts': priceParts,
  };

  ShippingOption({
  required this.id,
  required this.title,
  required this.priceParts,
  });

  ShippingOption.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    title = tryConvertToTdObject(json['title']);
    priceParts = tryConvertToTdObject(json['price_parts']);
  }
}

@reflector
class SavedCredentials extends TdObject {
  @override
  String get tdType => 'savedCredentials';

   late String id;
   late String title;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'title': title,
  };

  SavedCredentials({
  required this.id,
  required this.title,
  });

  SavedCredentials.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    title = tryConvertToTdObject(json['title']);
  }
}

abstract class InputCredentials extends TdObject {}

@reflector
class InputCredentialsSaved extends InputCredentials {
  @override
  String get tdType => 'inputCredentialsSaved';

   late String savedCredentialsId;

  @override
  Map<String, dynamic> get params => {
    'saved_credentials_id': savedCredentialsId,
  };

  InputCredentialsSaved({
  required this.savedCredentialsId,
  });

  InputCredentialsSaved.fromJson(Map<String, dynamic> json) {
    savedCredentialsId = tryConvertToTdObject(json['saved_credentials_id']);
  }
}

@reflector
class InputCredentialsNew extends InputCredentials {
  @override
  String get tdType => 'inputCredentialsNew';

   late String data;
   late bool allowSave;

  @override
  Map<String, dynamic> get params => {
    'data': data,
    'allow_save': allowSave,
  };

  InputCredentialsNew({
  required this.data,
  required this.allowSave,
  });

  InputCredentialsNew.fromJson(Map<String, dynamic> json) {
    data = tryConvertToTdObject(json['data']);
    allowSave = tryConvertToTdObject(json['allow_save']);
  }
}

@reflector
class InputCredentialsApplePay extends InputCredentials {
  @override
  String get tdType => 'inputCredentialsApplePay';

   late String data;

  @override
  Map<String, dynamic> get params => {
    'data': data,
  };

  InputCredentialsApplePay({
  required this.data,
  });

  InputCredentialsApplePay.fromJson(Map<String, dynamic> json) {
    data = tryConvertToTdObject(json['data']);
  }
}

@reflector
class InputCredentialsGooglePay extends InputCredentials {
  @override
  String get tdType => 'inputCredentialsGooglePay';

   late String data;

  @override
  Map<String, dynamic> get params => {
    'data': data,
  };

  InputCredentialsGooglePay({
  required this.data,
  });

  InputCredentialsGooglePay.fromJson(Map<String, dynamic> json) {
    data = tryConvertToTdObject(json['data']);
  }
}

@reflector
class PaymentsProviderStripe extends TdObject {
  @override
  String get tdType => 'paymentsProviderStripe';

   late String publishableKey;
   late bool needCountry;
   late bool needPostalCode;
   late bool needCardholderName;

  @override
  Map<String, dynamic> get params => {
    'publishable_key': publishableKey,
    'need_country': needCountry,
    'need_postal_code': needPostalCode,
    'need_cardholder_name': needCardholderName,
  };

  PaymentsProviderStripe({
  required this.publishableKey,
  required this.needCountry,
  required this.needPostalCode,
  required this.needCardholderName,
  });

  PaymentsProviderStripe.fromJson(Map<String, dynamic> json) {
    publishableKey = tryConvertToTdObject(json['publishable_key']);
    needCountry = tryConvertToTdObject(json['need_country']);
    needPostalCode = tryConvertToTdObject(json['need_postal_code']);
    needCardholderName = tryConvertToTdObject(json['need_cardholder_name']);
  }
}

@reflector
class PaymentFormTheme extends TdObject {
  @override
  String get tdType => 'paymentFormTheme';

   late int backgroundColor;
   late int textColor;
   late int hintColor;
   late int linkColor;
   late int buttonColor;
   late int buttonTextColor;

  @override
  Map<String, dynamic> get params => {
    'background_color': backgroundColor,
    'text_color': textColor,
    'hint_color': hintColor,
    'link_color': linkColor,
    'button_color': buttonColor,
    'button_text_color': buttonTextColor,
  };

  PaymentFormTheme({
  required this.backgroundColor,
  required this.textColor,
  required this.hintColor,
  required this.linkColor,
  required this.buttonColor,
  required this.buttonTextColor,
  });

  PaymentFormTheme.fromJson(Map<String, dynamic> json) {
    backgroundColor = tryConvertToTdObject(json['background_color']);
    textColor = tryConvertToTdObject(json['text_color']);
    hintColor = tryConvertToTdObject(json['hint_color']);
    linkColor = tryConvertToTdObject(json['link_color']);
    buttonColor = tryConvertToTdObject(json['button_color']);
    buttonTextColor = tryConvertToTdObject(json['button_text_color']);
  }
}

@reflector
class PaymentForm extends TdObject {
  @override
  String get tdType => 'paymentForm';

   late int id;
   late Invoice invoice;
   late String url;
   late int sellerBotUserId;
   late int paymentsProviderUserId;
   late PaymentsProviderStripe paymentsProvider;
   late OrderInfo savedOrderInfo;
   late SavedCredentials savedCredentials;
   late bool canSaveCredentials;
   late bool needPassword;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'invoice': invoice,
    'url': url,
    'seller_bot_user_id': sellerBotUserId,
    'payments_provider_user_id': paymentsProviderUserId,
    'payments_provider': paymentsProvider,
    'saved_order_info': savedOrderInfo,
    'saved_credentials': savedCredentials,
    'can_save_credentials': canSaveCredentials,
    'need_password': needPassword,
  };

  PaymentForm({
  required this.id,
  required this.invoice,
  required this.url,
  required this.sellerBotUserId,
  required this.paymentsProviderUserId,
  required this.paymentsProvider,
  required this.savedOrderInfo,
  required this.savedCredentials,
  required this.canSaveCredentials,
  required this.needPassword,
  });

  PaymentForm.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    invoice = tryConvertToTdObject(json['invoice']);
    url = tryConvertToTdObject(json['url']);
    sellerBotUserId = tryConvertToTdObject(json['seller_bot_user_id']);
    paymentsProviderUserId = tryConvertToTdObject(json['payments_provider_user_id']);
    paymentsProvider = tryConvertToTdObject(json['payments_provider']);
    savedOrderInfo = tryConvertToTdObject(json['saved_order_info']);
    savedCredentials = tryConvertToTdObject(json['saved_credentials']);
    canSaveCredentials = tryConvertToTdObject(json['can_save_credentials']);
    needPassword = tryConvertToTdObject(json['need_password']);
  }
}

@reflector
class ValidatedOrderInfo extends TdObject {
  @override
  String get tdType => 'validatedOrderInfo';

   late String orderInfoId;
   late List<ShippingOption> shippingOptions;

  @override
  Map<String, dynamic> get params => {
    'order_info_id': orderInfoId,
    'shipping_options': shippingOptions,
  };

  ValidatedOrderInfo({
  required this.orderInfoId,
  required this.shippingOptions,
  });

  ValidatedOrderInfo.fromJson(Map<String, dynamic> json) {
    orderInfoId = tryConvertToTdObject(json['order_info_id']);
    shippingOptions = tryConvertToTdObject(json['shipping_options']);
  }
}

@reflector
class PaymentResult extends TdObject {
  @override
  String get tdType => 'paymentResult';

   late bool success;
   late String verificationUrl;

  @override
  Map<String, dynamic> get params => {
    'success': success,
    'verification_url': verificationUrl,
  };

  PaymentResult({
  required this.success,
  required this.verificationUrl,
  });

  PaymentResult.fromJson(Map<String, dynamic> json) {
    success = tryConvertToTdObject(json['success']);
    verificationUrl = tryConvertToTdObject(json['verification_url']);
  }
}

@reflector
class PaymentReceipt extends TdObject {
  @override
  String get tdType => 'paymentReceipt';

   late String title;
   late String description;
   late Photo photo;
   late int date;
   late int sellerBotUserId;
   late int paymentsProviderUserId;
   late Invoice invoice;
   late OrderInfo orderInfo;
   late ShippingOption shippingOption;
   late String credentialsTitle;
   late int tipAmount;

  @override
  Map<String, dynamic> get params => {
    'title': title,
    'description': description,
    'photo': photo,
    'date': date,
    'seller_bot_user_id': sellerBotUserId,
    'payments_provider_user_id': paymentsProviderUserId,
    'invoice': invoice,
    'order_info': orderInfo,
    'shipping_option': shippingOption,
    'credentials_title': credentialsTitle,
    'tip_amount': tipAmount,
  };

  PaymentReceipt({
  required this.title,
  required this.description,
  required this.photo,
  required this.date,
  required this.sellerBotUserId,
  required this.paymentsProviderUserId,
  required this.invoice,
  required this.orderInfo,
  required this.shippingOption,
  required this.credentialsTitle,
  required this.tipAmount,
  });

  PaymentReceipt.fromJson(Map<String, dynamic> json) {
    title = tryConvertToTdObject(json['title']);
    description = tryConvertToTdObject(json['description']);
    photo = tryConvertToTdObject(json['photo']);
    date = tryConvertToTdObject(json['date']);
    sellerBotUserId = tryConvertToTdObject(json['seller_bot_user_id']);
    paymentsProviderUserId = tryConvertToTdObject(json['payments_provider_user_id']);
    invoice = tryConvertToTdObject(json['invoice']);
    orderInfo = tryConvertToTdObject(json['order_info']);
    shippingOption = tryConvertToTdObject(json['shipping_option']);
    credentialsTitle = tryConvertToTdObject(json['credentials_title']);
    tipAmount = tryConvertToTdObject(json['tip_amount']);
  }
}

@reflector
class DatedFile extends TdObject {
  @override
  String get tdType => 'datedFile';

   late File file;
   late int date;

  @override
  Map<String, dynamic> get params => {
    'file': file,
    'date': date,
  };

  DatedFile({
  required this.file,
  required this.date,
  });

  DatedFile.fromJson(Map<String, dynamic> json) {
    file = tryConvertToTdObject(json['file']);
    date = tryConvertToTdObject(json['date']);
  }
}

abstract class PassportElementType extends TdObject {}

@reflector
class PassportElementTypePersonalDetails extends PassportElementType {
  @override
  String get tdType => 'passportElementTypePersonalDetails';

  @override
  Map<String, dynamic> get params => {};

  PassportElementTypePersonalDetails();

  PassportElementTypePersonalDetails.fromJson(Map<String, dynamic> json);
}

@reflector
class PassportElementTypePassport extends PassportElementType {
  @override
  String get tdType => 'passportElementTypePassport';

  @override
  Map<String, dynamic> get params => {};

  PassportElementTypePassport();

  PassportElementTypePassport.fromJson(Map<String, dynamic> json);
}

@reflector
class PassportElementTypeDriverLicense extends PassportElementType {
  @override
  String get tdType => 'passportElementTypeDriverLicense';

  @override
  Map<String, dynamic> get params => {};

  PassportElementTypeDriverLicense();

  PassportElementTypeDriverLicense.fromJson(Map<String, dynamic> json);
}

@reflector
class PassportElementTypeIdentityCard extends PassportElementType {
  @override
  String get tdType => 'passportElementTypeIdentityCard';

  @override
  Map<String, dynamic> get params => {};

  PassportElementTypeIdentityCard();

  PassportElementTypeIdentityCard.fromJson(Map<String, dynamic> json);
}

@reflector
class PassportElementTypeInternalPassport extends PassportElementType {
  @override
  String get tdType => 'passportElementTypeInternalPassport';

  @override
  Map<String, dynamic> get params => {};

  PassportElementTypeInternalPassport();

  PassportElementTypeInternalPassport.fromJson(Map<String, dynamic> json);
}

@reflector
class PassportElementTypeAddress extends PassportElementType {
  @override
  String get tdType => 'passportElementTypeAddress';

  @override
  Map<String, dynamic> get params => {};

  PassportElementTypeAddress();

  PassportElementTypeAddress.fromJson(Map<String, dynamic> json);
}

@reflector
class PassportElementTypeUtilityBill extends PassportElementType {
  @override
  String get tdType => 'passportElementTypeUtilityBill';

  @override
  Map<String, dynamic> get params => {};

  PassportElementTypeUtilityBill();

  PassportElementTypeUtilityBill.fromJson(Map<String, dynamic> json);
}

@reflector
class PassportElementTypeBankStatement extends PassportElementType {
  @override
  String get tdType => 'passportElementTypeBankStatement';

  @override
  Map<String, dynamic> get params => {};

  PassportElementTypeBankStatement();

  PassportElementTypeBankStatement.fromJson(Map<String, dynamic> json);
}

@reflector
class PassportElementTypeRentalAgreement extends PassportElementType {
  @override
  String get tdType => 'passportElementTypeRentalAgreement';

  @override
  Map<String, dynamic> get params => {};

  PassportElementTypeRentalAgreement();

  PassportElementTypeRentalAgreement.fromJson(Map<String, dynamic> json);
}

@reflector
class PassportElementTypePassportRegistration extends PassportElementType {
  @override
  String get tdType => 'passportElementTypePassportRegistration';

  @override
  Map<String, dynamic> get params => {};

  PassportElementTypePassportRegistration();

  PassportElementTypePassportRegistration.fromJson(Map<String, dynamic> json);
}

@reflector
class PassportElementTypeTemporaryRegistration extends PassportElementType {
  @override
  String get tdType => 'passportElementTypeTemporaryRegistration';

  @override
  Map<String, dynamic> get params => {};

  PassportElementTypeTemporaryRegistration();

  PassportElementTypeTemporaryRegistration.fromJson(Map<String, dynamic> json);
}

@reflector
class PassportElementTypePhoneNumber extends PassportElementType {
  @override
  String get tdType => 'passportElementTypePhoneNumber';

  @override
  Map<String, dynamic> get params => {};

  PassportElementTypePhoneNumber();

  PassportElementTypePhoneNumber.fromJson(Map<String, dynamic> json);
}

@reflector
class PassportElementTypeEmailAddress extends PassportElementType {
  @override
  String get tdType => 'passportElementTypeEmailAddress';

  @override
  Map<String, dynamic> get params => {};

  PassportElementTypeEmailAddress();

  PassportElementTypeEmailAddress.fromJson(Map<String, dynamic> json);
}

@reflector
class Date extends TdObject {
  @override
  String get tdType => 'date';

   late int day;
   late int month;
   late int year;

  @override
  Map<String, dynamic> get params => {
    'day': day,
    'month': month,
    'year': year,
  };

  Date({
  required this.day,
  required this.month,
  required this.year,
  });

  Date.fromJson(Map<String, dynamic> json) {
    day = tryConvertToTdObject(json['day']);
    month = tryConvertToTdObject(json['month']);
    year = tryConvertToTdObject(json['year']);
  }
}

@reflector
class PersonalDetails extends TdObject {
  @override
  String get tdType => 'personalDetails';

   late String firstName;
   late String middleName;
   late String lastName;
   late String nativeFirstName;
   late String nativeMiddleName;
   late String nativeLastName;
   late Date birthdate;
   late String gender;
   late String countryCode;
   late String residenceCountryCode;

  @override
  Map<String, dynamic> get params => {
    'first_name': firstName,
    'middle_name': middleName,
    'last_name': lastName,
    'native_first_name': nativeFirstName,
    'native_middle_name': nativeMiddleName,
    'native_last_name': nativeLastName,
    'birthdate': birthdate,
    'gender': gender,
    'country_code': countryCode,
    'residence_country_code': residenceCountryCode,
  };

  PersonalDetails({
  required this.firstName,
  required this.middleName,
  required this.lastName,
  required this.nativeFirstName,
  required this.nativeMiddleName,
  required this.nativeLastName,
  required this.birthdate,
  required this.gender,
  required this.countryCode,
  required this.residenceCountryCode,
  });

  PersonalDetails.fromJson(Map<String, dynamic> json) {
    firstName = tryConvertToTdObject(json['first_name']);
    middleName = tryConvertToTdObject(json['middle_name']);
    lastName = tryConvertToTdObject(json['last_name']);
    nativeFirstName = tryConvertToTdObject(json['native_first_name']);
    nativeMiddleName = tryConvertToTdObject(json['native_middle_name']);
    nativeLastName = tryConvertToTdObject(json['native_last_name']);
    birthdate = tryConvertToTdObject(json['birthdate']);
    gender = tryConvertToTdObject(json['gender']);
    countryCode = tryConvertToTdObject(json['country_code']);
    residenceCountryCode = tryConvertToTdObject(json['residence_country_code']);
  }
}

@reflector
class IdentityDocument extends TdObject {
  @override
  String get tdType => 'identityDocument';

   late String number;
   late Date expiryDate;
   late DatedFile frontSide;
   late DatedFile reverseSide;
   late DatedFile selfie;
   late List<DatedFile> translation;

  @override
  Map<String, dynamic> get params => {
    'number': number,
    'expiry_date': expiryDate,
    'front_side': frontSide,
    'reverse_side': reverseSide,
    'selfie': selfie,
    'translation': translation,
  };

  IdentityDocument({
  required this.number,
  required this.expiryDate,
  required this.frontSide,
  required this.reverseSide,
  required this.selfie,
  required this.translation,
  });

  IdentityDocument.fromJson(Map<String, dynamic> json) {
    number = tryConvertToTdObject(json['number']);
    expiryDate = tryConvertToTdObject(json['expiry_date']);
    frontSide = tryConvertToTdObject(json['front_side']);
    reverseSide = tryConvertToTdObject(json['reverse_side']);
    selfie = tryConvertToTdObject(json['selfie']);
    translation = tryConvertToTdObject(json['translation']);
  }
}

@reflector
class InputIdentityDocument extends TdObject {
  @override
  String get tdType => 'inputIdentityDocument';

   late String number;
   late Date expiryDate;
   late InputFile frontSide;
   late InputFile reverseSide;
   late InputFile selfie;
   late List<InputFile> translation;

  @override
  Map<String, dynamic> get params => {
    'number': number,
    'expiry_date': expiryDate,
    'front_side': frontSide,
    'reverse_side': reverseSide,
    'selfie': selfie,
    'translation': translation,
  };

  InputIdentityDocument({
  required this.number,
  required this.expiryDate,
  required this.frontSide,
  required this.reverseSide,
  required this.selfie,
  required this.translation,
  });

  InputIdentityDocument.fromJson(Map<String, dynamic> json) {
    number = tryConvertToTdObject(json['number']);
    expiryDate = tryConvertToTdObject(json['expiry_date']);
    frontSide = tryConvertToTdObject(json['front_side']);
    reverseSide = tryConvertToTdObject(json['reverse_side']);
    selfie = tryConvertToTdObject(json['selfie']);
    translation = tryConvertToTdObject(json['translation']);
  }
}

@reflector
class PersonalDocument extends TdObject {
  @override
  String get tdType => 'personalDocument';

   late List<DatedFile> files;
   late List<DatedFile> translation;

  @override
  Map<String, dynamic> get params => {
    'files': files,
    'translation': translation,
  };

  PersonalDocument({
  required this.files,
  required this.translation,
  });

  PersonalDocument.fromJson(Map<String, dynamic> json) {
    files = tryConvertToTdObject(json['files']);
    translation = tryConvertToTdObject(json['translation']);
  }
}

@reflector
class InputPersonalDocument extends TdObject {
  @override
  String get tdType => 'inputPersonalDocument';

   late List<InputFile> files;
   late List<InputFile> translation;

  @override
  Map<String, dynamic> get params => {
    'files': files,
    'translation': translation,
  };

  InputPersonalDocument({
  required this.files,
  required this.translation,
  });

  InputPersonalDocument.fromJson(Map<String, dynamic> json) {
    files = tryConvertToTdObject(json['files']);
    translation = tryConvertToTdObject(json['translation']);
  }
}

abstract class PassportElement extends TdObject {}

@reflector
class PassportElementPersonalDetails extends PassportElement {
  @override
  String get tdType => 'passportElementPersonalDetails';

   late PersonalDetails personalDetails;

  @override
  Map<String, dynamic> get params => {
    'personal_details': personalDetails,
  };

  PassportElementPersonalDetails({
  required this.personalDetails,
  });

  PassportElementPersonalDetails.fromJson(Map<String, dynamic> json) {
    personalDetails = tryConvertToTdObject(json['personal_details']);
  }
}

@reflector
class PassportElementPassport extends PassportElement {
  @override
  String get tdType => 'passportElementPassport';

   late IdentityDocument passport;

  @override
  Map<String, dynamic> get params => {
    'passport': passport,
  };

  PassportElementPassport({
  required this.passport,
  });

  PassportElementPassport.fromJson(Map<String, dynamic> json) {
    passport = tryConvertToTdObject(json['passport']);
  }
}

@reflector
class PassportElementDriverLicense extends PassportElement {
  @override
  String get tdType => 'passportElementDriverLicense';

   late IdentityDocument driverLicense;

  @override
  Map<String, dynamic> get params => {
    'driver_license': driverLicense,
  };

  PassportElementDriverLicense({
  required this.driverLicense,
  });

  PassportElementDriverLicense.fromJson(Map<String, dynamic> json) {
    driverLicense = tryConvertToTdObject(json['driver_license']);
  }
}

@reflector
class PassportElementIdentityCard extends PassportElement {
  @override
  String get tdType => 'passportElementIdentityCard';

   late IdentityDocument identityCard;

  @override
  Map<String, dynamic> get params => {
    'identity_card': identityCard,
  };

  PassportElementIdentityCard({
  required this.identityCard,
  });

  PassportElementIdentityCard.fromJson(Map<String, dynamic> json) {
    identityCard = tryConvertToTdObject(json['identity_card']);
  }
}

@reflector
class PassportElementInternalPassport extends PassportElement {
  @override
  String get tdType => 'passportElementInternalPassport';

   late IdentityDocument internalPassport;

  @override
  Map<String, dynamic> get params => {
    'internal_passport': internalPassport,
  };

  PassportElementInternalPassport({
  required this.internalPassport,
  });

  PassportElementInternalPassport.fromJson(Map<String, dynamic> json) {
    internalPassport = tryConvertToTdObject(json['internal_passport']);
  }
}

@reflector
class PassportElementAddress extends PassportElement {
  @override
  String get tdType => 'passportElementAddress';

   late Address address;

  @override
  Map<String, dynamic> get params => {
    'address': address,
  };

  PassportElementAddress({
  required this.address,
  });

  PassportElementAddress.fromJson(Map<String, dynamic> json) {
    address = tryConvertToTdObject(json['address']);
  }
}

@reflector
class PassportElementUtilityBill extends PassportElement {
  @override
  String get tdType => 'passportElementUtilityBill';

   late PersonalDocument utilityBill;

  @override
  Map<String, dynamic> get params => {
    'utility_bill': utilityBill,
  };

  PassportElementUtilityBill({
  required this.utilityBill,
  });

  PassportElementUtilityBill.fromJson(Map<String, dynamic> json) {
    utilityBill = tryConvertToTdObject(json['utility_bill']);
  }
}

@reflector
class PassportElementBankStatement extends PassportElement {
  @override
  String get tdType => 'passportElementBankStatement';

   late PersonalDocument bankStatement;

  @override
  Map<String, dynamic> get params => {
    'bank_statement': bankStatement,
  };

  PassportElementBankStatement({
  required this.bankStatement,
  });

  PassportElementBankStatement.fromJson(Map<String, dynamic> json) {
    bankStatement = tryConvertToTdObject(json['bank_statement']);
  }
}

@reflector
class PassportElementRentalAgreement extends PassportElement {
  @override
  String get tdType => 'passportElementRentalAgreement';

   late PersonalDocument rentalAgreement;

  @override
  Map<String, dynamic> get params => {
    'rental_agreement': rentalAgreement,
  };

  PassportElementRentalAgreement({
  required this.rentalAgreement,
  });

  PassportElementRentalAgreement.fromJson(Map<String, dynamic> json) {
    rentalAgreement = tryConvertToTdObject(json['rental_agreement']);
  }
}

@reflector
class PassportElementPassportRegistration extends PassportElement {
  @override
  String get tdType => 'passportElementPassportRegistration';

   late PersonalDocument passportRegistration;

  @override
  Map<String, dynamic> get params => {
    'passport_registration': passportRegistration,
  };

  PassportElementPassportRegistration({
  required this.passportRegistration,
  });

  PassportElementPassportRegistration.fromJson(Map<String, dynamic> json) {
    passportRegistration = tryConvertToTdObject(json['passport_registration']);
  }
}

@reflector
class PassportElementTemporaryRegistration extends PassportElement {
  @override
  String get tdType => 'passportElementTemporaryRegistration';

   late PersonalDocument temporaryRegistration;

  @override
  Map<String, dynamic> get params => {
    'temporary_registration': temporaryRegistration,
  };

  PassportElementTemporaryRegistration({
  required this.temporaryRegistration,
  });

  PassportElementTemporaryRegistration.fromJson(Map<String, dynamic> json) {
    temporaryRegistration = tryConvertToTdObject(json['temporary_registration']);
  }
}

@reflector
class PassportElementPhoneNumber extends PassportElement {
  @override
  String get tdType => 'passportElementPhoneNumber';

   late String phoneNumber;

  @override
  Map<String, dynamic> get params => {
    'phone_number': phoneNumber,
  };

  PassportElementPhoneNumber({
  required this.phoneNumber,
  });

  PassportElementPhoneNumber.fromJson(Map<String, dynamic> json) {
    phoneNumber = tryConvertToTdObject(json['phone_number']);
  }
}

@reflector
class PassportElementEmailAddress extends PassportElement {
  @override
  String get tdType => 'passportElementEmailAddress';

   late String emailAddress;

  @override
  Map<String, dynamic> get params => {
    'email_address': emailAddress,
  };

  PassportElementEmailAddress({
  required this.emailAddress,
  });

  PassportElementEmailAddress.fromJson(Map<String, dynamic> json) {
    emailAddress = tryConvertToTdObject(json['email_address']);
  }
}

abstract class InputPassportElement extends TdObject {}

@reflector
class InputPassportElementPersonalDetails extends InputPassportElement {
  @override
  String get tdType => 'inputPassportElementPersonalDetails';

   late PersonalDetails personalDetails;

  @override
  Map<String, dynamic> get params => {
    'personal_details': personalDetails,
  };

  InputPassportElementPersonalDetails({
  required this.personalDetails,
  });

  InputPassportElementPersonalDetails.fromJson(Map<String, dynamic> json) {
    personalDetails = tryConvertToTdObject(json['personal_details']);
  }
}

@reflector
class InputPassportElementPassport extends InputPassportElement {
  @override
  String get tdType => 'inputPassportElementPassport';

   late InputIdentityDocument passport;

  @override
  Map<String, dynamic> get params => {
    'passport': passport,
  };

  InputPassportElementPassport({
  required this.passport,
  });

  InputPassportElementPassport.fromJson(Map<String, dynamic> json) {
    passport = tryConvertToTdObject(json['passport']);
  }
}

@reflector
class InputPassportElementDriverLicense extends InputPassportElement {
  @override
  String get tdType => 'inputPassportElementDriverLicense';

   late InputIdentityDocument driverLicense;

  @override
  Map<String, dynamic> get params => {
    'driver_license': driverLicense,
  };

  InputPassportElementDriverLicense({
  required this.driverLicense,
  });

  InputPassportElementDriverLicense.fromJson(Map<String, dynamic> json) {
    driverLicense = tryConvertToTdObject(json['driver_license']);
  }
}

@reflector
class InputPassportElementIdentityCard extends InputPassportElement {
  @override
  String get tdType => 'inputPassportElementIdentityCard';

   late InputIdentityDocument identityCard;

  @override
  Map<String, dynamic> get params => {
    'identity_card': identityCard,
  };

  InputPassportElementIdentityCard({
  required this.identityCard,
  });

  InputPassportElementIdentityCard.fromJson(Map<String, dynamic> json) {
    identityCard = tryConvertToTdObject(json['identity_card']);
  }
}

@reflector
class InputPassportElementInternalPassport extends InputPassportElement {
  @override
  String get tdType => 'inputPassportElementInternalPassport';

   late InputIdentityDocument internalPassport;

  @override
  Map<String, dynamic> get params => {
    'internal_passport': internalPassport,
  };

  InputPassportElementInternalPassport({
  required this.internalPassport,
  });

  InputPassportElementInternalPassport.fromJson(Map<String, dynamic> json) {
    internalPassport = tryConvertToTdObject(json['internal_passport']);
  }
}

@reflector
class InputPassportElementAddress extends InputPassportElement {
  @override
  String get tdType => 'inputPassportElementAddress';

   late Address address;

  @override
  Map<String, dynamic> get params => {
    'address': address,
  };

  InputPassportElementAddress({
  required this.address,
  });

  InputPassportElementAddress.fromJson(Map<String, dynamic> json) {
    address = tryConvertToTdObject(json['address']);
  }
}

@reflector
class InputPassportElementUtilityBill extends InputPassportElement {
  @override
  String get tdType => 'inputPassportElementUtilityBill';

   late InputPersonalDocument utilityBill;

  @override
  Map<String, dynamic> get params => {
    'utility_bill': utilityBill,
  };

  InputPassportElementUtilityBill({
  required this.utilityBill,
  });

  InputPassportElementUtilityBill.fromJson(Map<String, dynamic> json) {
    utilityBill = tryConvertToTdObject(json['utility_bill']);
  }
}

@reflector
class InputPassportElementBankStatement extends InputPassportElement {
  @override
  String get tdType => 'inputPassportElementBankStatement';

   late InputPersonalDocument bankStatement;

  @override
  Map<String, dynamic> get params => {
    'bank_statement': bankStatement,
  };

  InputPassportElementBankStatement({
  required this.bankStatement,
  });

  InputPassportElementBankStatement.fromJson(Map<String, dynamic> json) {
    bankStatement = tryConvertToTdObject(json['bank_statement']);
  }
}

@reflector
class InputPassportElementRentalAgreement extends InputPassportElement {
  @override
  String get tdType => 'inputPassportElementRentalAgreement';

   late InputPersonalDocument rentalAgreement;

  @override
  Map<String, dynamic> get params => {
    'rental_agreement': rentalAgreement,
  };

  InputPassportElementRentalAgreement({
  required this.rentalAgreement,
  });

  InputPassportElementRentalAgreement.fromJson(Map<String, dynamic> json) {
    rentalAgreement = tryConvertToTdObject(json['rental_agreement']);
  }
}

@reflector
class InputPassportElementPassportRegistration extends InputPassportElement {
  @override
  String get tdType => 'inputPassportElementPassportRegistration';

   late InputPersonalDocument passportRegistration;

  @override
  Map<String, dynamic> get params => {
    'passport_registration': passportRegistration,
  };

  InputPassportElementPassportRegistration({
  required this.passportRegistration,
  });

  InputPassportElementPassportRegistration.fromJson(Map<String, dynamic> json) {
    passportRegistration = tryConvertToTdObject(json['passport_registration']);
  }
}

@reflector
class InputPassportElementTemporaryRegistration extends InputPassportElement {
  @override
  String get tdType => 'inputPassportElementTemporaryRegistration';

   late InputPersonalDocument temporaryRegistration;

  @override
  Map<String, dynamic> get params => {
    'temporary_registration': temporaryRegistration,
  };

  InputPassportElementTemporaryRegistration({
  required this.temporaryRegistration,
  });

  InputPassportElementTemporaryRegistration.fromJson(Map<String, dynamic> json) {
    temporaryRegistration = tryConvertToTdObject(json['temporary_registration']);
  }
}

@reflector
class InputPassportElementPhoneNumber extends InputPassportElement {
  @override
  String get tdType => 'inputPassportElementPhoneNumber';

   late String phoneNumber;

  @override
  Map<String, dynamic> get params => {
    'phone_number': phoneNumber,
  };

  InputPassportElementPhoneNumber({
  required this.phoneNumber,
  });

  InputPassportElementPhoneNumber.fromJson(Map<String, dynamic> json) {
    phoneNumber = tryConvertToTdObject(json['phone_number']);
  }
}

@reflector
class InputPassportElementEmailAddress extends InputPassportElement {
  @override
  String get tdType => 'inputPassportElementEmailAddress';

   late String emailAddress;

  @override
  Map<String, dynamic> get params => {
    'email_address': emailAddress,
  };

  InputPassportElementEmailAddress({
  required this.emailAddress,
  });

  InputPassportElementEmailAddress.fromJson(Map<String, dynamic> json) {
    emailAddress = tryConvertToTdObject(json['email_address']);
  }
}

@reflector
class PassportElements extends TdObject {
  @override
  String get tdType => 'passportElements';

   late List<PassportElement> elements;

  @override
  Map<String, dynamic> get params => {
    'elements': elements,
  };

  PassportElements({
  required this.elements,
  });

  PassportElements.fromJson(Map<String, dynamic> json) {
    elements = tryConvertToTdObject(json['elements']);
  }
}

abstract class PassportElementErrorSource extends TdObject {}

@reflector
class PassportElementErrorSourceUnspecified extends PassportElementErrorSource {
  @override
  String get tdType => 'passportElementErrorSourceUnspecified';

  @override
  Map<String, dynamic> get params => {};

  PassportElementErrorSourceUnspecified();

  PassportElementErrorSourceUnspecified.fromJson(Map<String, dynamic> json);
}

@reflector
class PassportElementErrorSourceDataField extends PassportElementErrorSource {
  @override
  String get tdType => 'passportElementErrorSourceDataField';

   late String fieldName;

  @override
  Map<String, dynamic> get params => {
    'field_name': fieldName,
  };

  PassportElementErrorSourceDataField({
  required this.fieldName,
  });

  PassportElementErrorSourceDataField.fromJson(Map<String, dynamic> json) {
    fieldName = tryConvertToTdObject(json['field_name']);
  }
}

@reflector
class PassportElementErrorSourceFrontSide extends PassportElementErrorSource {
  @override
  String get tdType => 'passportElementErrorSourceFrontSide';

  @override
  Map<String, dynamic> get params => {};

  PassportElementErrorSourceFrontSide();

  PassportElementErrorSourceFrontSide.fromJson(Map<String, dynamic> json);
}

@reflector
class PassportElementErrorSourceReverseSide extends PassportElementErrorSource {
  @override
  String get tdType => 'passportElementErrorSourceReverseSide';

  @override
  Map<String, dynamic> get params => {};

  PassportElementErrorSourceReverseSide();

  PassportElementErrorSourceReverseSide.fromJson(Map<String, dynamic> json);
}

@reflector
class PassportElementErrorSourceSelfie extends PassportElementErrorSource {
  @override
  String get tdType => 'passportElementErrorSourceSelfie';

  @override
  Map<String, dynamic> get params => {};

  PassportElementErrorSourceSelfie();

  PassportElementErrorSourceSelfie.fromJson(Map<String, dynamic> json);
}

@reflector
class PassportElementErrorSourceTranslationFile extends PassportElementErrorSource {
  @override
  String get tdType => 'passportElementErrorSourceTranslationFile';

   late int fileIndex;

  @override
  Map<String, dynamic> get params => {
    'file_index': fileIndex,
  };

  PassportElementErrorSourceTranslationFile({
  required this.fileIndex,
  });

  PassportElementErrorSourceTranslationFile.fromJson(Map<String, dynamic> json) {
    fileIndex = tryConvertToTdObject(json['file_index']);
  }
}

@reflector
class PassportElementErrorSourceTranslationFiles extends PassportElementErrorSource {
  @override
  String get tdType => 'passportElementErrorSourceTranslationFiles';

  @override
  Map<String, dynamic> get params => {};

  PassportElementErrorSourceTranslationFiles();

  PassportElementErrorSourceTranslationFiles.fromJson(Map<String, dynamic> json);
}

@reflector
class PassportElementErrorSourceFile extends PassportElementErrorSource {
  @override
  String get tdType => 'passportElementErrorSourceFile';

   late int fileIndex;

  @override
  Map<String, dynamic> get params => {
    'file_index': fileIndex,
  };

  PassportElementErrorSourceFile({
  required this.fileIndex,
  });

  PassportElementErrorSourceFile.fromJson(Map<String, dynamic> json) {
    fileIndex = tryConvertToTdObject(json['file_index']);
  }
}

@reflector
class PassportElementErrorSourceFiles extends PassportElementErrorSource {
  @override
  String get tdType => 'passportElementErrorSourceFiles';

  @override
  Map<String, dynamic> get params => {};

  PassportElementErrorSourceFiles();

  PassportElementErrorSourceFiles.fromJson(Map<String, dynamic> json);
}

@reflector
class PassportElementError extends TdObject {
  @override
  String get tdType => 'passportElementError';

   late PassportElementType type;
   late String message;
   late PassportElementErrorSource source;

  @override
  Map<String, dynamic> get params => {
    'type': type,
    'message': message,
    'source': source,
  };

  PassportElementError({
  required this.type,
  required this.message,
  required this.source,
  });

  PassportElementError.fromJson(Map<String, dynamic> json) {
    type = tryConvertToTdObject(json['type']);
    message = tryConvertToTdObject(json['message']);
    source = tryConvertToTdObject(json['source']);
  }
}

@reflector
class PassportSuitableElement extends TdObject {
  @override
  String get tdType => 'passportSuitableElement';

   late PassportElementType type;
   late bool isSelfieRequired;
   late bool isTranslationRequired;
   late bool isNativeNameRequired;

  @override
  Map<String, dynamic> get params => {
    'type': type,
    'is_selfie_required': isSelfieRequired,
    'is_translation_required': isTranslationRequired,
    'is_native_name_required': isNativeNameRequired,
  };

  PassportSuitableElement({
  required this.type,
  required this.isSelfieRequired,
  required this.isTranslationRequired,
  required this.isNativeNameRequired,
  });

  PassportSuitableElement.fromJson(Map<String, dynamic> json) {
    type = tryConvertToTdObject(json['type']);
    isSelfieRequired = tryConvertToTdObject(json['is_selfie_required']);
    isTranslationRequired = tryConvertToTdObject(json['is_translation_required']);
    isNativeNameRequired = tryConvertToTdObject(json['is_native_name_required']);
  }
}

@reflector
class PassportRequiredElement extends TdObject {
  @override
  String get tdType => 'passportRequiredElement';

   late List<PassportSuitableElement> suitableElements;

  @override
  Map<String, dynamic> get params => {
    'suitable_elements': suitableElements,
  };

  PassportRequiredElement({
  required this.suitableElements,
  });

  PassportRequiredElement.fromJson(Map<String, dynamic> json) {
    suitableElements = tryConvertToTdObject(json['suitable_elements']);
  }
}

@reflector
class PassportAuthorizationForm extends TdObject {
  @override
  String get tdType => 'passportAuthorizationForm';

   late int id;
   late List<PassportRequiredElement> requiredElements;
   late String privacyPolicyUrl;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'required_elements': requiredElements,
    'privacy_policy_url': privacyPolicyUrl,
  };

  PassportAuthorizationForm({
  required this.id,
  required this.requiredElements,
  required this.privacyPolicyUrl,
  });

  PassportAuthorizationForm.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    requiredElements = tryConvertToTdObject(json['required_elements']);
    privacyPolicyUrl = tryConvertToTdObject(json['privacy_policy_url']);
  }
}

@reflector
class PassportElementsWithErrors extends TdObject {
  @override
  String get tdType => 'passportElementsWithErrors';

   late List<PassportElement> elements;
   late List<PassportElementError> errors;

  @override
  Map<String, dynamic> get params => {
    'elements': elements,
    'errors': errors,
  };

  PassportElementsWithErrors({
  required this.elements,
  required this.errors,
  });

  PassportElementsWithErrors.fromJson(Map<String, dynamic> json) {
    elements = tryConvertToTdObject(json['elements']);
    errors = tryConvertToTdObject(json['errors']);
  }
}

@reflector
class EncryptedCredentials extends TdObject {
  @override
  String get tdType => 'encryptedCredentials';

   late String data;
   late String hash;
   late String secret;

  @override
  Map<String, dynamic> get params => {
    'data': data,
    'hash': hash,
    'secret': secret,
  };

  EncryptedCredentials({
  required this.data,
  required this.hash,
  required this.secret,
  });

  EncryptedCredentials.fromJson(Map<String, dynamic> json) {
    data = tryConvertToTdObject(json['data']);
    hash = tryConvertToTdObject(json['hash']);
    secret = tryConvertToTdObject(json['secret']);
  }
}

@reflector
class EncryptedPassportElement extends TdObject {
  @override
  String get tdType => 'encryptedPassportElement';

   late PassportElementType type;
   late String data;
   late DatedFile frontSide;
   late DatedFile reverseSide;
   late DatedFile selfie;
   late List<DatedFile> translation;
   late List<DatedFile> files;
   late String value;
   late String hash;

  @override
  Map<String, dynamic> get params => {
    'type': type,
    'data': data,
    'front_side': frontSide,
    'reverse_side': reverseSide,
    'selfie': selfie,
    'translation': translation,
    'files': files,
    'value': value,
    'hash': hash,
  };

  EncryptedPassportElement({
  required this.type,
  required this.data,
  required this.frontSide,
  required this.reverseSide,
  required this.selfie,
  required this.translation,
  required this.files,
  required this.value,
  required this.hash,
  });

  EncryptedPassportElement.fromJson(Map<String, dynamic> json) {
    type = tryConvertToTdObject(json['type']);
    data = tryConvertToTdObject(json['data']);
    frontSide = tryConvertToTdObject(json['front_side']);
    reverseSide = tryConvertToTdObject(json['reverse_side']);
    selfie = tryConvertToTdObject(json['selfie']);
    translation = tryConvertToTdObject(json['translation']);
    files = tryConvertToTdObject(json['files']);
    value = tryConvertToTdObject(json['value']);
    hash = tryConvertToTdObject(json['hash']);
  }
}

abstract class InputPassportElementErrorSource extends TdObject {}

@reflector
class InputPassportElementErrorSourceUnspecified extends InputPassportElementErrorSource {
  @override
  String get tdType => 'inputPassportElementErrorSourceUnspecified';

   late String elementHash;

  @override
  Map<String, dynamic> get params => {
    'element_hash': elementHash,
  };

  InputPassportElementErrorSourceUnspecified({
  required this.elementHash,
  });

  InputPassportElementErrorSourceUnspecified.fromJson(Map<String, dynamic> json) {
    elementHash = tryConvertToTdObject(json['element_hash']);
  }
}

@reflector
class InputPassportElementErrorSourceDataField extends InputPassportElementErrorSource {
  @override
  String get tdType => 'inputPassportElementErrorSourceDataField';

   late String fieldName;
   late String dataHash;

  @override
  Map<String, dynamic> get params => {
    'field_name': fieldName,
    'data_hash': dataHash,
  };

  InputPassportElementErrorSourceDataField({
  required this.fieldName,
  required this.dataHash,
  });

  InputPassportElementErrorSourceDataField.fromJson(Map<String, dynamic> json) {
    fieldName = tryConvertToTdObject(json['field_name']);
    dataHash = tryConvertToTdObject(json['data_hash']);
  }
}

@reflector
class InputPassportElementErrorSourceFrontSide extends InputPassportElementErrorSource {
  @override
  String get tdType => 'inputPassportElementErrorSourceFrontSide';

   late String fileHash;

  @override
  Map<String, dynamic> get params => {
    'file_hash': fileHash,
  };

  InputPassportElementErrorSourceFrontSide({
  required this.fileHash,
  });

  InputPassportElementErrorSourceFrontSide.fromJson(Map<String, dynamic> json) {
    fileHash = tryConvertToTdObject(json['file_hash']);
  }
}

@reflector
class InputPassportElementErrorSourceReverseSide extends InputPassportElementErrorSource {
  @override
  String get tdType => 'inputPassportElementErrorSourceReverseSide';

   late String fileHash;

  @override
  Map<String, dynamic> get params => {
    'file_hash': fileHash,
  };

  InputPassportElementErrorSourceReverseSide({
  required this.fileHash,
  });

  InputPassportElementErrorSourceReverseSide.fromJson(Map<String, dynamic> json) {
    fileHash = tryConvertToTdObject(json['file_hash']);
  }
}

@reflector
class InputPassportElementErrorSourceSelfie extends InputPassportElementErrorSource {
  @override
  String get tdType => 'inputPassportElementErrorSourceSelfie';

   late String fileHash;

  @override
  Map<String, dynamic> get params => {
    'file_hash': fileHash,
  };

  InputPassportElementErrorSourceSelfie({
  required this.fileHash,
  });

  InputPassportElementErrorSourceSelfie.fromJson(Map<String, dynamic> json) {
    fileHash = tryConvertToTdObject(json['file_hash']);
  }
}

@reflector
class InputPassportElementErrorSourceTranslationFile extends InputPassportElementErrorSource {
  @override
  String get tdType => 'inputPassportElementErrorSourceTranslationFile';

   late String fileHash;

  @override
  Map<String, dynamic> get params => {
    'file_hash': fileHash,
  };

  InputPassportElementErrorSourceTranslationFile({
  required this.fileHash,
  });

  InputPassportElementErrorSourceTranslationFile.fromJson(Map<String, dynamic> json) {
    fileHash = tryConvertToTdObject(json['file_hash']);
  }
}

@reflector
class InputPassportElementErrorSourceTranslationFiles extends InputPassportElementErrorSource {
  @override
  String get tdType => 'inputPassportElementErrorSourceTranslationFiles';

   late List<String> fileHashes;

  @override
  Map<String, dynamic> get params => {
    'file_hashes': fileHashes,
  };

  InputPassportElementErrorSourceTranslationFiles({
  required this.fileHashes,
  });

  InputPassportElementErrorSourceTranslationFiles.fromJson(Map<String, dynamic> json) {
    fileHashes = tryConvertToTdObject(json['file_hashes']);
  }
}

@reflector
class InputPassportElementErrorSourceFile extends InputPassportElementErrorSource {
  @override
  String get tdType => 'inputPassportElementErrorSourceFile';

   late String fileHash;

  @override
  Map<String, dynamic> get params => {
    'file_hash': fileHash,
  };

  InputPassportElementErrorSourceFile({
  required this.fileHash,
  });

  InputPassportElementErrorSourceFile.fromJson(Map<String, dynamic> json) {
    fileHash = tryConvertToTdObject(json['file_hash']);
  }
}

@reflector
class InputPassportElementErrorSourceFiles extends InputPassportElementErrorSource {
  @override
  String get tdType => 'inputPassportElementErrorSourceFiles';

   late List<String> fileHashes;

  @override
  Map<String, dynamic> get params => {
    'file_hashes': fileHashes,
  };

  InputPassportElementErrorSourceFiles({
  required this.fileHashes,
  });

  InputPassportElementErrorSourceFiles.fromJson(Map<String, dynamic> json) {
    fileHashes = tryConvertToTdObject(json['file_hashes']);
  }
}

@reflector
class InputPassportElementError extends TdObject {
  @override
  String get tdType => 'inputPassportElementError';

   late PassportElementType type;
   late String message;
   late InputPassportElementErrorSource source;

  @override
  Map<String, dynamic> get params => {
    'type': type,
    'message': message,
    'source': source,
  };

  InputPassportElementError({
  required this.type,
  required this.message,
  required this.source,
  });

  InputPassportElementError.fromJson(Map<String, dynamic> json) {
    type = tryConvertToTdObject(json['type']);
    message = tryConvertToTdObject(json['message']);
    source = tryConvertToTdObject(json['source']);
  }
}

abstract class MessageContent extends TdObject {}

@reflector
class MessageText extends MessageContent {
  @override
  String get tdType => 'messageText';

   late FormattedText text;
   late WebPage webPage;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'web_page': webPage,
  };

  MessageText({
  required this.text,
  required this.webPage,
  });

  MessageText.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    webPage = tryConvertToTdObject(json['web_page']);
  }
}

@reflector
class MessageAnimation extends MessageContent {
  @override
  String get tdType => 'messageAnimation';

   late Animation animation;
   late FormattedText caption;
   late bool isSecret;

  @override
  Map<String, dynamic> get params => {
    'animation': animation,
    'caption': caption,
    'is_secret': isSecret,
  };

  MessageAnimation({
  required this.animation,
  required this.caption,
  required this.isSecret,
  });

  MessageAnimation.fromJson(Map<String, dynamic> json) {
    animation = tryConvertToTdObject(json['animation']);
    caption = tryConvertToTdObject(json['caption']);
    isSecret = tryConvertToTdObject(json['is_secret']);
  }
}

@reflector
class MessageAudio extends MessageContent {
  @override
  String get tdType => 'messageAudio';

   late Audio audio;
   late FormattedText caption;

  @override
  Map<String, dynamic> get params => {
    'audio': audio,
    'caption': caption,
  };

  MessageAudio({
  required this.audio,
  required this.caption,
  });

  MessageAudio.fromJson(Map<String, dynamic> json) {
    audio = tryConvertToTdObject(json['audio']);
    caption = tryConvertToTdObject(json['caption']);
  }
}

@reflector
class MessageDocument extends MessageContent {
  @override
  String get tdType => 'messageDocument';

   late Document document;
   late FormattedText caption;

  @override
  Map<String, dynamic> get params => {
    'document': document,
    'caption': caption,
  };

  MessageDocument({
  required this.document,
  required this.caption,
  });

  MessageDocument.fromJson(Map<String, dynamic> json) {
    document = tryConvertToTdObject(json['document']);
    caption = tryConvertToTdObject(json['caption']);
  }
}

@reflector
class MessagePhoto extends MessageContent {
  @override
  String get tdType => 'messagePhoto';

   late Photo photo;
   late FormattedText caption;
   late bool isSecret;

  @override
  Map<String, dynamic> get params => {
    'photo': photo,
    'caption': caption,
    'is_secret': isSecret,
  };

  MessagePhoto({
  required this.photo,
  required this.caption,
  required this.isSecret,
  });

  MessagePhoto.fromJson(Map<String, dynamic> json) {
    photo = tryConvertToTdObject(json['photo']);
    caption = tryConvertToTdObject(json['caption']);
    isSecret = tryConvertToTdObject(json['is_secret']);
  }
}

@reflector
class MessageExpiredPhoto extends MessageContent {
  @override
  String get tdType => 'messageExpiredPhoto';

  @override
  Map<String, dynamic> get params => {};

  MessageExpiredPhoto();

  MessageExpiredPhoto.fromJson(Map<String, dynamic> json);
}

@reflector
class MessageSticker extends MessageContent {
  @override
  String get tdType => 'messageSticker';

   late Sticker sticker;

  @override
  Map<String, dynamic> get params => {
    'sticker': sticker,
  };

  MessageSticker({
  required this.sticker,
  });

  MessageSticker.fromJson(Map<String, dynamic> json) {
    sticker = tryConvertToTdObject(json['sticker']);
  }
}

@reflector
class MessageVideo extends MessageContent {
  @override
  String get tdType => 'messageVideo';

   late Video video;
   late FormattedText caption;
   late bool isSecret;

  @override
  Map<String, dynamic> get params => {
    'video': video,
    'caption': caption,
    'is_secret': isSecret,
  };

  MessageVideo({
  required this.video,
  required this.caption,
  required this.isSecret,
  });

  MessageVideo.fromJson(Map<String, dynamic> json) {
    video = tryConvertToTdObject(json['video']);
    caption = tryConvertToTdObject(json['caption']);
    isSecret = tryConvertToTdObject(json['is_secret']);
  }
}

@reflector
class MessageExpiredVideo extends MessageContent {
  @override
  String get tdType => 'messageExpiredVideo';

  @override
  Map<String, dynamic> get params => {};

  MessageExpiredVideo();

  MessageExpiredVideo.fromJson(Map<String, dynamic> json);
}

@reflector
class MessageVideoNote extends MessageContent {
  @override
  String get tdType => 'messageVideoNote';

   late VideoNote videoNote;
   late bool isViewed;
   late bool isSecret;

  @override
  Map<String, dynamic> get params => {
    'video_note': videoNote,
    'is_viewed': isViewed,
    'is_secret': isSecret,
  };

  MessageVideoNote({
  required this.videoNote,
  required this.isViewed,
  required this.isSecret,
  });

  MessageVideoNote.fromJson(Map<String, dynamic> json) {
    videoNote = tryConvertToTdObject(json['video_note']);
    isViewed = tryConvertToTdObject(json['is_viewed']);
    isSecret = tryConvertToTdObject(json['is_secret']);
  }
}

@reflector
class MessageVoiceNote extends MessageContent {
  @override
  String get tdType => 'messageVoiceNote';

   late VoiceNote voiceNote;
   late FormattedText caption;
   late bool isListened;

  @override
  Map<String, dynamic> get params => {
    'voice_note': voiceNote,
    'caption': caption,
    'is_listened': isListened,
  };

  MessageVoiceNote({
  required this.voiceNote,
  required this.caption,
  required this.isListened,
  });

  MessageVoiceNote.fromJson(Map<String, dynamic> json) {
    voiceNote = tryConvertToTdObject(json['voice_note']);
    caption = tryConvertToTdObject(json['caption']);
    isListened = tryConvertToTdObject(json['is_listened']);
  }
}

@reflector
class MessageLocation extends MessageContent {
  @override
  String get tdType => 'messageLocation';

   late Location location;
   late int livePeriod;
   late int expiresIn;
   late int heading;
   late int proximityAlertRadius;

  @override
  Map<String, dynamic> get params => {
    'location': location,
    'live_period': livePeriod,
    'expires_in': expiresIn,
    'heading': heading,
    'proximity_alert_radius': proximityAlertRadius,
  };

  MessageLocation({
  required this.location,
  required this.livePeriod,
  required this.expiresIn,
  required this.heading,
  required this.proximityAlertRadius,
  });

  MessageLocation.fromJson(Map<String, dynamic> json) {
    location = tryConvertToTdObject(json['location']);
    livePeriod = tryConvertToTdObject(json['live_period']);
    expiresIn = tryConvertToTdObject(json['expires_in']);
    heading = tryConvertToTdObject(json['heading']);
    proximityAlertRadius = tryConvertToTdObject(json['proximity_alert_radius']);
  }
}

@reflector
class MessageVenue extends MessageContent {
  @override
  String get tdType => 'messageVenue';

   late Venue venue;

  @override
  Map<String, dynamic> get params => {
    'venue': venue,
  };

  MessageVenue({
  required this.venue,
  });

  MessageVenue.fromJson(Map<String, dynamic> json) {
    venue = tryConvertToTdObject(json['venue']);
  }
}

@reflector
class MessageContact extends MessageContent {
  @override
  String get tdType => 'messageContact';

   late Contact contact;

  @override
  Map<String, dynamic> get params => {
    'contact': contact,
  };

  MessageContact({
  required this.contact,
  });

  MessageContact.fromJson(Map<String, dynamic> json) {
    contact = tryConvertToTdObject(json['contact']);
  }
}

@reflector
class MessageDice extends MessageContent {
  @override
  String get tdType => 'messageDice';

   late DiceStickers initialState;
   late DiceStickers finalState;
   late String emoji;
   late int value;
   late int successAnimationFrameNumber;

  @override
  Map<String, dynamic> get params => {
    'initial_state': initialState,
    'final_state': finalState,
    'emoji': emoji,
    'value': value,
    'success_animation_frame_number': successAnimationFrameNumber,
  };

  MessageDice({
  required this.initialState,
  required this.finalState,
  required this.emoji,
  required this.value,
  required this.successAnimationFrameNumber,
  });

  MessageDice.fromJson(Map<String, dynamic> json) {
    initialState = tryConvertToTdObject(json['initial_state']);
    finalState = tryConvertToTdObject(json['final_state']);
    emoji = tryConvertToTdObject(json['emoji']);
    value = tryConvertToTdObject(json['value']);
    successAnimationFrameNumber = tryConvertToTdObject(json['success_animation_frame_number']);
  }
}

@reflector
class MessageGame extends MessageContent {
  @override
  String get tdType => 'messageGame';

   late Game game;

  @override
  Map<String, dynamic> get params => {
    'game': game,
  };

  MessageGame({
  required this.game,
  });

  MessageGame.fromJson(Map<String, dynamic> json) {
    game = tryConvertToTdObject(json['game']);
  }
}

@reflector
class MessagePoll extends MessageContent {
  @override
  String get tdType => 'messagePoll';

   late Poll poll;

  @override
  Map<String, dynamic> get params => {
    'poll': poll,
  };

  MessagePoll({
  required this.poll,
  });

  MessagePoll.fromJson(Map<String, dynamic> json) {
    poll = tryConvertToTdObject(json['poll']);
  }
}

@reflector
class MessageInvoice extends MessageContent {
  @override
  String get tdType => 'messageInvoice';

   late String title;
   late String description;
   late Photo photo;
   late String currency;
   late int totalAmount;
   late String startParameter;
   late bool isTest;
   late bool needShippingAddress;
   late int receiptMessageId;

  @override
  Map<String, dynamic> get params => {
    'title': title,
    'description': description,
    'photo': photo,
    'currency': currency,
    'total_amount': totalAmount,
    'start_parameter': startParameter,
    'is_test': isTest,
    'need_shipping_address': needShippingAddress,
    'receipt_message_id': receiptMessageId,
  };

  MessageInvoice({
  required this.title,
  required this.description,
  required this.photo,
  required this.currency,
  required this.totalAmount,
  required this.startParameter,
  required this.isTest,
  required this.needShippingAddress,
  required this.receiptMessageId,
  });

  MessageInvoice.fromJson(Map<String, dynamic> json) {
    title = tryConvertToTdObject(json['title']);
    description = tryConvertToTdObject(json['description']);
    photo = tryConvertToTdObject(json['photo']);
    currency = tryConvertToTdObject(json['currency']);
    totalAmount = tryConvertToTdObject(json['total_amount']);
    startParameter = tryConvertToTdObject(json['start_parameter']);
    isTest = tryConvertToTdObject(json['is_test']);
    needShippingAddress = tryConvertToTdObject(json['need_shipping_address']);
    receiptMessageId = tryConvertToTdObject(json['receipt_message_id']);
  }
}

@reflector
class MessageCall extends MessageContent {
  @override
  String get tdType => 'messageCall';

   late bool isVideo;
   late CallDiscardReason discardReason;
   late int duration;

  @override
  Map<String, dynamic> get params => {
    'is_video': isVideo,
    'discard_reason': discardReason,
    'duration': duration,
  };

  MessageCall({
  required this.isVideo,
  required this.discardReason,
  required this.duration,
  });

  MessageCall.fromJson(Map<String, dynamic> json) {
    isVideo = tryConvertToTdObject(json['is_video']);
    discardReason = tryConvertToTdObject(json['discard_reason']);
    duration = tryConvertToTdObject(json['duration']);
  }
}

@reflector
class MessageVoiceChatScheduled extends MessageContent {
  @override
  String get tdType => 'messageVoiceChatScheduled';

   late int groupCallId;
   late int startDate;

  @override
  Map<String, dynamic> get params => {
    'group_call_id': groupCallId,
    'start_date': startDate,
  };

  MessageVoiceChatScheduled({
  required this.groupCallId,
  required this.startDate,
  });

  MessageVoiceChatScheduled.fromJson(Map<String, dynamic> json) {
    groupCallId = tryConvertToTdObject(json['group_call_id']);
    startDate = tryConvertToTdObject(json['start_date']);
  }
}

@reflector
class MessageVoiceChatStarted extends MessageContent {
  @override
  String get tdType => 'messageVoiceChatStarted';

   late int groupCallId;

  @override
  Map<String, dynamic> get params => {
    'group_call_id': groupCallId,
  };

  MessageVoiceChatStarted({
  required this.groupCallId,
  });

  MessageVoiceChatStarted.fromJson(Map<String, dynamic> json) {
    groupCallId = tryConvertToTdObject(json['group_call_id']);
  }
}

@reflector
class MessageVoiceChatEnded extends MessageContent {
  @override
  String get tdType => 'messageVoiceChatEnded';

   late int duration;

  @override
  Map<String, dynamic> get params => {
    'duration': duration,
  };

  MessageVoiceChatEnded({
  required this.duration,
  });

  MessageVoiceChatEnded.fromJson(Map<String, dynamic> json) {
    duration = tryConvertToTdObject(json['duration']);
  }
}

@reflector
class MessageInviteVoiceChatParticipants extends MessageContent {
  @override
  String get tdType => 'messageInviteVoiceChatParticipants';

   late int groupCallId;
   late List<int> userIds;

  @override
  Map<String, dynamic> get params => {
    'group_call_id': groupCallId,
    'user_ids': userIds,
  };

  MessageInviteVoiceChatParticipants({
  required this.groupCallId,
  required this.userIds,
  });

  MessageInviteVoiceChatParticipants.fromJson(Map<String, dynamic> json) {
    groupCallId = tryConvertToTdObject(json['group_call_id']);
    userIds = tryConvertToTdObject(json['user_ids']);
  }
}

@reflector
class MessageBasicGroupChatCreate extends MessageContent {
  @override
  String get tdType => 'messageBasicGroupChatCreate';

   late String title;
   late List<int> memberUserIds;

  @override
  Map<String, dynamic> get params => {
    'title': title,
    'member_user_ids': memberUserIds,
  };

  MessageBasicGroupChatCreate({
  required this.title,
  required this.memberUserIds,
  });

  MessageBasicGroupChatCreate.fromJson(Map<String, dynamic> json) {
    title = tryConvertToTdObject(json['title']);
    memberUserIds = tryConvertToTdObject(json['member_user_ids']);
  }
}

@reflector
class MessageSupergroupChatCreate extends MessageContent {
  @override
  String get tdType => 'messageSupergroupChatCreate';

   late String title;

  @override
  Map<String, dynamic> get params => {
    'title': title,
  };

  MessageSupergroupChatCreate({
  required this.title,
  });

  MessageSupergroupChatCreate.fromJson(Map<String, dynamic> json) {
    title = tryConvertToTdObject(json['title']);
  }
}

@reflector
class MessageChatChangeTitle extends MessageContent {
  @override
  String get tdType => 'messageChatChangeTitle';

   late String title;

  @override
  Map<String, dynamic> get params => {
    'title': title,
  };

  MessageChatChangeTitle({
  required this.title,
  });

  MessageChatChangeTitle.fromJson(Map<String, dynamic> json) {
    title = tryConvertToTdObject(json['title']);
  }
}

@reflector
class MessageChatChangePhoto extends MessageContent {
  @override
  String get tdType => 'messageChatChangePhoto';

   late ChatPhoto photo;

  @override
  Map<String, dynamic> get params => {
    'photo': photo,
  };

  MessageChatChangePhoto({
  required this.photo,
  });

  MessageChatChangePhoto.fromJson(Map<String, dynamic> json) {
    photo = tryConvertToTdObject(json['photo']);
  }
}

@reflector
class MessageChatDeletePhoto extends MessageContent {
  @override
  String get tdType => 'messageChatDeletePhoto';

  @override
  Map<String, dynamic> get params => {};

  MessageChatDeletePhoto();

  MessageChatDeletePhoto.fromJson(Map<String, dynamic> json);
}

@reflector
class MessageChatAddMembers extends MessageContent {
  @override
  String get tdType => 'messageChatAddMembers';

   late List<int> memberUserIds;

  @override
  Map<String, dynamic> get params => {
    'member_user_ids': memberUserIds,
  };

  MessageChatAddMembers({
  required this.memberUserIds,
  });

  MessageChatAddMembers.fromJson(Map<String, dynamic> json) {
    memberUserIds = tryConvertToTdObject(json['member_user_ids']);
  }
}

@reflector
class MessageChatJoinByLink extends MessageContent {
  @override
  String get tdType => 'messageChatJoinByLink';

  @override
  Map<String, dynamic> get params => {};

  MessageChatJoinByLink();

  MessageChatJoinByLink.fromJson(Map<String, dynamic> json);
}

@reflector
class MessageChatDeleteMember extends MessageContent {
  @override
  String get tdType => 'messageChatDeleteMember';

   late int userId;

  @override
  Map<String, dynamic> get params => {
    'user_id': userId,
  };

  MessageChatDeleteMember({
  required this.userId,
  });

  MessageChatDeleteMember.fromJson(Map<String, dynamic> json) {
    userId = tryConvertToTdObject(json['user_id']);
  }
}

@reflector
class MessageChatUpgradeTo extends MessageContent {
  @override
  String get tdType => 'messageChatUpgradeTo';

   late int supergroupId;

  @override
  Map<String, dynamic> get params => {
    'supergroup_id': supergroupId,
  };

  MessageChatUpgradeTo({
  required this.supergroupId,
  });

  MessageChatUpgradeTo.fromJson(Map<String, dynamic> json) {
    supergroupId = tryConvertToTdObject(json['supergroup_id']);
  }
}

@reflector
class MessageChatUpgradeFrom extends MessageContent {
  @override
  String get tdType => 'messageChatUpgradeFrom';

   late String title;
   late int basicGroupId;

  @override
  Map<String, dynamic> get params => {
    'title': title,
    'basic_group_id': basicGroupId,
  };

  MessageChatUpgradeFrom({
  required this.title,
  required this.basicGroupId,
  });

  MessageChatUpgradeFrom.fromJson(Map<String, dynamic> json) {
    title = tryConvertToTdObject(json['title']);
    basicGroupId = tryConvertToTdObject(json['basic_group_id']);
  }
}

@reflector
class MessagePinMessage extends MessageContent {
  @override
  String get tdType => 'messagePinMessage';

   late int messageId;

  @override
  Map<String, dynamic> get params => {
    'message_id': messageId,
  };

  MessagePinMessage({
  required this.messageId,
  });

  MessagePinMessage.fromJson(Map<String, dynamic> json) {
    messageId = tryConvertToTdObject(json['message_id']);
  }
}

@reflector
class MessageScreenshotTaken extends MessageContent {
  @override
  String get tdType => 'messageScreenshotTaken';

  @override
  Map<String, dynamic> get params => {};

  MessageScreenshotTaken();

  MessageScreenshotTaken.fromJson(Map<String, dynamic> json);
}

@reflector
class MessageChatSetTheme extends MessageContent {
  @override
  String get tdType => 'messageChatSetTheme';

   late String themeName;

  @override
  Map<String, dynamic> get params => {
    'theme_name': themeName,
  };

  MessageChatSetTheme({
  required this.themeName,
  });

  MessageChatSetTheme.fromJson(Map<String, dynamic> json) {
    themeName = tryConvertToTdObject(json['theme_name']);
  }
}

@reflector
class MessageChatSetTtl extends MessageContent {
  @override
  String get tdType => 'messageChatSetTtl';

   late int ttl;

  @override
  Map<String, dynamic> get params => {
    'ttl': ttl,
  };

  MessageChatSetTtl({
  required this.ttl,
  });

  MessageChatSetTtl.fromJson(Map<String, dynamic> json) {
    ttl = tryConvertToTdObject(json['ttl']);
  }
}

@reflector
class MessageCustomServiceAction extends MessageContent {
  @override
  String get tdType => 'messageCustomServiceAction';

   late String text;

  @override
  Map<String, dynamic> get params => {
    'text': text,
  };

  MessageCustomServiceAction({
  required this.text,
  });

  MessageCustomServiceAction.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
  }
}

@reflector
class MessageGameScore extends MessageContent {
  @override
  String get tdType => 'messageGameScore';

   late int gameMessageId;
   late int gameId;
   late int score;

  @override
  Map<String, dynamic> get params => {
    'game_message_id': gameMessageId,
    'game_id': gameId,
    'score': score,
  };

  MessageGameScore({
  required this.gameMessageId,
  required this.gameId,
  required this.score,
  });

  MessageGameScore.fromJson(Map<String, dynamic> json) {
    gameMessageId = tryConvertToTdObject(json['game_message_id']);
    gameId = tryConvertToTdObject(json['game_id']);
    score = tryConvertToTdObject(json['score']);
  }
}

@reflector
class MessagePaymentSuccessful extends MessageContent {
  @override
  String get tdType => 'messagePaymentSuccessful';

   late int invoiceChatId;
   late int invoiceMessageId;
   late String currency;
   late int totalAmount;

  @override
  Map<String, dynamic> get params => {
    'invoice_chat_id': invoiceChatId,
    'invoice_message_id': invoiceMessageId,
    'currency': currency,
    'total_amount': totalAmount,
  };

  MessagePaymentSuccessful({
  required this.invoiceChatId,
  required this.invoiceMessageId,
  required this.currency,
  required this.totalAmount,
  });

  MessagePaymentSuccessful.fromJson(Map<String, dynamic> json) {
    invoiceChatId = tryConvertToTdObject(json['invoice_chat_id']);
    invoiceMessageId = tryConvertToTdObject(json['invoice_message_id']);
    currency = tryConvertToTdObject(json['currency']);
    totalAmount = tryConvertToTdObject(json['total_amount']);
  }
}

@reflector
class MessagePaymentSuccessfulBot extends MessageContent {
  @override
  String get tdType => 'messagePaymentSuccessfulBot';

   late String currency;
   late int totalAmount;
   late String invoicePayload;
   late String shippingOptionId;
   late OrderInfo orderInfo;
   late String telegramPaymentChargeId;
   late String providerPaymentChargeId;

  @override
  Map<String, dynamic> get params => {
    'currency': currency,
    'total_amount': totalAmount,
    'invoice_payload': invoicePayload,
    'shipping_option_id': shippingOptionId,
    'order_info': orderInfo,
    'telegram_payment_charge_id': telegramPaymentChargeId,
    'provider_payment_charge_id': providerPaymentChargeId,
  };

  MessagePaymentSuccessfulBot({
  required this.currency,
  required this.totalAmount,
  required this.invoicePayload,
  required this.shippingOptionId,
  required this.orderInfo,
  required this.telegramPaymentChargeId,
  required this.providerPaymentChargeId,
  });

  MessagePaymentSuccessfulBot.fromJson(Map<String, dynamic> json) {
    currency = tryConvertToTdObject(json['currency']);
    totalAmount = tryConvertToTdObject(json['total_amount']);
    invoicePayload = tryConvertToTdObject(json['invoice_payload']);
    shippingOptionId = tryConvertToTdObject(json['shipping_option_id']);
    orderInfo = tryConvertToTdObject(json['order_info']);
    telegramPaymentChargeId = tryConvertToTdObject(json['telegram_payment_charge_id']);
    providerPaymentChargeId = tryConvertToTdObject(json['provider_payment_charge_id']);
  }
}

@reflector
class MessageContactRegistered extends MessageContent {
  @override
  String get tdType => 'messageContactRegistered';

  @override
  Map<String, dynamic> get params => {};

  MessageContactRegistered();

  MessageContactRegistered.fromJson(Map<String, dynamic> json);
}

@reflector
class MessageWebsiteConnected extends MessageContent {
  @override
  String get tdType => 'messageWebsiteConnected';

   late String domainName;

  @override
  Map<String, dynamic> get params => {
    'domain_name': domainName,
  };

  MessageWebsiteConnected({
  required this.domainName,
  });

  MessageWebsiteConnected.fromJson(Map<String, dynamic> json) {
    domainName = tryConvertToTdObject(json['domain_name']);
  }
}

@reflector
class MessagePassportDataSent extends MessageContent {
  @override
  String get tdType => 'messagePassportDataSent';

   late List<PassportElementType> types;

  @override
  Map<String, dynamic> get params => {
    'types': types,
  };

  MessagePassportDataSent({
  required this.types,
  });

  MessagePassportDataSent.fromJson(Map<String, dynamic> json) {
    types = tryConvertToTdObject(json['types']);
  }
}

@reflector
class MessagePassportDataReceived extends MessageContent {
  @override
  String get tdType => 'messagePassportDataReceived';

   late List<EncryptedPassportElement> elements;
   late EncryptedCredentials credentials;

  @override
  Map<String, dynamic> get params => {
    'elements': elements,
    'credentials': credentials,
  };

  MessagePassportDataReceived({
  required this.elements,
  required this.credentials,
  });

  MessagePassportDataReceived.fromJson(Map<String, dynamic> json) {
    elements = tryConvertToTdObject(json['elements']);
    credentials = tryConvertToTdObject(json['credentials']);
  }
}

@reflector
class MessageProximityAlertTriggered extends MessageContent {
  @override
  String get tdType => 'messageProximityAlertTriggered';

   late MessageSender traveler;
   late MessageSender watcher;
   late int distance;

  @override
  Map<String, dynamic> get params => {
    'traveler': traveler,
    'watcher': watcher,
    'distance': distance,
  };

  MessageProximityAlertTriggered({
  required this.traveler,
  required this.watcher,
  required this.distance,
  });

  MessageProximityAlertTriggered.fromJson(Map<String, dynamic> json) {
    traveler = tryConvertToTdObject(json['traveler']);
    watcher = tryConvertToTdObject(json['watcher']);
    distance = tryConvertToTdObject(json['distance']);
  }
}

@reflector
class MessageUnsupported extends MessageContent {
  @override
  String get tdType => 'messageUnsupported';

  @override
  Map<String, dynamic> get params => {};

  MessageUnsupported();

  MessageUnsupported.fromJson(Map<String, dynamic> json);
}

abstract class TextEntityType extends TdObject {}

@reflector
class TextEntityTypeMention extends TextEntityType {
  @override
  String get tdType => 'textEntityTypeMention';

  @override
  Map<String, dynamic> get params => {};

  TextEntityTypeMention();

  TextEntityTypeMention.fromJson(Map<String, dynamic> json);
}

@reflector
class TextEntityTypeHashtag extends TextEntityType {
  @override
  String get tdType => 'textEntityTypeHashtag';

  @override
  Map<String, dynamic> get params => {};

  TextEntityTypeHashtag();

  TextEntityTypeHashtag.fromJson(Map<String, dynamic> json);
}

@reflector
class TextEntityTypeCashtag extends TextEntityType {
  @override
  String get tdType => 'textEntityTypeCashtag';

  @override
  Map<String, dynamic> get params => {};

  TextEntityTypeCashtag();

  TextEntityTypeCashtag.fromJson(Map<String, dynamic> json);
}

@reflector
class TextEntityTypeBotCommand extends TextEntityType {
  @override
  String get tdType => 'textEntityTypeBotCommand';

  @override
  Map<String, dynamic> get params => {};

  TextEntityTypeBotCommand();

  TextEntityTypeBotCommand.fromJson(Map<String, dynamic> json);
}

@reflector
class TextEntityTypeUrl extends TextEntityType {
  @override
  String get tdType => 'textEntityTypeUrl';

  @override
  Map<String, dynamic> get params => {};

  TextEntityTypeUrl();

  TextEntityTypeUrl.fromJson(Map<String, dynamic> json);
}

@reflector
class TextEntityTypeEmailAddress extends TextEntityType {
  @override
  String get tdType => 'textEntityTypeEmailAddress';

  @override
  Map<String, dynamic> get params => {};

  TextEntityTypeEmailAddress();

  TextEntityTypeEmailAddress.fromJson(Map<String, dynamic> json);
}

@reflector
class TextEntityTypePhoneNumber extends TextEntityType {
  @override
  String get tdType => 'textEntityTypePhoneNumber';

  @override
  Map<String, dynamic> get params => {};

  TextEntityTypePhoneNumber();

  TextEntityTypePhoneNumber.fromJson(Map<String, dynamic> json);
}

@reflector
class TextEntityTypeBankCardNumber extends TextEntityType {
  @override
  String get tdType => 'textEntityTypeBankCardNumber';

  @override
  Map<String, dynamic> get params => {};

  TextEntityTypeBankCardNumber();

  TextEntityTypeBankCardNumber.fromJson(Map<String, dynamic> json);
}

@reflector
class TextEntityTypeBold extends TextEntityType {
  @override
  String get tdType => 'textEntityTypeBold';

  @override
  Map<String, dynamic> get params => {};

  TextEntityTypeBold();

  TextEntityTypeBold.fromJson(Map<String, dynamic> json);
}

@reflector
class TextEntityTypeItalic extends TextEntityType {
  @override
  String get tdType => 'textEntityTypeItalic';

  @override
  Map<String, dynamic> get params => {};

  TextEntityTypeItalic();

  TextEntityTypeItalic.fromJson(Map<String, dynamic> json);
}

@reflector
class TextEntityTypeUnderline extends TextEntityType {
  @override
  String get tdType => 'textEntityTypeUnderline';

  @override
  Map<String, dynamic> get params => {};

  TextEntityTypeUnderline();

  TextEntityTypeUnderline.fromJson(Map<String, dynamic> json);
}

@reflector
class TextEntityTypeStrikethrough extends TextEntityType {
  @override
  String get tdType => 'textEntityTypeStrikethrough';

  @override
  Map<String, dynamic> get params => {};

  TextEntityTypeStrikethrough();

  TextEntityTypeStrikethrough.fromJson(Map<String, dynamic> json);
}

@reflector
class TextEntityTypeCode extends TextEntityType {
  @override
  String get tdType => 'textEntityTypeCode';

  @override
  Map<String, dynamic> get params => {};

  TextEntityTypeCode();

  TextEntityTypeCode.fromJson(Map<String, dynamic> json);
}

@reflector
class TextEntityTypePre extends TextEntityType {
  @override
  String get tdType => 'textEntityTypePre';

  @override
  Map<String, dynamic> get params => {};

  TextEntityTypePre();

  TextEntityTypePre.fromJson(Map<String, dynamic> json);
}

@reflector
class TextEntityTypePreCode extends TextEntityType {
  @override
  String get tdType => 'textEntityTypePreCode';

   late String language;

  @override
  Map<String, dynamic> get params => {
    'language': language,
  };

  TextEntityTypePreCode({
  required this.language,
  });

  TextEntityTypePreCode.fromJson(Map<String, dynamic> json) {
    language = tryConvertToTdObject(json['language']);
  }
}

@reflector
class TextEntityTypeTextUrl extends TextEntityType {
  @override
  String get tdType => 'textEntityTypeTextUrl';

   late String url;

  @override
  Map<String, dynamic> get params => {
    'url': url,
  };

  TextEntityTypeTextUrl({
  required this.url,
  });

  TextEntityTypeTextUrl.fromJson(Map<String, dynamic> json) {
    url = tryConvertToTdObject(json['url']);
  }
}

@reflector
class TextEntityTypeMentionName extends TextEntityType {
  @override
  String get tdType => 'textEntityTypeMentionName';

   late int userId;

  @override
  Map<String, dynamic> get params => {
    'user_id': userId,
  };

  TextEntityTypeMentionName({
  required this.userId,
  });

  TextEntityTypeMentionName.fromJson(Map<String, dynamic> json) {
    userId = tryConvertToTdObject(json['user_id']);
  }
}

@reflector
class TextEntityTypeMediaTimestamp extends TextEntityType {
  @override
  String get tdType => 'textEntityTypeMediaTimestamp';

   late int mediaTimestamp;

  @override
  Map<String, dynamic> get params => {
    'media_timestamp': mediaTimestamp,
  };

  TextEntityTypeMediaTimestamp({
  required this.mediaTimestamp,
  });

  TextEntityTypeMediaTimestamp.fromJson(Map<String, dynamic> json) {
    mediaTimestamp = tryConvertToTdObject(json['media_timestamp']);
  }
}

@reflector
class InputThumbnail extends TdObject {
  @override
  String get tdType => 'inputThumbnail';

   late InputFile thumbnail;
   late int width;
   late int height;

  @override
  Map<String, dynamic> get params => {
    'thumbnail': thumbnail,
    'width': width,
    'height': height,
  };

  InputThumbnail({
  required this.thumbnail,
  required this.width,
  required this.height,
  });

  InputThumbnail.fromJson(Map<String, dynamic> json) {
    thumbnail = tryConvertToTdObject(json['thumbnail']);
    width = tryConvertToTdObject(json['width']);
    height = tryConvertToTdObject(json['height']);
  }
}

abstract class MessageSchedulingState extends TdObject {}

@reflector
class MessageSchedulingStateSendAtDate extends MessageSchedulingState {
  @override
  String get tdType => 'messageSchedulingStateSendAtDate';

   late int sendDate;

  @override
  Map<String, dynamic> get params => {
    'send_date': sendDate,
  };

  MessageSchedulingStateSendAtDate({
  required this.sendDate,
  });

  MessageSchedulingStateSendAtDate.fromJson(Map<String, dynamic> json) {
    sendDate = tryConvertToTdObject(json['send_date']);
  }
}

@reflector
class MessageSchedulingStateSendWhenOnline extends MessageSchedulingState {
  @override
  String get tdType => 'messageSchedulingStateSendWhenOnline';

  @override
  Map<String, dynamic> get params => {};

  MessageSchedulingStateSendWhenOnline();

  MessageSchedulingStateSendWhenOnline.fromJson(Map<String, dynamic> json);
}

@reflector
class MessageSendOptions extends TdObject {
  @override
  String get tdType => 'messageSendOptions';

   late bool disableNotification;
   late bool fromBackground;
   late MessageSchedulingState schedulingState;

  @override
  Map<String, dynamic> get params => {
    'disable_notification': disableNotification,
    'from_background': fromBackground,
    'scheduling_state': schedulingState,
  };

  MessageSendOptions({
  required this.disableNotification,
  required this.fromBackground,
  required this.schedulingState,
  });

  MessageSendOptions.fromJson(Map<String, dynamic> json) {
    disableNotification = tryConvertToTdObject(json['disable_notification']);
    fromBackground = tryConvertToTdObject(json['from_background']);
    schedulingState = tryConvertToTdObject(json['scheduling_state']);
  }
}

@reflector
class MessageCopyOptions extends TdObject {
  @override
  String get tdType => 'messageCopyOptions';

   late bool sendCopy;
   late bool replaceCaption;
   late FormattedText newCaption;

  @override
  Map<String, dynamic> get params => {
    'send_copy': sendCopy,
    'replace_caption': replaceCaption,
    'new_caption': newCaption,
  };

  MessageCopyOptions({
  required this.sendCopy,
  required this.replaceCaption,
  required this.newCaption,
  });

  MessageCopyOptions.fromJson(Map<String, dynamic> json) {
    sendCopy = tryConvertToTdObject(json['send_copy']);
    replaceCaption = tryConvertToTdObject(json['replace_caption']);
    newCaption = tryConvertToTdObject(json['new_caption']);
  }
}

abstract class InputMessageContent extends TdObject {}

@reflector
class InputMessageText extends InputMessageContent {
  @override
  String get tdType => 'inputMessageText';

   late FormattedText text;
   late bool disableWebPagePreview;
   late bool clearDraft;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'disable_web_page_preview': disableWebPagePreview,
    'clear_draft': clearDraft,
  };

  InputMessageText({
  required this.text,
  required this.disableWebPagePreview,
  required this.clearDraft,
  });

  InputMessageText.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    disableWebPagePreview = tryConvertToTdObject(json['disable_web_page_preview']);
    clearDraft = tryConvertToTdObject(json['clear_draft']);
  }
}

@reflector
class InputMessageAnimation extends InputMessageContent {
  @override
  String get tdType => 'inputMessageAnimation';

   late InputFile animation;
   late InputThumbnail thumbnail;
   late List<int> addedStickerFileIds;
   late int duration;
   late int width;
   late int height;
   late FormattedText caption;

  @override
  Map<String, dynamic> get params => {
    'animation': animation,
    'thumbnail': thumbnail,
    'added_sticker_file_ids': addedStickerFileIds,
    'duration': duration,
    'width': width,
    'height': height,
    'caption': caption,
  };

  InputMessageAnimation({
  required this.animation,
  required this.thumbnail,
  required this.addedStickerFileIds,
  required this.duration,
  required this.width,
  required this.height,
  required this.caption,
  });

  InputMessageAnimation.fromJson(Map<String, dynamic> json) {
    animation = tryConvertToTdObject(json['animation']);
    thumbnail = tryConvertToTdObject(json['thumbnail']);
    addedStickerFileIds = tryConvertToTdObject(json['added_sticker_file_ids']);
    duration = tryConvertToTdObject(json['duration']);
    width = tryConvertToTdObject(json['width']);
    height = tryConvertToTdObject(json['height']);
    caption = tryConvertToTdObject(json['caption']);
  }
}

@reflector
class InputMessageAudio extends InputMessageContent {
  @override
  String get tdType => 'inputMessageAudio';

   late InputFile audio;
   late InputThumbnail albumCoverThumbnail;
   late int duration;
   late String title;
   late String performer;
   late FormattedText caption;

  @override
  Map<String, dynamic> get params => {
    'audio': audio,
    'album_cover_thumbnail': albumCoverThumbnail,
    'duration': duration,
    'title': title,
    'performer': performer,
    'caption': caption,
  };

  InputMessageAudio({
  required this.audio,
  required this.albumCoverThumbnail,
  required this.duration,
  required this.title,
  required this.performer,
  required this.caption,
  });

  InputMessageAudio.fromJson(Map<String, dynamic> json) {
    audio = tryConvertToTdObject(json['audio']);
    albumCoverThumbnail = tryConvertToTdObject(json['album_cover_thumbnail']);
    duration = tryConvertToTdObject(json['duration']);
    title = tryConvertToTdObject(json['title']);
    performer = tryConvertToTdObject(json['performer']);
    caption = tryConvertToTdObject(json['caption']);
  }
}

@reflector
class InputMessageDocument extends InputMessageContent {
  @override
  String get tdType => 'inputMessageDocument';

   late InputFile document;
   late InputThumbnail thumbnail;
   late bool disableContentTypeDetection;
   late FormattedText caption;

  @override
  Map<String, dynamic> get params => {
    'document': document,
    'thumbnail': thumbnail,
    'disable_content_type_detection': disableContentTypeDetection,
    'caption': caption,
  };

  InputMessageDocument({
  required this.document,
  required this.thumbnail,
  required this.disableContentTypeDetection,
  required this.caption,
  });

  InputMessageDocument.fromJson(Map<String, dynamic> json) {
    document = tryConvertToTdObject(json['document']);
    thumbnail = tryConvertToTdObject(json['thumbnail']);
    disableContentTypeDetection = tryConvertToTdObject(json['disable_content_type_detection']);
    caption = tryConvertToTdObject(json['caption']);
  }
}

@reflector
class InputMessagePhoto extends InputMessageContent {
  @override
  String get tdType => 'inputMessagePhoto';

   late InputFile photo;
   late InputThumbnail thumbnail;
   late List<int> addedStickerFileIds;
   late int width;
   late int height;
   late FormattedText caption;
   late int ttl;

  @override
  Map<String, dynamic> get params => {
    'photo': photo,
    'thumbnail': thumbnail,
    'added_sticker_file_ids': addedStickerFileIds,
    'width': width,
    'height': height,
    'caption': caption,
    'ttl': ttl,
  };

  InputMessagePhoto({
  required this.photo,
  required this.thumbnail,
  required this.addedStickerFileIds,
  required this.width,
  required this.height,
  required this.caption,
  required this.ttl,
  });

  InputMessagePhoto.fromJson(Map<String, dynamic> json) {
    photo = tryConvertToTdObject(json['photo']);
    thumbnail = tryConvertToTdObject(json['thumbnail']);
    addedStickerFileIds = tryConvertToTdObject(json['added_sticker_file_ids']);
    width = tryConvertToTdObject(json['width']);
    height = tryConvertToTdObject(json['height']);
    caption = tryConvertToTdObject(json['caption']);
    ttl = tryConvertToTdObject(json['ttl']);
  }
}

@reflector
class InputMessageSticker extends InputMessageContent {
  @override
  String get tdType => 'inputMessageSticker';

   late InputFile sticker;
   late InputThumbnail thumbnail;
   late int width;
   late int height;
   late String emoji;

  @override
  Map<String, dynamic> get params => {
    'sticker': sticker,
    'thumbnail': thumbnail,
    'width': width,
    'height': height,
    'emoji': emoji,
  };

  InputMessageSticker({
  required this.sticker,
  required this.thumbnail,
  required this.width,
  required this.height,
  required this.emoji,
  });

  InputMessageSticker.fromJson(Map<String, dynamic> json) {
    sticker = tryConvertToTdObject(json['sticker']);
    thumbnail = tryConvertToTdObject(json['thumbnail']);
    width = tryConvertToTdObject(json['width']);
    height = tryConvertToTdObject(json['height']);
    emoji = tryConvertToTdObject(json['emoji']);
  }
}

@reflector
class InputMessageVideo extends InputMessageContent {
  @override
  String get tdType => 'inputMessageVideo';

   late InputFile video;
   late InputThumbnail thumbnail;
   late List<int> addedStickerFileIds;
   late int duration;
   late int width;
   late int height;
   late bool supportsStreaming;
   late FormattedText caption;
   late int ttl;

  @override
  Map<String, dynamic> get params => {
    'video': video,
    'thumbnail': thumbnail,
    'added_sticker_file_ids': addedStickerFileIds,
    'duration': duration,
    'width': width,
    'height': height,
    'supports_streaming': supportsStreaming,
    'caption': caption,
    'ttl': ttl,
  };

  InputMessageVideo({
  required this.video,
  required this.thumbnail,
  required this.addedStickerFileIds,
  required this.duration,
  required this.width,
  required this.height,
  required this.supportsStreaming,
  required this.caption,
  required this.ttl,
  });

  InputMessageVideo.fromJson(Map<String, dynamic> json) {
    video = tryConvertToTdObject(json['video']);
    thumbnail = tryConvertToTdObject(json['thumbnail']);
    addedStickerFileIds = tryConvertToTdObject(json['added_sticker_file_ids']);
    duration = tryConvertToTdObject(json['duration']);
    width = tryConvertToTdObject(json['width']);
    height = tryConvertToTdObject(json['height']);
    supportsStreaming = tryConvertToTdObject(json['supports_streaming']);
    caption = tryConvertToTdObject(json['caption']);
    ttl = tryConvertToTdObject(json['ttl']);
  }
}

@reflector
class InputMessageVideoNote extends InputMessageContent {
  @override
  String get tdType => 'inputMessageVideoNote';

   late InputFile videoNote;
   late InputThumbnail thumbnail;
   late int duration;
   late int length;

  @override
  Map<String, dynamic> get params => {
    'video_note': videoNote,
    'thumbnail': thumbnail,
    'duration': duration,
    'length': length,
  };

  InputMessageVideoNote({
  required this.videoNote,
  required this.thumbnail,
  required this.duration,
  required this.length,
  });

  InputMessageVideoNote.fromJson(Map<String, dynamic> json) {
    videoNote = tryConvertToTdObject(json['video_note']);
    thumbnail = tryConvertToTdObject(json['thumbnail']);
    duration = tryConvertToTdObject(json['duration']);
    length = tryConvertToTdObject(json['length']);
  }
}

@reflector
class InputMessageVoiceNote extends InputMessageContent {
  @override
  String get tdType => 'inputMessageVoiceNote';

   late InputFile voiceNote;
   late int duration;
   late String waveform;
   late FormattedText caption;

  @override
  Map<String, dynamic> get params => {
    'voice_note': voiceNote,
    'duration': duration,
    'waveform': waveform,
    'caption': caption,
  };

  InputMessageVoiceNote({
  required this.voiceNote,
  required this.duration,
  required this.waveform,
  required this.caption,
  });

  InputMessageVoiceNote.fromJson(Map<String, dynamic> json) {
    voiceNote = tryConvertToTdObject(json['voice_note']);
    duration = tryConvertToTdObject(json['duration']);
    waveform = tryConvertToTdObject(json['waveform']);
    caption = tryConvertToTdObject(json['caption']);
  }
}

@reflector
class InputMessageLocation extends InputMessageContent {
  @override
  String get tdType => 'inputMessageLocation';

   late Location location;
   late int livePeriod;
   late int heading;
   late int proximityAlertRadius;

  @override
  Map<String, dynamic> get params => {
    'location': location,
    'live_period': livePeriod,
    'heading': heading,
    'proximity_alert_radius': proximityAlertRadius,
  };

  InputMessageLocation({
  required this.location,
  required this.livePeriod,
  required this.heading,
  required this.proximityAlertRadius,
  });

  InputMessageLocation.fromJson(Map<String, dynamic> json) {
    location = tryConvertToTdObject(json['location']);
    livePeriod = tryConvertToTdObject(json['live_period']);
    heading = tryConvertToTdObject(json['heading']);
    proximityAlertRadius = tryConvertToTdObject(json['proximity_alert_radius']);
  }
}

@reflector
class InputMessageVenue extends InputMessageContent {
  @override
  String get tdType => 'inputMessageVenue';

   late Venue venue;

  @override
  Map<String, dynamic> get params => {
    'venue': venue,
  };

  InputMessageVenue({
  required this.venue,
  });

  InputMessageVenue.fromJson(Map<String, dynamic> json) {
    venue = tryConvertToTdObject(json['venue']);
  }
}

@reflector
class InputMessageContact extends InputMessageContent {
  @override
  String get tdType => 'inputMessageContact';

   late Contact contact;

  @override
  Map<String, dynamic> get params => {
    'contact': contact,
  };

  InputMessageContact({
  required this.contact,
  });

  InputMessageContact.fromJson(Map<String, dynamic> json) {
    contact = tryConvertToTdObject(json['contact']);
  }
}

@reflector
class InputMessageDice extends InputMessageContent {
  @override
  String get tdType => 'inputMessageDice';

   late String emoji;
   late bool clearDraft;

  @override
  Map<String, dynamic> get params => {
    'emoji': emoji,
    'clear_draft': clearDraft,
  };

  InputMessageDice({
  required this.emoji,
  required this.clearDraft,
  });

  InputMessageDice.fromJson(Map<String, dynamic> json) {
    emoji = tryConvertToTdObject(json['emoji']);
    clearDraft = tryConvertToTdObject(json['clear_draft']);
  }
}

@reflector
class InputMessageGame extends InputMessageContent {
  @override
  String get tdType => 'inputMessageGame';

   late int botUserId;
   late String gameShortName;

  @override
  Map<String, dynamic> get params => {
    'bot_user_id': botUserId,
    'game_short_name': gameShortName,
  };

  InputMessageGame({
  required this.botUserId,
  required this.gameShortName,
  });

  InputMessageGame.fromJson(Map<String, dynamic> json) {
    botUserId = tryConvertToTdObject(json['bot_user_id']);
    gameShortName = tryConvertToTdObject(json['game_short_name']);
  }
}

@reflector
class InputMessageInvoice extends InputMessageContent {
  @override
  String get tdType => 'inputMessageInvoice';

   late Invoice invoice;
   late String title;
   late String description;
   late String photoUrl;
   late int photoSize;
   late int photoWidth;
   late int photoHeight;
   late String payload;
   late String providerToken;
   late String providerData;
   late String startParameter;

  @override
  Map<String, dynamic> get params => {
    'invoice': invoice,
    'title': title,
    'description': description,
    'photo_url': photoUrl,
    'photo_size': photoSize,
    'photo_width': photoWidth,
    'photo_height': photoHeight,
    'payload': payload,
    'provider_token': providerToken,
    'provider_data': providerData,
    'start_parameter': startParameter,
  };

  InputMessageInvoice({
  required this.invoice,
  required this.title,
  required this.description,
  required this.photoUrl,
  required this.photoSize,
  required this.photoWidth,
  required this.photoHeight,
  required this.payload,
  required this.providerToken,
  required this.providerData,
  required this.startParameter,
  });

  InputMessageInvoice.fromJson(Map<String, dynamic> json) {
    invoice = tryConvertToTdObject(json['invoice']);
    title = tryConvertToTdObject(json['title']);
    description = tryConvertToTdObject(json['description']);
    photoUrl = tryConvertToTdObject(json['photo_url']);
    photoSize = tryConvertToTdObject(json['photo_size']);
    photoWidth = tryConvertToTdObject(json['photo_width']);
    photoHeight = tryConvertToTdObject(json['photo_height']);
    payload = tryConvertToTdObject(json['payload']);
    providerToken = tryConvertToTdObject(json['provider_token']);
    providerData = tryConvertToTdObject(json['provider_data']);
    startParameter = tryConvertToTdObject(json['start_parameter']);
  }
}

@reflector
class InputMessagePoll extends InputMessageContent {
  @override
  String get tdType => 'inputMessagePoll';

   late String question;
   late List<String> options;
   late bool isAnonymous;
   late PollType type;
   late int openPeriod;
   late int closeDate;
   late bool isClosed;

  @override
  Map<String, dynamic> get params => {
    'question': question,
    'options': options,
    'is_anonymous': isAnonymous,
    'type': type,
    'open_period': openPeriod,
    'close_date': closeDate,
    'is_closed': isClosed,
  };

  InputMessagePoll({
  required this.question,
  required this.options,
  required this.isAnonymous,
  required this.type,
  required this.openPeriod,
  required this.closeDate,
  required this.isClosed,
  });

  InputMessagePoll.fromJson(Map<String, dynamic> json) {
    question = tryConvertToTdObject(json['question']);
    options = tryConvertToTdObject(json['options']);
    isAnonymous = tryConvertToTdObject(json['is_anonymous']);
    type = tryConvertToTdObject(json['type']);
    openPeriod = tryConvertToTdObject(json['open_period']);
    closeDate = tryConvertToTdObject(json['close_date']);
    isClosed = tryConvertToTdObject(json['is_closed']);
  }
}

@reflector
class InputMessageForwarded extends InputMessageContent {
  @override
  String get tdType => 'inputMessageForwarded';

   late int fromChatId;
   late int messageId;
   late bool inGameShare;
   late MessageCopyOptions copyOptions;

  @override
  Map<String, dynamic> get params => {
    'from_chat_id': fromChatId,
    'message_id': messageId,
    'in_game_share': inGameShare,
    'copy_options': copyOptions,
  };

  InputMessageForwarded({
  required this.fromChatId,
  required this.messageId,
  required this.inGameShare,
  required this.copyOptions,
  });

  InputMessageForwarded.fromJson(Map<String, dynamic> json) {
    fromChatId = tryConvertToTdObject(json['from_chat_id']);
    messageId = tryConvertToTdObject(json['message_id']);
    inGameShare = tryConvertToTdObject(json['in_game_share']);
    copyOptions = tryConvertToTdObject(json['copy_options']);
  }
}

abstract class SearchMessagesFilter extends TdObject {}

@reflector
class SearchMessagesFilterEmpty extends SearchMessagesFilter {
  @override
  String get tdType => 'searchMessagesFilterEmpty';

  @override
  Map<String, dynamic> get params => {};

  SearchMessagesFilterEmpty();

  SearchMessagesFilterEmpty.fromJson(Map<String, dynamic> json);
}

@reflector
class SearchMessagesFilterAnimation extends SearchMessagesFilter {
  @override
  String get tdType => 'searchMessagesFilterAnimation';

  @override
  Map<String, dynamic> get params => {};

  SearchMessagesFilterAnimation();

  SearchMessagesFilterAnimation.fromJson(Map<String, dynamic> json);
}

@reflector
class SearchMessagesFilterAudio extends SearchMessagesFilter {
  @override
  String get tdType => 'searchMessagesFilterAudio';

  @override
  Map<String, dynamic> get params => {};

  SearchMessagesFilterAudio();

  SearchMessagesFilterAudio.fromJson(Map<String, dynamic> json);
}

@reflector
class SearchMessagesFilterDocument extends SearchMessagesFilter {
  @override
  String get tdType => 'searchMessagesFilterDocument';

  @override
  Map<String, dynamic> get params => {};

  SearchMessagesFilterDocument();

  SearchMessagesFilterDocument.fromJson(Map<String, dynamic> json);
}

@reflector
class SearchMessagesFilterPhoto extends SearchMessagesFilter {
  @override
  String get tdType => 'searchMessagesFilterPhoto';

  @override
  Map<String, dynamic> get params => {};

  SearchMessagesFilterPhoto();

  SearchMessagesFilterPhoto.fromJson(Map<String, dynamic> json);
}

@reflector
class SearchMessagesFilterVideo extends SearchMessagesFilter {
  @override
  String get tdType => 'searchMessagesFilterVideo';

  @override
  Map<String, dynamic> get params => {};

  SearchMessagesFilterVideo();

  SearchMessagesFilterVideo.fromJson(Map<String, dynamic> json);
}

@reflector
class SearchMessagesFilterVoiceNote extends SearchMessagesFilter {
  @override
  String get tdType => 'searchMessagesFilterVoiceNote';

  @override
  Map<String, dynamic> get params => {};

  SearchMessagesFilterVoiceNote();

  SearchMessagesFilterVoiceNote.fromJson(Map<String, dynamic> json);
}

@reflector
class SearchMessagesFilterPhotoAndVideo extends SearchMessagesFilter {
  @override
  String get tdType => 'searchMessagesFilterPhotoAndVideo';

  @override
  Map<String, dynamic> get params => {};

  SearchMessagesFilterPhotoAndVideo();

  SearchMessagesFilterPhotoAndVideo.fromJson(Map<String, dynamic> json);
}

@reflector
class SearchMessagesFilterUrl extends SearchMessagesFilter {
  @override
  String get tdType => 'searchMessagesFilterUrl';

  @override
  Map<String, dynamic> get params => {};

  SearchMessagesFilterUrl();

  SearchMessagesFilterUrl.fromJson(Map<String, dynamic> json);
}

@reflector
class SearchMessagesFilterChatPhoto extends SearchMessagesFilter {
  @override
  String get tdType => 'searchMessagesFilterChatPhoto';

  @override
  Map<String, dynamic> get params => {};

  SearchMessagesFilterChatPhoto();

  SearchMessagesFilterChatPhoto.fromJson(Map<String, dynamic> json);
}

@reflector
class SearchMessagesFilterCall extends SearchMessagesFilter {
  @override
  String get tdType => 'searchMessagesFilterCall';

  @override
  Map<String, dynamic> get params => {};

  SearchMessagesFilterCall();

  SearchMessagesFilterCall.fromJson(Map<String, dynamic> json);
}

@reflector
class SearchMessagesFilterMissedCall extends SearchMessagesFilter {
  @override
  String get tdType => 'searchMessagesFilterMissedCall';

  @override
  Map<String, dynamic> get params => {};

  SearchMessagesFilterMissedCall();

  SearchMessagesFilterMissedCall.fromJson(Map<String, dynamic> json);
}

@reflector
class SearchMessagesFilterVideoNote extends SearchMessagesFilter {
  @override
  String get tdType => 'searchMessagesFilterVideoNote';

  @override
  Map<String, dynamic> get params => {};

  SearchMessagesFilterVideoNote();

  SearchMessagesFilterVideoNote.fromJson(Map<String, dynamic> json);
}

@reflector
class SearchMessagesFilterVoiceAndVideoNote extends SearchMessagesFilter {
  @override
  String get tdType => 'searchMessagesFilterVoiceAndVideoNote';

  @override
  Map<String, dynamic> get params => {};

  SearchMessagesFilterVoiceAndVideoNote();

  SearchMessagesFilterVoiceAndVideoNote.fromJson(Map<String, dynamic> json);
}

@reflector
class SearchMessagesFilterMention extends SearchMessagesFilter {
  @override
  String get tdType => 'searchMessagesFilterMention';

  @override
  Map<String, dynamic> get params => {};

  SearchMessagesFilterMention();

  SearchMessagesFilterMention.fromJson(Map<String, dynamic> json);
}

@reflector
class SearchMessagesFilterUnreadMention extends SearchMessagesFilter {
  @override
  String get tdType => 'searchMessagesFilterUnreadMention';

  @override
  Map<String, dynamic> get params => {};

  SearchMessagesFilterUnreadMention();

  SearchMessagesFilterUnreadMention.fromJson(Map<String, dynamic> json);
}

@reflector
class SearchMessagesFilterFailedToSend extends SearchMessagesFilter {
  @override
  String get tdType => 'searchMessagesFilterFailedToSend';

  @override
  Map<String, dynamic> get params => {};

  SearchMessagesFilterFailedToSend();

  SearchMessagesFilterFailedToSend.fromJson(Map<String, dynamic> json);
}

@reflector
class SearchMessagesFilterPinned extends SearchMessagesFilter {
  @override
  String get tdType => 'searchMessagesFilterPinned';

  @override
  Map<String, dynamic> get params => {};

  SearchMessagesFilterPinned();

  SearchMessagesFilterPinned.fromJson(Map<String, dynamic> json);
}

abstract class ChatAction extends TdObject {}

@reflector
class ChatActionTyping extends ChatAction {
  @override
  String get tdType => 'chatActionTyping';

  @override
  Map<String, dynamic> get params => {};

  ChatActionTyping();

  ChatActionTyping.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatActionRecordingVideo extends ChatAction {
  @override
  String get tdType => 'chatActionRecordingVideo';

  @override
  Map<String, dynamic> get params => {};

  ChatActionRecordingVideo();

  ChatActionRecordingVideo.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatActionUploadingVideo extends ChatAction {
  @override
  String get tdType => 'chatActionUploadingVideo';

   late int progress;

  @override
  Map<String, dynamic> get params => {
    'progress': progress,
  };

  ChatActionUploadingVideo({
  required this.progress,
  });

  ChatActionUploadingVideo.fromJson(Map<String, dynamic> json) {
    progress = tryConvertToTdObject(json['progress']);
  }
}

@reflector
class ChatActionRecordingVoiceNote extends ChatAction {
  @override
  String get tdType => 'chatActionRecordingVoiceNote';

  @override
  Map<String, dynamic> get params => {};

  ChatActionRecordingVoiceNote();

  ChatActionRecordingVoiceNote.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatActionUploadingVoiceNote extends ChatAction {
  @override
  String get tdType => 'chatActionUploadingVoiceNote';

   late int progress;

  @override
  Map<String, dynamic> get params => {
    'progress': progress,
  };

  ChatActionUploadingVoiceNote({
  required this.progress,
  });

  ChatActionUploadingVoiceNote.fromJson(Map<String, dynamic> json) {
    progress = tryConvertToTdObject(json['progress']);
  }
}

@reflector
class ChatActionUploadingPhoto extends ChatAction {
  @override
  String get tdType => 'chatActionUploadingPhoto';

   late int progress;

  @override
  Map<String, dynamic> get params => {
    'progress': progress,
  };

  ChatActionUploadingPhoto({
  required this.progress,
  });

  ChatActionUploadingPhoto.fromJson(Map<String, dynamic> json) {
    progress = tryConvertToTdObject(json['progress']);
  }
}

@reflector
class ChatActionUploadingDocument extends ChatAction {
  @override
  String get tdType => 'chatActionUploadingDocument';

   late int progress;

  @override
  Map<String, dynamic> get params => {
    'progress': progress,
  };

  ChatActionUploadingDocument({
  required this.progress,
  });

  ChatActionUploadingDocument.fromJson(Map<String, dynamic> json) {
    progress = tryConvertToTdObject(json['progress']);
  }
}

@reflector
class ChatActionChoosingSticker extends ChatAction {
  @override
  String get tdType => 'chatActionChoosingSticker';

  @override
  Map<String, dynamic> get params => {};

  ChatActionChoosingSticker();

  ChatActionChoosingSticker.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatActionChoosingLocation extends ChatAction {
  @override
  String get tdType => 'chatActionChoosingLocation';

  @override
  Map<String, dynamic> get params => {};

  ChatActionChoosingLocation();

  ChatActionChoosingLocation.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatActionChoosingContact extends ChatAction {
  @override
  String get tdType => 'chatActionChoosingContact';

  @override
  Map<String, dynamic> get params => {};

  ChatActionChoosingContact();

  ChatActionChoosingContact.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatActionStartPlayingGame extends ChatAction {
  @override
  String get tdType => 'chatActionStartPlayingGame';

  @override
  Map<String, dynamic> get params => {};

  ChatActionStartPlayingGame();

  ChatActionStartPlayingGame.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatActionRecordingVideoNote extends ChatAction {
  @override
  String get tdType => 'chatActionRecordingVideoNote';

  @override
  Map<String, dynamic> get params => {};

  ChatActionRecordingVideoNote();

  ChatActionRecordingVideoNote.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatActionUploadingVideoNote extends ChatAction {
  @override
  String get tdType => 'chatActionUploadingVideoNote';

   late int progress;

  @override
  Map<String, dynamic> get params => {
    'progress': progress,
  };

  ChatActionUploadingVideoNote({
  required this.progress,
  });

  ChatActionUploadingVideoNote.fromJson(Map<String, dynamic> json) {
    progress = tryConvertToTdObject(json['progress']);
  }
}

@reflector
class ChatActionWatchingAnimations extends ChatAction {
  @override
  String get tdType => 'chatActionWatchingAnimations';

   late String emoji;

  @override
  Map<String, dynamic> get params => {
    'emoji': emoji,
  };

  ChatActionWatchingAnimations({
  required this.emoji,
  });

  ChatActionWatchingAnimations.fromJson(Map<String, dynamic> json) {
    emoji = tryConvertToTdObject(json['emoji']);
  }
}

@reflector
class ChatActionCancel extends ChatAction {
  @override
  String get tdType => 'chatActionCancel';

  @override
  Map<String, dynamic> get params => {};

  ChatActionCancel();

  ChatActionCancel.fromJson(Map<String, dynamic> json);
}

abstract class UserStatus extends TdObject {}

@reflector
class UserStatusEmpty extends UserStatus {
  @override
  String get tdType => 'userStatusEmpty';

  @override
  Map<String, dynamic> get params => {};

  UserStatusEmpty();

  UserStatusEmpty.fromJson(Map<String, dynamic> json);
}

@reflector
class UserStatusOnline extends UserStatus {
  @override
  String get tdType => 'userStatusOnline';

   late int expires;

  @override
  Map<String, dynamic> get params => {
    'expires': expires,
  };

  UserStatusOnline({
  required this.expires,
  });

  UserStatusOnline.fromJson(Map<String, dynamic> json) {
    expires = tryConvertToTdObject(json['expires']);
  }
}

@reflector
class UserStatusOffline extends UserStatus {
  @override
  String get tdType => 'userStatusOffline';

   late int wasOnline;

  @override
  Map<String, dynamic> get params => {
    'was_online': wasOnline,
  };

  UserStatusOffline({
  required this.wasOnline,
  });

  UserStatusOffline.fromJson(Map<String, dynamic> json) {
    wasOnline = tryConvertToTdObject(json['was_online']);
  }
}

@reflector
class UserStatusRecently extends UserStatus {
  @override
  String get tdType => 'userStatusRecently';

  @override
  Map<String, dynamic> get params => {};

  UserStatusRecently();

  UserStatusRecently.fromJson(Map<String, dynamic> json);
}

@reflector
class UserStatusLastWeek extends UserStatus {
  @override
  String get tdType => 'userStatusLastWeek';

  @override
  Map<String, dynamic> get params => {};

  UserStatusLastWeek();

  UserStatusLastWeek.fromJson(Map<String, dynamic> json);
}

@reflector
class UserStatusLastMonth extends UserStatus {
  @override
  String get tdType => 'userStatusLastMonth';

  @override
  Map<String, dynamic> get params => {};

  UserStatusLastMonth();

  UserStatusLastMonth.fromJson(Map<String, dynamic> json);
}

@reflector
class Stickers extends TdObject {
  @override
  String get tdType => 'stickers';

   late List<Sticker> stickers;

  @override
  Map<String, dynamic> get params => {
    'stickers': stickers,
  };

  Stickers({
  required this.stickers,
  });

  Stickers.fromJson(Map<String, dynamic> json) {
    stickers = tryConvertToTdObject(json['stickers']);
  }
}

@reflector
class Emojis extends TdObject {
  @override
  String get tdType => 'emojis';

   late List<String> emojis;

  @override
  Map<String, dynamic> get params => {
    'emojis': emojis,
  };

  Emojis({
  required this.emojis,
  });

  Emojis.fromJson(Map<String, dynamic> json) {
    emojis = tryConvertToTdObject(json['emojis']);
  }
}

@reflector
class StickerSet extends TdObject {
  @override
  String get tdType => 'stickerSet';

   late int id;
   late String title;
   late String name;
   late Thumbnail thumbnail;
   late List<ClosedVectorPath> thumbnailOutline;
   late bool isInstalled;
   late bool isArchived;
   late bool isOfficial;
   late bool isAnimated;
   late bool isMasks;
   late bool isViewed;
   late List<Sticker> stickers;
   late List<Emojis> emojis;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'title': title,
    'name': name,
    'thumbnail': thumbnail,
    'thumbnail_outline': thumbnailOutline,
    'is_installed': isInstalled,
    'is_archived': isArchived,
    'is_official': isOfficial,
    'is_animated': isAnimated,
    'is_masks': isMasks,
    'is_viewed': isViewed,
    'stickers': stickers,
    'emojis': emojis,
  };

  StickerSet({
  required this.id,
  required this.title,
  required this.name,
  required this.thumbnail,
  required this.thumbnailOutline,
  required this.isInstalled,
  required this.isArchived,
  required this.isOfficial,
  required this.isAnimated,
  required this.isMasks,
  required this.isViewed,
  required this.stickers,
  required this.emojis,
  });

  StickerSet.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    title = tryConvertToTdObject(json['title']);
    name = tryConvertToTdObject(json['name']);
    thumbnail = tryConvertToTdObject(json['thumbnail']);
    thumbnailOutline = tryConvertToTdObject(json['thumbnail_outline']);
    isInstalled = tryConvertToTdObject(json['is_installed']);
    isArchived = tryConvertToTdObject(json['is_archived']);
    isOfficial = tryConvertToTdObject(json['is_official']);
    isAnimated = tryConvertToTdObject(json['is_animated']);
    isMasks = tryConvertToTdObject(json['is_masks']);
    isViewed = tryConvertToTdObject(json['is_viewed']);
    stickers = tryConvertToTdObject(json['stickers']);
    emojis = tryConvertToTdObject(json['emojis']);
  }
}

@reflector
class StickerSetInfo extends TdObject {
  @override
  String get tdType => 'stickerSetInfo';

   late int id;
   late String title;
   late String name;
   late Thumbnail thumbnail;
   late List<ClosedVectorPath> thumbnailOutline;
   late bool isInstalled;
   late bool isArchived;
   late bool isOfficial;
   late bool isAnimated;
   late bool isMasks;
   late bool isViewed;
   late int size;
   late List<Sticker> covers;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'title': title,
    'name': name,
    'thumbnail': thumbnail,
    'thumbnail_outline': thumbnailOutline,
    'is_installed': isInstalled,
    'is_archived': isArchived,
    'is_official': isOfficial,
    'is_animated': isAnimated,
    'is_masks': isMasks,
    'is_viewed': isViewed,
    'size': size,
    'covers': covers,
  };

  StickerSetInfo({
  required this.id,
  required this.title,
  required this.name,
  required this.thumbnail,
  required this.thumbnailOutline,
  required this.isInstalled,
  required this.isArchived,
  required this.isOfficial,
  required this.isAnimated,
  required this.isMasks,
  required this.isViewed,
  required this.size,
  required this.covers,
  });

  StickerSetInfo.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    title = tryConvertToTdObject(json['title']);
    name = tryConvertToTdObject(json['name']);
    thumbnail = tryConvertToTdObject(json['thumbnail']);
    thumbnailOutline = tryConvertToTdObject(json['thumbnail_outline']);
    isInstalled = tryConvertToTdObject(json['is_installed']);
    isArchived = tryConvertToTdObject(json['is_archived']);
    isOfficial = tryConvertToTdObject(json['is_official']);
    isAnimated = tryConvertToTdObject(json['is_animated']);
    isMasks = tryConvertToTdObject(json['is_masks']);
    isViewed = tryConvertToTdObject(json['is_viewed']);
    size = tryConvertToTdObject(json['size']);
    covers = tryConvertToTdObject(json['covers']);
  }
}

@reflector
class StickerSets extends TdObject {
  @override
  String get tdType => 'stickerSets';

   late int totalCount;
   late List<StickerSetInfo> sets;

  @override
  Map<String, dynamic> get params => {
    'total_count': totalCount,
    'sets': sets,
  };

  StickerSets({
  required this.totalCount,
  required this.sets,
  });

  StickerSets.fromJson(Map<String, dynamic> json) {
    totalCount = tryConvertToTdObject(json['total_count']);
    sets = tryConvertToTdObject(json['sets']);
  }
}

abstract class CallDiscardReason extends TdObject {}

@reflector
class CallDiscardReasonEmpty extends CallDiscardReason {
  @override
  String get tdType => 'callDiscardReasonEmpty';

  @override
  Map<String, dynamic> get params => {};

  CallDiscardReasonEmpty();

  CallDiscardReasonEmpty.fromJson(Map<String, dynamic> json);
}

@reflector
class CallDiscardReasonMissed extends CallDiscardReason {
  @override
  String get tdType => 'callDiscardReasonMissed';

  @override
  Map<String, dynamic> get params => {};

  CallDiscardReasonMissed();

  CallDiscardReasonMissed.fromJson(Map<String, dynamic> json);
}

@reflector
class CallDiscardReasonDeclined extends CallDiscardReason {
  @override
  String get tdType => 'callDiscardReasonDeclined';

  @override
  Map<String, dynamic> get params => {};

  CallDiscardReasonDeclined();

  CallDiscardReasonDeclined.fromJson(Map<String, dynamic> json);
}

@reflector
class CallDiscardReasonDisconnected extends CallDiscardReason {
  @override
  String get tdType => 'callDiscardReasonDisconnected';

  @override
  Map<String, dynamic> get params => {};

  CallDiscardReasonDisconnected();

  CallDiscardReasonDisconnected.fromJson(Map<String, dynamic> json);
}

@reflector
class CallDiscardReasonHungUp extends CallDiscardReason {
  @override
  String get tdType => 'callDiscardReasonHungUp';

  @override
  Map<String, dynamic> get params => {};

  CallDiscardReasonHungUp();

  CallDiscardReasonHungUp.fromJson(Map<String, dynamic> json);
}

@reflector
class CallProtocol extends TdObject {
  @override
  String get tdType => 'callProtocol';

   late bool udpP2p;
   late bool udpReflector;
   late int minLayer;
   late int maxLayer;
   late List<String> libraryVersions;

  @override
  Map<String, dynamic> get params => {
    'udp_p2p': udpP2p,
    'udp_reflector': udpReflector,
    'min_layer': minLayer,
    'max_layer': maxLayer,
    'library_versions': libraryVersions,
  };

  CallProtocol({
  required this.udpP2p,
  required this.udpReflector,
  required this.minLayer,
  required this.maxLayer,
  required this.libraryVersions,
  });

  CallProtocol.fromJson(Map<String, dynamic> json) {
    udpP2p = tryConvertToTdObject(json['udp_p2p']);
    udpReflector = tryConvertToTdObject(json['udp_reflector']);
    minLayer = tryConvertToTdObject(json['min_layer']);
    maxLayer = tryConvertToTdObject(json['max_layer']);
    libraryVersions = tryConvertToTdObject(json['library_versions']);
  }
}

abstract class CallServerType extends TdObject {}

@reflector
class CallServerTypeTelegramReflector extends CallServerType {
  @override
  String get tdType => 'callServerTypeTelegramReflector';

   late String peerTag;

  @override
  Map<String, dynamic> get params => {
    'peer_tag': peerTag,
  };

  CallServerTypeTelegramReflector({
  required this.peerTag,
  });

  CallServerTypeTelegramReflector.fromJson(Map<String, dynamic> json) {
    peerTag = tryConvertToTdObject(json['peer_tag']);
  }
}

@reflector
class CallServerTypeWebrtc extends CallServerType {
  @override
  String get tdType => 'callServerTypeWebrtc';

   late String username;
   late String password;
   late bool supportsTurn;
   late bool supportsStun;

  @override
  Map<String, dynamic> get params => {
    'username': username,
    'password': password,
    'supports_turn': supportsTurn,
    'supports_stun': supportsStun,
  };

  CallServerTypeWebrtc({
  required this.username,
  required this.password,
  required this.supportsTurn,
  required this.supportsStun,
  });

  CallServerTypeWebrtc.fromJson(Map<String, dynamic> json) {
    username = tryConvertToTdObject(json['username']);
    password = tryConvertToTdObject(json['password']);
    supportsTurn = tryConvertToTdObject(json['supports_turn']);
    supportsStun = tryConvertToTdObject(json['supports_stun']);
  }
}

@reflector
class CallServer extends TdObject {
  @override
  String get tdType => 'callServer';

   late int id;
   late String ipAddress;
   late String ipv6Address;
   late int port;
   late CallServerType type;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'ip_address': ipAddress,
    'ipv6_address': ipv6Address,
    'port': port,
    'type': type,
  };

  CallServer({
  required this.id,
  required this.ipAddress,
  required this.ipv6Address,
  required this.port,
  required this.type,
  });

  CallServer.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    ipAddress = tryConvertToTdObject(json['ip_address']);
    ipv6Address = tryConvertToTdObject(json['ipv6_address']);
    port = tryConvertToTdObject(json['port']);
    type = tryConvertToTdObject(json['type']);
  }
}

@reflector
class CallId extends TdObject {
  @override
  String get tdType => 'callId';

   late int id;

  @override
  Map<String, dynamic> get params => {
    'id': id,
  };

  CallId({
  required this.id,
  });

  CallId.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
  }
}

@reflector
class GroupCallId extends TdObject {
  @override
  String get tdType => 'groupCallId';

   late int id;

  @override
  Map<String, dynamic> get params => {
    'id': id,
  };

  GroupCallId({
  required this.id,
  });

  GroupCallId.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
  }
}

abstract class CallState extends TdObject {}

@reflector
class CallStatePending extends CallState {
  @override
  String get tdType => 'callStatePending';

   late bool isCreated;
   late bool isReceived;

  @override
  Map<String, dynamic> get params => {
    'is_created': isCreated,
    'is_received': isReceived,
  };

  CallStatePending({
  required this.isCreated,
  required this.isReceived,
  });

  CallStatePending.fromJson(Map<String, dynamic> json) {
    isCreated = tryConvertToTdObject(json['is_created']);
    isReceived = tryConvertToTdObject(json['is_received']);
  }
}

@reflector
class CallStateExchangingKeys extends CallState {
  @override
  String get tdType => 'callStateExchangingKeys';

  @override
  Map<String, dynamic> get params => {};

  CallStateExchangingKeys();

  CallStateExchangingKeys.fromJson(Map<String, dynamic> json);
}

@reflector
class CallStateReady extends CallState {
  @override
  String get tdType => 'callStateReady';

   late CallProtocol protocol;
   late List<CallServer> servers;
   late String config;
   late String encryptionKey;
   late List<String> emojis;
   late bool allowP2p;

  @override
  Map<String, dynamic> get params => {
    'protocol': protocol,
    'servers': servers,
    'config': config,
    'encryption_key': encryptionKey,
    'emojis': emojis,
    'allow_p2p': allowP2p,
  };

  CallStateReady({
  required this.protocol,
  required this.servers,
  required this.config,
  required this.encryptionKey,
  required this.emojis,
  required this.allowP2p,
  });

  CallStateReady.fromJson(Map<String, dynamic> json) {
    protocol = tryConvertToTdObject(json['protocol']);
    servers = tryConvertToTdObject(json['servers']);
    config = tryConvertToTdObject(json['config']);
    encryptionKey = tryConvertToTdObject(json['encryption_key']);
    emojis = tryConvertToTdObject(json['emojis']);
    allowP2p = tryConvertToTdObject(json['allow_p2p']);
  }
}

@reflector
class CallStateHangingUp extends CallState {
  @override
  String get tdType => 'callStateHangingUp';

  @override
  Map<String, dynamic> get params => {};

  CallStateHangingUp();

  CallStateHangingUp.fromJson(Map<String, dynamic> json);
}

@reflector
class CallStateDiscarded extends CallState {
  @override
  String get tdType => 'callStateDiscarded';

   late CallDiscardReason reason;
   late bool needRating;
   late bool needDebugInformation;

  @override
  Map<String, dynamic> get params => {
    'reason': reason,
    'need_rating': needRating,
    'need_debug_information': needDebugInformation,
  };

  CallStateDiscarded({
  required this.reason,
  required this.needRating,
  required this.needDebugInformation,
  });

  CallStateDiscarded.fromJson(Map<String, dynamic> json) {
    reason = tryConvertToTdObject(json['reason']);
    needRating = tryConvertToTdObject(json['need_rating']);
    needDebugInformation = tryConvertToTdObject(json['need_debug_information']);
  }
}

@reflector
class CallStateError extends CallState {
  @override
  String get tdType => 'callStateError';

   late Error error;

  @override
  Map<String, dynamic> get params => {
    'error': error,
  };

  CallStateError({
  required this.error,
  });

  CallStateError.fromJson(Map<String, dynamic> json) {
    error = tryConvertToTdObject(json['error']);
  }
}

abstract class GroupCallVideoQuality extends TdObject {}

@reflector
class GroupCallVideoQualityThumbnail extends GroupCallVideoQuality {
  @override
  String get tdType => 'groupCallVideoQualityThumbnail';

  @override
  Map<String, dynamic> get params => {};

  GroupCallVideoQualityThumbnail();

  GroupCallVideoQualityThumbnail.fromJson(Map<String, dynamic> json);
}

@reflector
class GroupCallVideoQualityMedium extends GroupCallVideoQuality {
  @override
  String get tdType => 'groupCallVideoQualityMedium';

  @override
  Map<String, dynamic> get params => {};

  GroupCallVideoQualityMedium();

  GroupCallVideoQualityMedium.fromJson(Map<String, dynamic> json);
}

@reflector
class GroupCallVideoQualityFull extends GroupCallVideoQuality {
  @override
  String get tdType => 'groupCallVideoQualityFull';

  @override
  Map<String, dynamic> get params => {};

  GroupCallVideoQualityFull();

  GroupCallVideoQualityFull.fromJson(Map<String, dynamic> json);
}

@reflector
class GroupCallRecentSpeaker extends TdObject {
  @override
  String get tdType => 'groupCallRecentSpeaker';

   late MessageSender participantId;
   late bool isSpeaking;

  @override
  Map<String, dynamic> get params => {
    'participant_id': participantId,
    'is_speaking': isSpeaking,
  };

  GroupCallRecentSpeaker({
  required this.participantId,
  required this.isSpeaking,
  });

  GroupCallRecentSpeaker.fromJson(Map<String, dynamic> json) {
    participantId = tryConvertToTdObject(json['participant_id']);
    isSpeaking = tryConvertToTdObject(json['is_speaking']);
  }
}

@reflector
class GroupCall extends TdObject {
  @override
  String get tdType => 'groupCall';

   late int id;
   late String title;
   late int scheduledStartDate;
   late bool enabledStartNotification;
   late bool isActive;
   late bool isJoined;
   late bool needRejoin;
   late bool canBeManaged;
   late int participantCount;
   late bool loadedAllParticipants;
   late List<GroupCallRecentSpeaker> recentSpeakers;
   late bool isMyVideoEnabled;
   late bool isMyVideoPaused;
   late bool canEnableVideo;
   late bool muteNewParticipants;
   late bool canToggleMuteNewParticipants;
   late int recordDuration;
   late bool isVideoRecorded;
   late int duration;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'title': title,
    'scheduled_start_date': scheduledStartDate,
    'enabled_start_notification': enabledStartNotification,
    'is_active': isActive,
    'is_joined': isJoined,
    'need_rejoin': needRejoin,
    'can_be_managed': canBeManaged,
    'participant_count': participantCount,
    'loaded_all_participants': loadedAllParticipants,
    'recent_speakers': recentSpeakers,
    'is_my_video_enabled': isMyVideoEnabled,
    'is_my_video_paused': isMyVideoPaused,
    'can_enable_video': canEnableVideo,
    'mute_new_participants': muteNewParticipants,
    'can_toggle_mute_new_participants': canToggleMuteNewParticipants,
    'record_duration': recordDuration,
    'is_video_recorded': isVideoRecorded,
    'duration': duration,
  };

  GroupCall({
  required this.id,
  required this.title,
  required this.scheduledStartDate,
  required this.enabledStartNotification,
  required this.isActive,
  required this.isJoined,
  required this.needRejoin,
  required this.canBeManaged,
  required this.participantCount,
  required this.loadedAllParticipants,
  required this.recentSpeakers,
  required this.isMyVideoEnabled,
  required this.isMyVideoPaused,
  required this.canEnableVideo,
  required this.muteNewParticipants,
  required this.canToggleMuteNewParticipants,
  required this.recordDuration,
  required this.isVideoRecorded,
  required this.duration,
  });

  GroupCall.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    title = tryConvertToTdObject(json['title']);
    scheduledStartDate = tryConvertToTdObject(json['scheduled_start_date']);
    enabledStartNotification = tryConvertToTdObject(json['enabled_start_notification']);
    isActive = tryConvertToTdObject(json['is_active']);
    isJoined = tryConvertToTdObject(json['is_joined']);
    needRejoin = tryConvertToTdObject(json['need_rejoin']);
    canBeManaged = tryConvertToTdObject(json['can_be_managed']);
    participantCount = tryConvertToTdObject(json['participant_count']);
    loadedAllParticipants = tryConvertToTdObject(json['loaded_all_participants']);
    recentSpeakers = tryConvertToTdObject(json['recent_speakers']);
    isMyVideoEnabled = tryConvertToTdObject(json['is_my_video_enabled']);
    isMyVideoPaused = tryConvertToTdObject(json['is_my_video_paused']);
    canEnableVideo = tryConvertToTdObject(json['can_enable_video']);
    muteNewParticipants = tryConvertToTdObject(json['mute_new_participants']);
    canToggleMuteNewParticipants = tryConvertToTdObject(json['can_toggle_mute_new_participants']);
    recordDuration = tryConvertToTdObject(json['record_duration']);
    isVideoRecorded = tryConvertToTdObject(json['is_video_recorded']);
    duration = tryConvertToTdObject(json['duration']);
  }
}

@reflector
class GroupCallVideoSourceGroup extends TdObject {
  @override
  String get tdType => 'groupCallVideoSourceGroup';

   late String semantics;
   late List<int> sourceIds;

  @override
  Map<String, dynamic> get params => {
    'semantics': semantics,
    'source_ids': sourceIds,
  };

  GroupCallVideoSourceGroup({
  required this.semantics,
  required this.sourceIds,
  });

  GroupCallVideoSourceGroup.fromJson(Map<String, dynamic> json) {
    semantics = tryConvertToTdObject(json['semantics']);
    sourceIds = tryConvertToTdObject(json['source_ids']);
  }
}

@reflector
class GroupCallParticipantVideoInfo extends TdObject {
  @override
  String get tdType => 'groupCallParticipantVideoInfo';

   late List<GroupCallVideoSourceGroup> sourceGroups;
   late String endpointId;
   late bool isPaused;

  @override
  Map<String, dynamic> get params => {
    'source_groups': sourceGroups,
    'endpoint_id': endpointId,
    'is_paused': isPaused,
  };

  GroupCallParticipantVideoInfo({
  required this.sourceGroups,
  required this.endpointId,
  required this.isPaused,
  });

  GroupCallParticipantVideoInfo.fromJson(Map<String, dynamic> json) {
    sourceGroups = tryConvertToTdObject(json['source_groups']);
    endpointId = tryConvertToTdObject(json['endpoint_id']);
    isPaused = tryConvertToTdObject(json['is_paused']);
  }
}

@reflector
class GroupCallParticipant extends TdObject {
  @override
  String get tdType => 'groupCallParticipant';

   late MessageSender participantId;
   late int audioSourceId;
   late int screenSharingAudioSourceId;
   late GroupCallParticipantVideoInfo videoInfo;
   late GroupCallParticipantVideoInfo screenSharingVideoInfo;
   late String bio;
   late bool isCurrentUser;
   late bool isSpeaking;
   late bool isHandRaised;
   late bool canBeMutedForAllUsers;
   late bool canBeUnmutedForAllUsers;
   late bool canBeMutedForCurrentUser;
   late bool canBeUnmutedForCurrentUser;
   late bool isMutedForAllUsers;
   late bool isMutedForCurrentUser;
   late bool canUnmuteSelf;
   late int volumeLevel;
   late String order;

  @override
  Map<String, dynamic> get params => {
    'participant_id': participantId,
    'audio_source_id': audioSourceId,
    'screen_sharing_audio_source_id': screenSharingAudioSourceId,
    'video_info': videoInfo,
    'screen_sharing_video_info': screenSharingVideoInfo,
    'bio': bio,
    'is_current_user': isCurrentUser,
    'is_speaking': isSpeaking,
    'is_hand_raised': isHandRaised,
    'can_be_muted_for_all_users': canBeMutedForAllUsers,
    'can_be_unmuted_for_all_users': canBeUnmutedForAllUsers,
    'can_be_muted_for_current_user': canBeMutedForCurrentUser,
    'can_be_unmuted_for_current_user': canBeUnmutedForCurrentUser,
    'is_muted_for_all_users': isMutedForAllUsers,
    'is_muted_for_current_user': isMutedForCurrentUser,
    'can_unmute_self': canUnmuteSelf,
    'volume_level': volumeLevel,
    'order': order,
  };

  GroupCallParticipant({
  required this.participantId,
  required this.audioSourceId,
  required this.screenSharingAudioSourceId,
  required this.videoInfo,
  required this.screenSharingVideoInfo,
  required this.bio,
  required this.isCurrentUser,
  required this.isSpeaking,
  required this.isHandRaised,
  required this.canBeMutedForAllUsers,
  required this.canBeUnmutedForAllUsers,
  required this.canBeMutedForCurrentUser,
  required this.canBeUnmutedForCurrentUser,
  required this.isMutedForAllUsers,
  required this.isMutedForCurrentUser,
  required this.canUnmuteSelf,
  required this.volumeLevel,
  required this.order,
  });

  GroupCallParticipant.fromJson(Map<String, dynamic> json) {
    participantId = tryConvertToTdObject(json['participant_id']);
    audioSourceId = tryConvertToTdObject(json['audio_source_id']);
    screenSharingAudioSourceId = tryConvertToTdObject(json['screen_sharing_audio_source_id']);
    videoInfo = tryConvertToTdObject(json['video_info']);
    screenSharingVideoInfo = tryConvertToTdObject(json['screen_sharing_video_info']);
    bio = tryConvertToTdObject(json['bio']);
    isCurrentUser = tryConvertToTdObject(json['is_current_user']);
    isSpeaking = tryConvertToTdObject(json['is_speaking']);
    isHandRaised = tryConvertToTdObject(json['is_hand_raised']);
    canBeMutedForAllUsers = tryConvertToTdObject(json['can_be_muted_for_all_users']);
    canBeUnmutedForAllUsers = tryConvertToTdObject(json['can_be_unmuted_for_all_users']);
    canBeMutedForCurrentUser = tryConvertToTdObject(json['can_be_muted_for_current_user']);
    canBeUnmutedForCurrentUser = tryConvertToTdObject(json['can_be_unmuted_for_current_user']);
    isMutedForAllUsers = tryConvertToTdObject(json['is_muted_for_all_users']);
    isMutedForCurrentUser = tryConvertToTdObject(json['is_muted_for_current_user']);
    canUnmuteSelf = tryConvertToTdObject(json['can_unmute_self']);
    volumeLevel = tryConvertToTdObject(json['volume_level']);
    order = tryConvertToTdObject(json['order']);
  }
}

abstract class CallProblem extends TdObject {}

@reflector
class CallProblemEcho extends CallProblem {
  @override
  String get tdType => 'callProblemEcho';

  @override
  Map<String, dynamic> get params => {};

  CallProblemEcho();

  CallProblemEcho.fromJson(Map<String, dynamic> json);
}

@reflector
class CallProblemNoise extends CallProblem {
  @override
  String get tdType => 'callProblemNoise';

  @override
  Map<String, dynamic> get params => {};

  CallProblemNoise();

  CallProblemNoise.fromJson(Map<String, dynamic> json);
}

@reflector
class CallProblemInterruptions extends CallProblem {
  @override
  String get tdType => 'callProblemInterruptions';

  @override
  Map<String, dynamic> get params => {};

  CallProblemInterruptions();

  CallProblemInterruptions.fromJson(Map<String, dynamic> json);
}

@reflector
class CallProblemDistortedSpeech extends CallProblem {
  @override
  String get tdType => 'callProblemDistortedSpeech';

  @override
  Map<String, dynamic> get params => {};

  CallProblemDistortedSpeech();

  CallProblemDistortedSpeech.fromJson(Map<String, dynamic> json);
}

@reflector
class CallProblemSilentLocal extends CallProblem {
  @override
  String get tdType => 'callProblemSilentLocal';

  @override
  Map<String, dynamic> get params => {};

  CallProblemSilentLocal();

  CallProblemSilentLocal.fromJson(Map<String, dynamic> json);
}

@reflector
class CallProblemSilentRemote extends CallProblem {
  @override
  String get tdType => 'callProblemSilentRemote';

  @override
  Map<String, dynamic> get params => {};

  CallProblemSilentRemote();

  CallProblemSilentRemote.fromJson(Map<String, dynamic> json);
}

@reflector
class CallProblemDropped extends CallProblem {
  @override
  String get tdType => 'callProblemDropped';

  @override
  Map<String, dynamic> get params => {};

  CallProblemDropped();

  CallProblemDropped.fromJson(Map<String, dynamic> json);
}

@reflector
class CallProblemDistortedVideo extends CallProblem {
  @override
  String get tdType => 'callProblemDistortedVideo';

  @override
  Map<String, dynamic> get params => {};

  CallProblemDistortedVideo();

  CallProblemDistortedVideo.fromJson(Map<String, dynamic> json);
}

@reflector
class CallProblemPixelatedVideo extends CallProblem {
  @override
  String get tdType => 'callProblemPixelatedVideo';

  @override
  Map<String, dynamic> get params => {};

  CallProblemPixelatedVideo();

  CallProblemPixelatedVideo.fromJson(Map<String, dynamic> json);
}

@reflector
class Call extends TdObject {
  @override
  String get tdType => 'call';

   late int id;
   late int userId;
   late bool isOutgoing;
   late bool isVideo;
   late CallState state;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'user_id': userId,
    'is_outgoing': isOutgoing,
    'is_video': isVideo,
    'state': state,
  };

  Call({
  required this.id,
  required this.userId,
  required this.isOutgoing,
  required this.isVideo,
  required this.state,
  });

  Call.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    userId = tryConvertToTdObject(json['user_id']);
    isOutgoing = tryConvertToTdObject(json['is_outgoing']);
    isVideo = tryConvertToTdObject(json['is_video']);
    state = tryConvertToTdObject(json['state']);
  }
}

@reflector
class PhoneNumberAuthenticationSettings extends TdObject {
  @override
  String get tdType => 'phoneNumberAuthenticationSettings';

   late bool allowFlashCall;
   late bool isCurrentPhoneNumber;
   late bool allowSmsRetrieverApi;

  @override
  Map<String, dynamic> get params => {
    'allow_flash_call': allowFlashCall,
    'is_current_phone_number': isCurrentPhoneNumber,
    'allow_sms_retriever_api': allowSmsRetrieverApi,
  };

  PhoneNumberAuthenticationSettings({
  required this.allowFlashCall,
  required this.isCurrentPhoneNumber,
  required this.allowSmsRetrieverApi,
  });

  PhoneNumberAuthenticationSettings.fromJson(Map<String, dynamic> json) {
    allowFlashCall = tryConvertToTdObject(json['allow_flash_call']);
    isCurrentPhoneNumber = tryConvertToTdObject(json['is_current_phone_number']);
    allowSmsRetrieverApi = tryConvertToTdObject(json['allow_sms_retriever_api']);
  }
}

@reflector
class Animations extends TdObject {
  @override
  String get tdType => 'animations';

   late List<Animation> animations;

  @override
  Map<String, dynamic> get params => {
    'animations': animations,
  };

  Animations({
  required this.animations,
  });

  Animations.fromJson(Map<String, dynamic> json) {
    animations = tryConvertToTdObject(json['animations']);
  }
}

abstract class DiceStickers extends TdObject {}

@reflector
class DiceStickersRegular extends DiceStickers {
  @override
  String get tdType => 'diceStickersRegular';

   late Sticker sticker;

  @override
  Map<String, dynamic> get params => {
    'sticker': sticker,
  };

  DiceStickersRegular({
  required this.sticker,
  });

  DiceStickersRegular.fromJson(Map<String, dynamic> json) {
    sticker = tryConvertToTdObject(json['sticker']);
  }
}

@reflector
class DiceStickersSlotMachine extends DiceStickers {
  @override
  String get tdType => 'diceStickersSlotMachine';

   late Sticker background;
   late Sticker lever;
   late Sticker leftReel;
   late Sticker centerReel;
   late Sticker rightReel;

  @override
  Map<String, dynamic> get params => {
    'background': background,
    'lever': lever,
    'left_reel': leftReel,
    'center_reel': centerReel,
    'right_reel': rightReel,
  };

  DiceStickersSlotMachine({
  required this.background,
  required this.lever,
  required this.leftReel,
  required this.centerReel,
  required this.rightReel,
  });

  DiceStickersSlotMachine.fromJson(Map<String, dynamic> json) {
    background = tryConvertToTdObject(json['background']);
    lever = tryConvertToTdObject(json['lever']);
    leftReel = tryConvertToTdObject(json['left_reel']);
    centerReel = tryConvertToTdObject(json['center_reel']);
    rightReel = tryConvertToTdObject(json['right_reel']);
  }
}

@reflector
class ImportedContacts extends TdObject {
  @override
  String get tdType => 'importedContacts';

   late List<int> userIds;
   late List<int> importerCount;

  @override
  Map<String, dynamic> get params => {
    'user_ids': userIds,
    'importer_count': importerCount,
  };

  ImportedContacts({
  required this.userIds,
  required this.importerCount,
  });

  ImportedContacts.fromJson(Map<String, dynamic> json) {
    userIds = tryConvertToTdObject(json['user_ids']);
    importerCount = tryConvertToTdObject(json['importer_count']);
  }
}

@reflector
class HttpUrl extends TdObject {
  @override
  String get tdType => 'httpUrl';

   late String url;

  @override
  Map<String, dynamic> get params => {
    'url': url,
  };

  HttpUrl({
  required this.url,
  });

  HttpUrl.fromJson(Map<String, dynamic> json) {
    url = tryConvertToTdObject(json['url']);
  }
}

abstract class InputInlineQueryResult extends TdObject {}

@reflector
class InputInlineQueryResultAnimation extends InputInlineQueryResult {
  @override
  String get tdType => 'inputInlineQueryResultAnimation';

   late String id;
   late String title;
   late String thumbnailUrl;
   late String thumbnailMimeType;
   late String videoUrl;
   late String videoMimeType;
   late int videoDuration;
   late int videoWidth;
   late int videoHeight;
   late ReplyMarkup replyMarkup;
   late InputMessageContent inputMessageContent;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'title': title,
    'thumbnail_url': thumbnailUrl,
    'thumbnail_mime_type': thumbnailMimeType,
    'video_url': videoUrl,
    'video_mime_type': videoMimeType,
    'video_duration': videoDuration,
    'video_width': videoWidth,
    'video_height': videoHeight,
    'reply_markup': replyMarkup,
    'input_message_content': inputMessageContent,
  };

  InputInlineQueryResultAnimation({
  required this.id,
  required this.title,
  required this.thumbnailUrl,
  required this.thumbnailMimeType,
  required this.videoUrl,
  required this.videoMimeType,
  required this.videoDuration,
  required this.videoWidth,
  required this.videoHeight,
  required this.replyMarkup,
  required this.inputMessageContent,
  });

  InputInlineQueryResultAnimation.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    title = tryConvertToTdObject(json['title']);
    thumbnailUrl = tryConvertToTdObject(json['thumbnail_url']);
    thumbnailMimeType = tryConvertToTdObject(json['thumbnail_mime_type']);
    videoUrl = tryConvertToTdObject(json['video_url']);
    videoMimeType = tryConvertToTdObject(json['video_mime_type']);
    videoDuration = tryConvertToTdObject(json['video_duration']);
    videoWidth = tryConvertToTdObject(json['video_width']);
    videoHeight = tryConvertToTdObject(json['video_height']);
    replyMarkup = tryConvertToTdObject(json['reply_markup']);
    inputMessageContent = tryConvertToTdObject(json['input_message_content']);
  }
}

@reflector
class InputInlineQueryResultArticle extends InputInlineQueryResult {
  @override
  String get tdType => 'inputInlineQueryResultArticle';

   late String id;
   late String url;
   late bool hideUrl;
   late String title;
   late String description;
   late String thumbnailUrl;
   late int thumbnailWidth;
   late int thumbnailHeight;
   late ReplyMarkup replyMarkup;
   late InputMessageContent inputMessageContent;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'url': url,
    'hide_url': hideUrl,
    'title': title,
    'description': description,
    'thumbnail_url': thumbnailUrl,
    'thumbnail_width': thumbnailWidth,
    'thumbnail_height': thumbnailHeight,
    'reply_markup': replyMarkup,
    'input_message_content': inputMessageContent,
  };

  InputInlineQueryResultArticle({
  required this.id,
  required this.url,
  required this.hideUrl,
  required this.title,
  required this.description,
  required this.thumbnailUrl,
  required this.thumbnailWidth,
  required this.thumbnailHeight,
  required this.replyMarkup,
  required this.inputMessageContent,
  });

  InputInlineQueryResultArticle.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    url = tryConvertToTdObject(json['url']);
    hideUrl = tryConvertToTdObject(json['hide_url']);
    title = tryConvertToTdObject(json['title']);
    description = tryConvertToTdObject(json['description']);
    thumbnailUrl = tryConvertToTdObject(json['thumbnail_url']);
    thumbnailWidth = tryConvertToTdObject(json['thumbnail_width']);
    thumbnailHeight = tryConvertToTdObject(json['thumbnail_height']);
    replyMarkup = tryConvertToTdObject(json['reply_markup']);
    inputMessageContent = tryConvertToTdObject(json['input_message_content']);
  }
}

@reflector
class InputInlineQueryResultAudio extends InputInlineQueryResult {
  @override
  String get tdType => 'inputInlineQueryResultAudio';

   late String id;
   late String title;
   late String performer;
   late String audioUrl;
   late int audioDuration;
   late ReplyMarkup replyMarkup;
   late InputMessageContent inputMessageContent;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'title': title,
    'performer': performer,
    'audio_url': audioUrl,
    'audio_duration': audioDuration,
    'reply_markup': replyMarkup,
    'input_message_content': inputMessageContent,
  };

  InputInlineQueryResultAudio({
  required this.id,
  required this.title,
  required this.performer,
  required this.audioUrl,
  required this.audioDuration,
  required this.replyMarkup,
  required this.inputMessageContent,
  });

  InputInlineQueryResultAudio.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    title = tryConvertToTdObject(json['title']);
    performer = tryConvertToTdObject(json['performer']);
    audioUrl = tryConvertToTdObject(json['audio_url']);
    audioDuration = tryConvertToTdObject(json['audio_duration']);
    replyMarkup = tryConvertToTdObject(json['reply_markup']);
    inputMessageContent = tryConvertToTdObject(json['input_message_content']);
  }
}

@reflector
class InputInlineQueryResultContact extends InputInlineQueryResult {
  @override
  String get tdType => 'inputInlineQueryResultContact';

   late String id;
   late Contact contact;
   late String thumbnailUrl;
   late int thumbnailWidth;
   late int thumbnailHeight;
   late ReplyMarkup replyMarkup;
   late InputMessageContent inputMessageContent;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'contact': contact,
    'thumbnail_url': thumbnailUrl,
    'thumbnail_width': thumbnailWidth,
    'thumbnail_height': thumbnailHeight,
    'reply_markup': replyMarkup,
    'input_message_content': inputMessageContent,
  };

  InputInlineQueryResultContact({
  required this.id,
  required this.contact,
  required this.thumbnailUrl,
  required this.thumbnailWidth,
  required this.thumbnailHeight,
  required this.replyMarkup,
  required this.inputMessageContent,
  });

  InputInlineQueryResultContact.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    contact = tryConvertToTdObject(json['contact']);
    thumbnailUrl = tryConvertToTdObject(json['thumbnail_url']);
    thumbnailWidth = tryConvertToTdObject(json['thumbnail_width']);
    thumbnailHeight = tryConvertToTdObject(json['thumbnail_height']);
    replyMarkup = tryConvertToTdObject(json['reply_markup']);
    inputMessageContent = tryConvertToTdObject(json['input_message_content']);
  }
}

@reflector
class InputInlineQueryResultDocument extends InputInlineQueryResult {
  @override
  String get tdType => 'inputInlineQueryResultDocument';

   late String id;
   late String title;
   late String description;
   late String documentUrl;
   late String mimeType;
   late String thumbnailUrl;
   late int thumbnailWidth;
   late int thumbnailHeight;
   late ReplyMarkup replyMarkup;
   late InputMessageContent inputMessageContent;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'title': title,
    'description': description,
    'document_url': documentUrl,
    'mime_type': mimeType,
    'thumbnail_url': thumbnailUrl,
    'thumbnail_width': thumbnailWidth,
    'thumbnail_height': thumbnailHeight,
    'reply_markup': replyMarkup,
    'input_message_content': inputMessageContent,
  };

  InputInlineQueryResultDocument({
  required this.id,
  required this.title,
  required this.description,
  required this.documentUrl,
  required this.mimeType,
  required this.thumbnailUrl,
  required this.thumbnailWidth,
  required this.thumbnailHeight,
  required this.replyMarkup,
  required this.inputMessageContent,
  });

  InputInlineQueryResultDocument.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    title = tryConvertToTdObject(json['title']);
    description = tryConvertToTdObject(json['description']);
    documentUrl = tryConvertToTdObject(json['document_url']);
    mimeType = tryConvertToTdObject(json['mime_type']);
    thumbnailUrl = tryConvertToTdObject(json['thumbnail_url']);
    thumbnailWidth = tryConvertToTdObject(json['thumbnail_width']);
    thumbnailHeight = tryConvertToTdObject(json['thumbnail_height']);
    replyMarkup = tryConvertToTdObject(json['reply_markup']);
    inputMessageContent = tryConvertToTdObject(json['input_message_content']);
  }
}

@reflector
class InputInlineQueryResultGame extends InputInlineQueryResult {
  @override
  String get tdType => 'inputInlineQueryResultGame';

   late String id;
   late String gameShortName;
   late ReplyMarkup replyMarkup;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'game_short_name': gameShortName,
    'reply_markup': replyMarkup,
  };

  InputInlineQueryResultGame({
  required this.id,
  required this.gameShortName,
  required this.replyMarkup,
  });

  InputInlineQueryResultGame.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    gameShortName = tryConvertToTdObject(json['game_short_name']);
    replyMarkup = tryConvertToTdObject(json['reply_markup']);
  }
}

@reflector
class InputInlineQueryResultLocation extends InputInlineQueryResult {
  @override
  String get tdType => 'inputInlineQueryResultLocation';

   late String id;
   late Location location;
   late int livePeriod;
   late String title;
   late String thumbnailUrl;
   late int thumbnailWidth;
   late int thumbnailHeight;
   late ReplyMarkup replyMarkup;
   late InputMessageContent inputMessageContent;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'location': location,
    'live_period': livePeriod,
    'title': title,
    'thumbnail_url': thumbnailUrl,
    'thumbnail_width': thumbnailWidth,
    'thumbnail_height': thumbnailHeight,
    'reply_markup': replyMarkup,
    'input_message_content': inputMessageContent,
  };

  InputInlineQueryResultLocation({
  required this.id,
  required this.location,
  required this.livePeriod,
  required this.title,
  required this.thumbnailUrl,
  required this.thumbnailWidth,
  required this.thumbnailHeight,
  required this.replyMarkup,
  required this.inputMessageContent,
  });

  InputInlineQueryResultLocation.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    location = tryConvertToTdObject(json['location']);
    livePeriod = tryConvertToTdObject(json['live_period']);
    title = tryConvertToTdObject(json['title']);
    thumbnailUrl = tryConvertToTdObject(json['thumbnail_url']);
    thumbnailWidth = tryConvertToTdObject(json['thumbnail_width']);
    thumbnailHeight = tryConvertToTdObject(json['thumbnail_height']);
    replyMarkup = tryConvertToTdObject(json['reply_markup']);
    inputMessageContent = tryConvertToTdObject(json['input_message_content']);
  }
}

@reflector
class InputInlineQueryResultPhoto extends InputInlineQueryResult {
  @override
  String get tdType => 'inputInlineQueryResultPhoto';

   late String id;
   late String title;
   late String description;
   late String thumbnailUrl;
   late String photoUrl;
   late int photoWidth;
   late int photoHeight;
   late ReplyMarkup replyMarkup;
   late InputMessageContent inputMessageContent;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'title': title,
    'description': description,
    'thumbnail_url': thumbnailUrl,
    'photo_url': photoUrl,
    'photo_width': photoWidth,
    'photo_height': photoHeight,
    'reply_markup': replyMarkup,
    'input_message_content': inputMessageContent,
  };

  InputInlineQueryResultPhoto({
  required this.id,
  required this.title,
  required this.description,
  required this.thumbnailUrl,
  required this.photoUrl,
  required this.photoWidth,
  required this.photoHeight,
  required this.replyMarkup,
  required this.inputMessageContent,
  });

  InputInlineQueryResultPhoto.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    title = tryConvertToTdObject(json['title']);
    description = tryConvertToTdObject(json['description']);
    thumbnailUrl = tryConvertToTdObject(json['thumbnail_url']);
    photoUrl = tryConvertToTdObject(json['photo_url']);
    photoWidth = tryConvertToTdObject(json['photo_width']);
    photoHeight = tryConvertToTdObject(json['photo_height']);
    replyMarkup = tryConvertToTdObject(json['reply_markup']);
    inputMessageContent = tryConvertToTdObject(json['input_message_content']);
  }
}

@reflector
class InputInlineQueryResultSticker extends InputInlineQueryResult {
  @override
  String get tdType => 'inputInlineQueryResultSticker';

   late String id;
   late String thumbnailUrl;
   late String stickerUrl;
   late int stickerWidth;
   late int stickerHeight;
   late ReplyMarkup replyMarkup;
   late InputMessageContent inputMessageContent;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'thumbnail_url': thumbnailUrl,
    'sticker_url': stickerUrl,
    'sticker_width': stickerWidth,
    'sticker_height': stickerHeight,
    'reply_markup': replyMarkup,
    'input_message_content': inputMessageContent,
  };

  InputInlineQueryResultSticker({
  required this.id,
  required this.thumbnailUrl,
  required this.stickerUrl,
  required this.stickerWidth,
  required this.stickerHeight,
  required this.replyMarkup,
  required this.inputMessageContent,
  });

  InputInlineQueryResultSticker.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    thumbnailUrl = tryConvertToTdObject(json['thumbnail_url']);
    stickerUrl = tryConvertToTdObject(json['sticker_url']);
    stickerWidth = tryConvertToTdObject(json['sticker_width']);
    stickerHeight = tryConvertToTdObject(json['sticker_height']);
    replyMarkup = tryConvertToTdObject(json['reply_markup']);
    inputMessageContent = tryConvertToTdObject(json['input_message_content']);
  }
}

@reflector
class InputInlineQueryResultVenue extends InputInlineQueryResult {
  @override
  String get tdType => 'inputInlineQueryResultVenue';

   late String id;
   late Venue venue;
   late String thumbnailUrl;
   late int thumbnailWidth;
   late int thumbnailHeight;
   late ReplyMarkup replyMarkup;
   late InputMessageContent inputMessageContent;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'venue': venue,
    'thumbnail_url': thumbnailUrl,
    'thumbnail_width': thumbnailWidth,
    'thumbnail_height': thumbnailHeight,
    'reply_markup': replyMarkup,
    'input_message_content': inputMessageContent,
  };

  InputInlineQueryResultVenue({
  required this.id,
  required this.venue,
  required this.thumbnailUrl,
  required this.thumbnailWidth,
  required this.thumbnailHeight,
  required this.replyMarkup,
  required this.inputMessageContent,
  });

  InputInlineQueryResultVenue.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    venue = tryConvertToTdObject(json['venue']);
    thumbnailUrl = tryConvertToTdObject(json['thumbnail_url']);
    thumbnailWidth = tryConvertToTdObject(json['thumbnail_width']);
    thumbnailHeight = tryConvertToTdObject(json['thumbnail_height']);
    replyMarkup = tryConvertToTdObject(json['reply_markup']);
    inputMessageContent = tryConvertToTdObject(json['input_message_content']);
  }
}

@reflector
class InputInlineQueryResultVideo extends InputInlineQueryResult {
  @override
  String get tdType => 'inputInlineQueryResultVideo';

   late String id;
   late String title;
   late String description;
   late String thumbnailUrl;
   late String videoUrl;
   late String mimeType;
   late int videoWidth;
   late int videoHeight;
   late int videoDuration;
   late ReplyMarkup replyMarkup;
   late InputMessageContent inputMessageContent;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'title': title,
    'description': description,
    'thumbnail_url': thumbnailUrl,
    'video_url': videoUrl,
    'mime_type': mimeType,
    'video_width': videoWidth,
    'video_height': videoHeight,
    'video_duration': videoDuration,
    'reply_markup': replyMarkup,
    'input_message_content': inputMessageContent,
  };

  InputInlineQueryResultVideo({
  required this.id,
  required this.title,
  required this.description,
  required this.thumbnailUrl,
  required this.videoUrl,
  required this.mimeType,
  required this.videoWidth,
  required this.videoHeight,
  required this.videoDuration,
  required this.replyMarkup,
  required this.inputMessageContent,
  });

  InputInlineQueryResultVideo.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    title = tryConvertToTdObject(json['title']);
    description = tryConvertToTdObject(json['description']);
    thumbnailUrl = tryConvertToTdObject(json['thumbnail_url']);
    videoUrl = tryConvertToTdObject(json['video_url']);
    mimeType = tryConvertToTdObject(json['mime_type']);
    videoWidth = tryConvertToTdObject(json['video_width']);
    videoHeight = tryConvertToTdObject(json['video_height']);
    videoDuration = tryConvertToTdObject(json['video_duration']);
    replyMarkup = tryConvertToTdObject(json['reply_markup']);
    inputMessageContent = tryConvertToTdObject(json['input_message_content']);
  }
}

@reflector
class InputInlineQueryResultVoiceNote extends InputInlineQueryResult {
  @override
  String get tdType => 'inputInlineQueryResultVoiceNote';

   late String id;
   late String title;
   late String voiceNoteUrl;
   late int voiceNoteDuration;
   late ReplyMarkup replyMarkup;
   late InputMessageContent inputMessageContent;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'title': title,
    'voice_note_url': voiceNoteUrl,
    'voice_note_duration': voiceNoteDuration,
    'reply_markup': replyMarkup,
    'input_message_content': inputMessageContent,
  };

  InputInlineQueryResultVoiceNote({
  required this.id,
  required this.title,
  required this.voiceNoteUrl,
  required this.voiceNoteDuration,
  required this.replyMarkup,
  required this.inputMessageContent,
  });

  InputInlineQueryResultVoiceNote.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    title = tryConvertToTdObject(json['title']);
    voiceNoteUrl = tryConvertToTdObject(json['voice_note_url']);
    voiceNoteDuration = tryConvertToTdObject(json['voice_note_duration']);
    replyMarkup = tryConvertToTdObject(json['reply_markup']);
    inputMessageContent = tryConvertToTdObject(json['input_message_content']);
  }
}

abstract class InlineQueryResult extends TdObject {}

@reflector
class InlineQueryResultArticle extends InlineQueryResult {
  @override
  String get tdType => 'inlineQueryResultArticle';

   late String id;
   late String url;
   late bool hideUrl;
   late String title;
   late String description;
   late Thumbnail thumbnail;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'url': url,
    'hide_url': hideUrl,
    'title': title,
    'description': description,
    'thumbnail': thumbnail,
  };

  InlineQueryResultArticle({
  required this.id,
  required this.url,
  required this.hideUrl,
  required this.title,
  required this.description,
  required this.thumbnail,
  });

  InlineQueryResultArticle.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    url = tryConvertToTdObject(json['url']);
    hideUrl = tryConvertToTdObject(json['hide_url']);
    title = tryConvertToTdObject(json['title']);
    description = tryConvertToTdObject(json['description']);
    thumbnail = tryConvertToTdObject(json['thumbnail']);
  }
}

@reflector
class InlineQueryResultContact extends InlineQueryResult {
  @override
  String get tdType => 'inlineQueryResultContact';

   late String id;
   late Contact contact;
   late Thumbnail thumbnail;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'contact': contact,
    'thumbnail': thumbnail,
  };

  InlineQueryResultContact({
  required this.id,
  required this.contact,
  required this.thumbnail,
  });

  InlineQueryResultContact.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    contact = tryConvertToTdObject(json['contact']);
    thumbnail = tryConvertToTdObject(json['thumbnail']);
  }
}

@reflector
class InlineQueryResultLocation extends InlineQueryResult {
  @override
  String get tdType => 'inlineQueryResultLocation';

   late String id;
   late Location location;
   late String title;
   late Thumbnail thumbnail;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'location': location,
    'title': title,
    'thumbnail': thumbnail,
  };

  InlineQueryResultLocation({
  required this.id,
  required this.location,
  required this.title,
  required this.thumbnail,
  });

  InlineQueryResultLocation.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    location = tryConvertToTdObject(json['location']);
    title = tryConvertToTdObject(json['title']);
    thumbnail = tryConvertToTdObject(json['thumbnail']);
  }
}

@reflector
class InlineQueryResultVenue extends InlineQueryResult {
  @override
  String get tdType => 'inlineQueryResultVenue';

   late String id;
   late Venue venue;
   late Thumbnail thumbnail;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'venue': venue,
    'thumbnail': thumbnail,
  };

  InlineQueryResultVenue({
  required this.id,
  required this.venue,
  required this.thumbnail,
  });

  InlineQueryResultVenue.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    venue = tryConvertToTdObject(json['venue']);
    thumbnail = tryConvertToTdObject(json['thumbnail']);
  }
}

@reflector
class InlineQueryResultGame extends InlineQueryResult {
  @override
  String get tdType => 'inlineQueryResultGame';

   late String id;
   late Game game;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'game': game,
  };

  InlineQueryResultGame({
  required this.id,
  required this.game,
  });

  InlineQueryResultGame.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    game = tryConvertToTdObject(json['game']);
  }
}

@reflector
class InlineQueryResultAnimation extends InlineQueryResult {
  @override
  String get tdType => 'inlineQueryResultAnimation';

   late String id;
   late Animation animation;
   late String title;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'animation': animation,
    'title': title,
  };

  InlineQueryResultAnimation({
  required this.id,
  required this.animation,
  required this.title,
  });

  InlineQueryResultAnimation.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    animation = tryConvertToTdObject(json['animation']);
    title = tryConvertToTdObject(json['title']);
  }
}

@reflector
class InlineQueryResultAudio extends InlineQueryResult {
  @override
  String get tdType => 'inlineQueryResultAudio';

   late String id;
   late Audio audio;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'audio': audio,
  };

  InlineQueryResultAudio({
  required this.id,
  required this.audio,
  });

  InlineQueryResultAudio.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    audio = tryConvertToTdObject(json['audio']);
  }
}

@reflector
class InlineQueryResultDocument extends InlineQueryResult {
  @override
  String get tdType => 'inlineQueryResultDocument';

   late String id;
   late Document document;
   late String title;
   late String description;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'document': document,
    'title': title,
    'description': description,
  };

  InlineQueryResultDocument({
  required this.id,
  required this.document,
  required this.title,
  required this.description,
  });

  InlineQueryResultDocument.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    document = tryConvertToTdObject(json['document']);
    title = tryConvertToTdObject(json['title']);
    description = tryConvertToTdObject(json['description']);
  }
}

@reflector
class InlineQueryResultPhoto extends InlineQueryResult {
  @override
  String get tdType => 'inlineQueryResultPhoto';

   late String id;
   late Photo photo;
   late String title;
   late String description;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'photo': photo,
    'title': title,
    'description': description,
  };

  InlineQueryResultPhoto({
  required this.id,
  required this.photo,
  required this.title,
  required this.description,
  });

  InlineQueryResultPhoto.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    photo = tryConvertToTdObject(json['photo']);
    title = tryConvertToTdObject(json['title']);
    description = tryConvertToTdObject(json['description']);
  }
}

@reflector
class InlineQueryResultSticker extends InlineQueryResult {
  @override
  String get tdType => 'inlineQueryResultSticker';

   late String id;
   late Sticker sticker;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'sticker': sticker,
  };

  InlineQueryResultSticker({
  required this.id,
  required this.sticker,
  });

  InlineQueryResultSticker.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    sticker = tryConvertToTdObject(json['sticker']);
  }
}

@reflector
class InlineQueryResultVideo extends InlineQueryResult {
  @override
  String get tdType => 'inlineQueryResultVideo';

   late String id;
   late Video video;
   late String title;
   late String description;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'video': video,
    'title': title,
    'description': description,
  };

  InlineQueryResultVideo({
  required this.id,
  required this.video,
  required this.title,
  required this.description,
  });

  InlineQueryResultVideo.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    video = tryConvertToTdObject(json['video']);
    title = tryConvertToTdObject(json['title']);
    description = tryConvertToTdObject(json['description']);
  }
}

@reflector
class InlineQueryResultVoiceNote extends InlineQueryResult {
  @override
  String get tdType => 'inlineQueryResultVoiceNote';

   late String id;
   late VoiceNote voiceNote;
   late String title;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'voice_note': voiceNote,
    'title': title,
  };

  InlineQueryResultVoiceNote({
  required this.id,
  required this.voiceNote,
  required this.title,
  });

  InlineQueryResultVoiceNote.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    voiceNote = tryConvertToTdObject(json['voice_note']);
    title = tryConvertToTdObject(json['title']);
  }
}

@reflector
class InlineQueryResults extends TdObject {
  @override
  String get tdType => 'inlineQueryResults';

   late int inlineQueryId;
   late String nextOffset;
   late List<InlineQueryResult> results;
   late String switchPmText;
   late String switchPmParameter;

  @override
  Map<String, dynamic> get params => {
    'inline_query_id': inlineQueryId,
    'next_offset': nextOffset,
    'results': results,
    'switch_pm_text': switchPmText,
    'switch_pm_parameter': switchPmParameter,
  };

  InlineQueryResults({
  required this.inlineQueryId,
  required this.nextOffset,
  required this.results,
  required this.switchPmText,
  required this.switchPmParameter,
  });

  InlineQueryResults.fromJson(Map<String, dynamic> json) {
    inlineQueryId = tryConvertToTdObject(json['inline_query_id']);
    nextOffset = tryConvertToTdObject(json['next_offset']);
    results = tryConvertToTdObject(json['results']);
    switchPmText = tryConvertToTdObject(json['switch_pm_text']);
    switchPmParameter = tryConvertToTdObject(json['switch_pm_parameter']);
  }
}

abstract class CallbackQueryPayload extends TdObject {}

@reflector
class CallbackQueryPayloadData extends CallbackQueryPayload {
  @override
  String get tdType => 'callbackQueryPayloadData';

   late String data;

  @override
  Map<String, dynamic> get params => {
    'data': data,
  };

  CallbackQueryPayloadData({
  required this.data,
  });

  CallbackQueryPayloadData.fromJson(Map<String, dynamic> json) {
    data = tryConvertToTdObject(json['data']);
  }
}

@reflector
class CallbackQueryPayloadDataWithPassword extends CallbackQueryPayload {
  @override
  String get tdType => 'callbackQueryPayloadDataWithPassword';

   late String password;
   late String data;

  @override
  Map<String, dynamic> get params => {
    'password': password,
    'data': data,
  };

  CallbackQueryPayloadDataWithPassword({
  required this.password,
  required this.data,
  });

  CallbackQueryPayloadDataWithPassword.fromJson(Map<String, dynamic> json) {
    password = tryConvertToTdObject(json['password']);
    data = tryConvertToTdObject(json['data']);
  }
}

@reflector
class CallbackQueryPayloadGame extends CallbackQueryPayload {
  @override
  String get tdType => 'callbackQueryPayloadGame';

   late String gameShortName;

  @override
  Map<String, dynamic> get params => {
    'game_short_name': gameShortName,
  };

  CallbackQueryPayloadGame({
  required this.gameShortName,
  });

  CallbackQueryPayloadGame.fromJson(Map<String, dynamic> json) {
    gameShortName = tryConvertToTdObject(json['game_short_name']);
  }
}

@reflector
class CallbackQueryAnswer extends TdObject {
  @override
  String get tdType => 'callbackQueryAnswer';

   late String text;
   late bool showAlert;
   late String url;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'show_alert': showAlert,
    'url': url,
  };

  CallbackQueryAnswer({
  required this.text,
  required this.showAlert,
  required this.url,
  });

  CallbackQueryAnswer.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    showAlert = tryConvertToTdObject(json['show_alert']);
    url = tryConvertToTdObject(json['url']);
  }
}

@reflector
class CustomRequestResult extends TdObject {
  @override
  String get tdType => 'customRequestResult';

   late String result;

  @override
  Map<String, dynamic> get params => {
    'result': result,
  };

  CustomRequestResult({
  required this.result,
  });

  CustomRequestResult.fromJson(Map<String, dynamic> json) {
    result = tryConvertToTdObject(json['result']);
  }
}

@reflector
class GameHighScore extends TdObject {
  @override
  String get tdType => 'gameHighScore';

   late int position;
   late int userId;
   late int score;

  @override
  Map<String, dynamic> get params => {
    'position': position,
    'user_id': userId,
    'score': score,
  };

  GameHighScore({
  required this.position,
  required this.userId,
  required this.score,
  });

  GameHighScore.fromJson(Map<String, dynamic> json) {
    position = tryConvertToTdObject(json['position']);
    userId = tryConvertToTdObject(json['user_id']);
    score = tryConvertToTdObject(json['score']);
  }
}

@reflector
class GameHighScores extends TdObject {
  @override
  String get tdType => 'gameHighScores';

   late List<GameHighScore> scores;

  @override
  Map<String, dynamic> get params => {
    'scores': scores,
  };

  GameHighScores({
  required this.scores,
  });

  GameHighScores.fromJson(Map<String, dynamic> json) {
    scores = tryConvertToTdObject(json['scores']);
  }
}

abstract class ChatEventAction extends TdObject {}

@reflector
class ChatEventMessageEdited extends ChatEventAction {
  @override
  String get tdType => 'chatEventMessageEdited';

   late Message oldMessage;
   late Message newMessage;

  @override
  Map<String, dynamic> get params => {
    'old_message': oldMessage,
    'new_message': newMessage,
  };

  ChatEventMessageEdited({
  required this.oldMessage,
  required this.newMessage,
  });

  ChatEventMessageEdited.fromJson(Map<String, dynamic> json) {
    oldMessage = tryConvertToTdObject(json['old_message']);
    newMessage = tryConvertToTdObject(json['new_message']);
  }
}

@reflector
class ChatEventMessageDeleted extends ChatEventAction {
  @override
  String get tdType => 'chatEventMessageDeleted';

   late Message message;

  @override
  Map<String, dynamic> get params => {
    'message': message,
  };

  ChatEventMessageDeleted({
  required this.message,
  });

  ChatEventMessageDeleted.fromJson(Map<String, dynamic> json) {
    message = tryConvertToTdObject(json['message']);
  }
}

@reflector
class ChatEventPollStopped extends ChatEventAction {
  @override
  String get tdType => 'chatEventPollStopped';

   late Message message;

  @override
  Map<String, dynamic> get params => {
    'message': message,
  };

  ChatEventPollStopped({
  required this.message,
  });

  ChatEventPollStopped.fromJson(Map<String, dynamic> json) {
    message = tryConvertToTdObject(json['message']);
  }
}

@reflector
class ChatEventMessagePinned extends ChatEventAction {
  @override
  String get tdType => 'chatEventMessagePinned';

   late Message message;

  @override
  Map<String, dynamic> get params => {
    'message': message,
  };

  ChatEventMessagePinned({
  required this.message,
  });

  ChatEventMessagePinned.fromJson(Map<String, dynamic> json) {
    message = tryConvertToTdObject(json['message']);
  }
}

@reflector
class ChatEventMessageUnpinned extends ChatEventAction {
  @override
  String get tdType => 'chatEventMessageUnpinned';

   late Message message;

  @override
  Map<String, dynamic> get params => {
    'message': message,
  };

  ChatEventMessageUnpinned({
  required this.message,
  });

  ChatEventMessageUnpinned.fromJson(Map<String, dynamic> json) {
    message = tryConvertToTdObject(json['message']);
  }
}

@reflector
class ChatEventMemberJoined extends ChatEventAction {
  @override
  String get tdType => 'chatEventMemberJoined';

  @override
  Map<String, dynamic> get params => {};

  ChatEventMemberJoined();

  ChatEventMemberJoined.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatEventMemberJoinedByInviteLink extends ChatEventAction {
  @override
  String get tdType => 'chatEventMemberJoinedByInviteLink';

   late ChatInviteLink inviteLink;

  @override
  Map<String, dynamic> get params => {
    'invite_link': inviteLink,
  };

  ChatEventMemberJoinedByInviteLink({
  required this.inviteLink,
  });

  ChatEventMemberJoinedByInviteLink.fromJson(Map<String, dynamic> json) {
    inviteLink = tryConvertToTdObject(json['invite_link']);
  }
}

@reflector
class ChatEventMemberLeft extends ChatEventAction {
  @override
  String get tdType => 'chatEventMemberLeft';

  @override
  Map<String, dynamic> get params => {};

  ChatEventMemberLeft();

  ChatEventMemberLeft.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatEventMemberInvited extends ChatEventAction {
  @override
  String get tdType => 'chatEventMemberInvited';

   late int userId;
   late ChatMemberStatus status;

  @override
  Map<String, dynamic> get params => {
    'user_id': userId,
    'status': status,
  };

  ChatEventMemberInvited({
  required this.userId,
  required this.status,
  });

  ChatEventMemberInvited.fromJson(Map<String, dynamic> json) {
    userId = tryConvertToTdObject(json['user_id']);
    status = tryConvertToTdObject(json['status']);
  }
}

@reflector
class ChatEventMemberPromoted extends ChatEventAction {
  @override
  String get tdType => 'chatEventMemberPromoted';

   late int userId;
   late ChatMemberStatus oldStatus;
   late ChatMemberStatus newStatus;

  @override
  Map<String, dynamic> get params => {
    'user_id': userId,
    'old_status': oldStatus,
    'new_status': newStatus,
  };

  ChatEventMemberPromoted({
  required this.userId,
  required this.oldStatus,
  required this.newStatus,
  });

  ChatEventMemberPromoted.fromJson(Map<String, dynamic> json) {
    userId = tryConvertToTdObject(json['user_id']);
    oldStatus = tryConvertToTdObject(json['old_status']);
    newStatus = tryConvertToTdObject(json['new_status']);
  }
}

@reflector
class ChatEventMemberRestricted extends ChatEventAction {
  @override
  String get tdType => 'chatEventMemberRestricted';

   late MessageSender memberId;
   late ChatMemberStatus oldStatus;
   late ChatMemberStatus newStatus;

  @override
  Map<String, dynamic> get params => {
    'member_id': memberId,
    'old_status': oldStatus,
    'new_status': newStatus,
  };

  ChatEventMemberRestricted({
  required this.memberId,
  required this.oldStatus,
  required this.newStatus,
  });

  ChatEventMemberRestricted.fromJson(Map<String, dynamic> json) {
    memberId = tryConvertToTdObject(json['member_id']);
    oldStatus = tryConvertToTdObject(json['old_status']);
    newStatus = tryConvertToTdObject(json['new_status']);
  }
}

@reflector
class ChatEventTitleChanged extends ChatEventAction {
  @override
  String get tdType => 'chatEventTitleChanged';

   late String oldTitle;
   late String newTitle;

  @override
  Map<String, dynamic> get params => {
    'old_title': oldTitle,
    'new_title': newTitle,
  };

  ChatEventTitleChanged({
  required this.oldTitle,
  required this.newTitle,
  });

  ChatEventTitleChanged.fromJson(Map<String, dynamic> json) {
    oldTitle = tryConvertToTdObject(json['old_title']);
    newTitle = tryConvertToTdObject(json['new_title']);
  }
}

@reflector
class ChatEventPermissionsChanged extends ChatEventAction {
  @override
  String get tdType => 'chatEventPermissionsChanged';

   late ChatPermissions oldPermissions;
   late ChatPermissions newPermissions;

  @override
  Map<String, dynamic> get params => {
    'old_permissions': oldPermissions,
    'new_permissions': newPermissions,
  };

  ChatEventPermissionsChanged({
  required this.oldPermissions,
  required this.newPermissions,
  });

  ChatEventPermissionsChanged.fromJson(Map<String, dynamic> json) {
    oldPermissions = tryConvertToTdObject(json['old_permissions']);
    newPermissions = tryConvertToTdObject(json['new_permissions']);
  }
}

@reflector
class ChatEventDescriptionChanged extends ChatEventAction {
  @override
  String get tdType => 'chatEventDescriptionChanged';

   late String oldDescription;
   late String newDescription;

  @override
  Map<String, dynamic> get params => {
    'old_description': oldDescription,
    'new_description': newDescription,
  };

  ChatEventDescriptionChanged({
  required this.oldDescription,
  required this.newDescription,
  });

  ChatEventDescriptionChanged.fromJson(Map<String, dynamic> json) {
    oldDescription = tryConvertToTdObject(json['old_description']);
    newDescription = tryConvertToTdObject(json['new_description']);
  }
}

@reflector
class ChatEventUsernameChanged extends ChatEventAction {
  @override
  String get tdType => 'chatEventUsernameChanged';

   late String oldUsername;
   late String newUsername;

  @override
  Map<String, dynamic> get params => {
    'old_username': oldUsername,
    'new_username': newUsername,
  };

  ChatEventUsernameChanged({
  required this.oldUsername,
  required this.newUsername,
  });

  ChatEventUsernameChanged.fromJson(Map<String, dynamic> json) {
    oldUsername = tryConvertToTdObject(json['old_username']);
    newUsername = tryConvertToTdObject(json['new_username']);
  }
}

@reflector
class ChatEventPhotoChanged extends ChatEventAction {
  @override
  String get tdType => 'chatEventPhotoChanged';

   late ChatPhoto oldPhoto;
   late ChatPhoto newPhoto;

  @override
  Map<String, dynamic> get params => {
    'old_photo': oldPhoto,
    'new_photo': newPhoto,
  };

  ChatEventPhotoChanged({
  required this.oldPhoto,
  required this.newPhoto,
  });

  ChatEventPhotoChanged.fromJson(Map<String, dynamic> json) {
    oldPhoto = tryConvertToTdObject(json['old_photo']);
    newPhoto = tryConvertToTdObject(json['new_photo']);
  }
}

@reflector
class ChatEventInvitesToggled extends ChatEventAction {
  @override
  String get tdType => 'chatEventInvitesToggled';

   late bool canInviteUsers;

  @override
  Map<String, dynamic> get params => {
    'can_invite_users': canInviteUsers,
  };

  ChatEventInvitesToggled({
  required this.canInviteUsers,
  });

  ChatEventInvitesToggled.fromJson(Map<String, dynamic> json) {
    canInviteUsers = tryConvertToTdObject(json['can_invite_users']);
  }
}

@reflector
class ChatEventLinkedChatChanged extends ChatEventAction {
  @override
  String get tdType => 'chatEventLinkedChatChanged';

   late int oldLinkedChatId;
   late int newLinkedChatId;

  @override
  Map<String, dynamic> get params => {
    'old_linked_chat_id': oldLinkedChatId,
    'new_linked_chat_id': newLinkedChatId,
  };

  ChatEventLinkedChatChanged({
  required this.oldLinkedChatId,
  required this.newLinkedChatId,
  });

  ChatEventLinkedChatChanged.fromJson(Map<String, dynamic> json) {
    oldLinkedChatId = tryConvertToTdObject(json['old_linked_chat_id']);
    newLinkedChatId = tryConvertToTdObject(json['new_linked_chat_id']);
  }
}

@reflector
class ChatEventSlowModeDelayChanged extends ChatEventAction {
  @override
  String get tdType => 'chatEventSlowModeDelayChanged';

   late int oldSlowModeDelay;
   late int newSlowModeDelay;

  @override
  Map<String, dynamic> get params => {
    'old_slow_mode_delay': oldSlowModeDelay,
    'new_slow_mode_delay': newSlowModeDelay,
  };

  ChatEventSlowModeDelayChanged({
  required this.oldSlowModeDelay,
  required this.newSlowModeDelay,
  });

  ChatEventSlowModeDelayChanged.fromJson(Map<String, dynamic> json) {
    oldSlowModeDelay = tryConvertToTdObject(json['old_slow_mode_delay']);
    newSlowModeDelay = tryConvertToTdObject(json['new_slow_mode_delay']);
  }
}

@reflector
class ChatEventMessageTtlSettingChanged extends ChatEventAction {
  @override
  String get tdType => 'chatEventMessageTtlSettingChanged';

   late int oldMessageTtlSetting;
   late int newMessageTtlSetting;

  @override
  Map<String, dynamic> get params => {
    'old_message_ttl_setting': oldMessageTtlSetting,
    'new_message_ttl_setting': newMessageTtlSetting,
  };

  ChatEventMessageTtlSettingChanged({
  required this.oldMessageTtlSetting,
  required this.newMessageTtlSetting,
  });

  ChatEventMessageTtlSettingChanged.fromJson(Map<String, dynamic> json) {
    oldMessageTtlSetting = tryConvertToTdObject(json['old_message_ttl_setting']);
    newMessageTtlSetting = tryConvertToTdObject(json['new_message_ttl_setting']);
  }
}

@reflector
class ChatEventSignMessagesToggled extends ChatEventAction {
  @override
  String get tdType => 'chatEventSignMessagesToggled';

   late bool signMessages;

  @override
  Map<String, dynamic> get params => {
    'sign_messages': signMessages,
  };

  ChatEventSignMessagesToggled({
  required this.signMessages,
  });

  ChatEventSignMessagesToggled.fromJson(Map<String, dynamic> json) {
    signMessages = tryConvertToTdObject(json['sign_messages']);
  }
}

@reflector
class ChatEventStickerSetChanged extends ChatEventAction {
  @override
  String get tdType => 'chatEventStickerSetChanged';

   late int oldStickerSetId;
   late int newStickerSetId;

  @override
  Map<String, dynamic> get params => {
    'old_sticker_set_id': oldStickerSetId,
    'new_sticker_set_id': newStickerSetId,
  };

  ChatEventStickerSetChanged({
  required this.oldStickerSetId,
  required this.newStickerSetId,
  });

  ChatEventStickerSetChanged.fromJson(Map<String, dynamic> json) {
    oldStickerSetId = tryConvertToTdObject(json['old_sticker_set_id']);
    newStickerSetId = tryConvertToTdObject(json['new_sticker_set_id']);
  }
}

@reflector
class ChatEventLocationChanged extends ChatEventAction {
  @override
  String get tdType => 'chatEventLocationChanged';

   late ChatLocation oldLocation;
   late ChatLocation newLocation;

  @override
  Map<String, dynamic> get params => {
    'old_location': oldLocation,
    'new_location': newLocation,
  };

  ChatEventLocationChanged({
  required this.oldLocation,
  required this.newLocation,
  });

  ChatEventLocationChanged.fromJson(Map<String, dynamic> json) {
    oldLocation = tryConvertToTdObject(json['old_location']);
    newLocation = tryConvertToTdObject(json['new_location']);
  }
}

@reflector
class ChatEventIsAllHistoryAvailableToggled extends ChatEventAction {
  @override
  String get tdType => 'chatEventIsAllHistoryAvailableToggled';

   late bool isAllHistoryAvailable;

  @override
  Map<String, dynamic> get params => {
    'is_all_history_available': isAllHistoryAvailable,
  };

  ChatEventIsAllHistoryAvailableToggled({
  required this.isAllHistoryAvailable,
  });

  ChatEventIsAllHistoryAvailableToggled.fromJson(Map<String, dynamic> json) {
    isAllHistoryAvailable = tryConvertToTdObject(json['is_all_history_available']);
  }
}

@reflector
class ChatEventInviteLinkEdited extends ChatEventAction {
  @override
  String get tdType => 'chatEventInviteLinkEdited';

   late ChatInviteLink oldInviteLink;
   late ChatInviteLink newInviteLink;

  @override
  Map<String, dynamic> get params => {
    'old_invite_link': oldInviteLink,
    'new_invite_link': newInviteLink,
  };

  ChatEventInviteLinkEdited({
  required this.oldInviteLink,
  required this.newInviteLink,
  });

  ChatEventInviteLinkEdited.fromJson(Map<String, dynamic> json) {
    oldInviteLink = tryConvertToTdObject(json['old_invite_link']);
    newInviteLink = tryConvertToTdObject(json['new_invite_link']);
  }
}

@reflector
class ChatEventInviteLinkRevoked extends ChatEventAction {
  @override
  String get tdType => 'chatEventInviteLinkRevoked';

   late ChatInviteLink inviteLink;

  @override
  Map<String, dynamic> get params => {
    'invite_link': inviteLink,
  };

  ChatEventInviteLinkRevoked({
  required this.inviteLink,
  });

  ChatEventInviteLinkRevoked.fromJson(Map<String, dynamic> json) {
    inviteLink = tryConvertToTdObject(json['invite_link']);
  }
}

@reflector
class ChatEventInviteLinkDeleted extends ChatEventAction {
  @override
  String get tdType => 'chatEventInviteLinkDeleted';

   late ChatInviteLink inviteLink;

  @override
  Map<String, dynamic> get params => {
    'invite_link': inviteLink,
  };

  ChatEventInviteLinkDeleted({
  required this.inviteLink,
  });

  ChatEventInviteLinkDeleted.fromJson(Map<String, dynamic> json) {
    inviteLink = tryConvertToTdObject(json['invite_link']);
  }
}

@reflector
class ChatEventVoiceChatCreated extends ChatEventAction {
  @override
  String get tdType => 'chatEventVoiceChatCreated';

   late int groupCallId;

  @override
  Map<String, dynamic> get params => {
    'group_call_id': groupCallId,
  };

  ChatEventVoiceChatCreated({
  required this.groupCallId,
  });

  ChatEventVoiceChatCreated.fromJson(Map<String, dynamic> json) {
    groupCallId = tryConvertToTdObject(json['group_call_id']);
  }
}

@reflector
class ChatEventVoiceChatDiscarded extends ChatEventAction {
  @override
  String get tdType => 'chatEventVoiceChatDiscarded';

   late int groupCallId;

  @override
  Map<String, dynamic> get params => {
    'group_call_id': groupCallId,
  };

  ChatEventVoiceChatDiscarded({
  required this.groupCallId,
  });

  ChatEventVoiceChatDiscarded.fromJson(Map<String, dynamic> json) {
    groupCallId = tryConvertToTdObject(json['group_call_id']);
  }
}

@reflector
class ChatEventVoiceChatParticipantIsMutedToggled extends ChatEventAction {
  @override
  String get tdType => 'chatEventVoiceChatParticipantIsMutedToggled';

   late MessageSender participantId;
   late bool isMuted;

  @override
  Map<String, dynamic> get params => {
    'participant_id': participantId,
    'is_muted': isMuted,
  };

  ChatEventVoiceChatParticipantIsMutedToggled({
  required this.participantId,
  required this.isMuted,
  });

  ChatEventVoiceChatParticipantIsMutedToggled.fromJson(Map<String, dynamic> json) {
    participantId = tryConvertToTdObject(json['participant_id']);
    isMuted = tryConvertToTdObject(json['is_muted']);
  }
}

@reflector
class ChatEventVoiceChatParticipantVolumeLevelChanged extends ChatEventAction {
  @override
  String get tdType => 'chatEventVoiceChatParticipantVolumeLevelChanged';

   late MessageSender participantId;
   late int volumeLevel;

  @override
  Map<String, dynamic> get params => {
    'participant_id': participantId,
    'volume_level': volumeLevel,
  };

  ChatEventVoiceChatParticipantVolumeLevelChanged({
  required this.participantId,
  required this.volumeLevel,
  });

  ChatEventVoiceChatParticipantVolumeLevelChanged.fromJson(Map<String, dynamic> json) {
    participantId = tryConvertToTdObject(json['participant_id']);
    volumeLevel = tryConvertToTdObject(json['volume_level']);
  }
}

@reflector
class ChatEventVoiceChatMuteNewParticipantsToggled extends ChatEventAction {
  @override
  String get tdType => 'chatEventVoiceChatMuteNewParticipantsToggled';

   late bool muteNewParticipants;

  @override
  Map<String, dynamic> get params => {
    'mute_new_participants': muteNewParticipants,
  };

  ChatEventVoiceChatMuteNewParticipantsToggled({
  required this.muteNewParticipants,
  });

  ChatEventVoiceChatMuteNewParticipantsToggled.fromJson(Map<String, dynamic> json) {
    muteNewParticipants = tryConvertToTdObject(json['mute_new_participants']);
  }
}

@reflector
class ChatEvent extends TdObject {
  @override
  String get tdType => 'chatEvent';

   late int id;
   late int date;
   late int userId;
   late ChatEventAction action;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'date': date,
    'user_id': userId,
    'action': action,
  };

  ChatEvent({
  required this.id,
  required this.date,
  required this.userId,
  required this.action,
  });

  ChatEvent.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    date = tryConvertToTdObject(json['date']);
    userId = tryConvertToTdObject(json['user_id']);
    action = tryConvertToTdObject(json['action']);
  }
}

@reflector
class ChatEvents extends TdObject {
  @override
  String get tdType => 'chatEvents';

   late List<ChatEvent> events;

  @override
  Map<String, dynamic> get params => {
    'events': events,
  };

  ChatEvents({
  required this.events,
  });

  ChatEvents.fromJson(Map<String, dynamic> json) {
    events = tryConvertToTdObject(json['events']);
  }
}

@reflector
class ChatEventLogFilters extends TdObject {
  @override
  String get tdType => 'chatEventLogFilters';

   late bool messageEdits;
   late bool messageDeletions;
   late bool messagePins;
   late bool memberJoins;
   late bool memberLeaves;
   late bool memberInvites;
   late bool memberPromotions;
   late bool memberRestrictions;
   late bool infoChanges;
   late bool settingChanges;
   late bool inviteLinkChanges;
   late bool voiceChatChanges;

  @override
  Map<String, dynamic> get params => {
    'message_edits': messageEdits,
    'message_deletions': messageDeletions,
    'message_pins': messagePins,
    'member_joins': memberJoins,
    'member_leaves': memberLeaves,
    'member_invites': memberInvites,
    'member_promotions': memberPromotions,
    'member_restrictions': memberRestrictions,
    'info_changes': infoChanges,
    'setting_changes': settingChanges,
    'invite_link_changes': inviteLinkChanges,
    'voice_chat_changes': voiceChatChanges,
  };

  ChatEventLogFilters({
  required this.messageEdits,
  required this.messageDeletions,
  required this.messagePins,
  required this.memberJoins,
  required this.memberLeaves,
  required this.memberInvites,
  required this.memberPromotions,
  required this.memberRestrictions,
  required this.infoChanges,
  required this.settingChanges,
  required this.inviteLinkChanges,
  required this.voiceChatChanges,
  });

  ChatEventLogFilters.fromJson(Map<String, dynamic> json) {
    messageEdits = tryConvertToTdObject(json['message_edits']);
    messageDeletions = tryConvertToTdObject(json['message_deletions']);
    messagePins = tryConvertToTdObject(json['message_pins']);
    memberJoins = tryConvertToTdObject(json['member_joins']);
    memberLeaves = tryConvertToTdObject(json['member_leaves']);
    memberInvites = tryConvertToTdObject(json['member_invites']);
    memberPromotions = tryConvertToTdObject(json['member_promotions']);
    memberRestrictions = tryConvertToTdObject(json['member_restrictions']);
    infoChanges = tryConvertToTdObject(json['info_changes']);
    settingChanges = tryConvertToTdObject(json['setting_changes']);
    inviteLinkChanges = tryConvertToTdObject(json['invite_link_changes']);
    voiceChatChanges = tryConvertToTdObject(json['voice_chat_changes']);
  }
}

abstract class LanguagePackStringValue extends TdObject {}

@reflector
class LanguagePackStringValueOrdinary extends LanguagePackStringValue {
  @override
  String get tdType => 'languagePackStringValueOrdinary';

   late String value;

  @override
  Map<String, dynamic> get params => {
    'value': value,
  };

  LanguagePackStringValueOrdinary({
  required this.value,
  });

  LanguagePackStringValueOrdinary.fromJson(Map<String, dynamic> json) {
    value = tryConvertToTdObject(json['value']);
  }
}

@reflector
class LanguagePackStringValuePluralized extends LanguagePackStringValue {
  @override
  String get tdType => 'languagePackStringValuePluralized';

   late String zeroValue;
   late String oneValue;
   late String twoValue;
   late String fewValue;
   late String manyValue;
   late String otherValue;

  @override
  Map<String, dynamic> get params => {
    'zero_value': zeroValue,
    'one_value': oneValue,
    'two_value': twoValue,
    'few_value': fewValue,
    'many_value': manyValue,
    'other_value': otherValue,
  };

  LanguagePackStringValuePluralized({
  required this.zeroValue,
  required this.oneValue,
  required this.twoValue,
  required this.fewValue,
  required this.manyValue,
  required this.otherValue,
  });

  LanguagePackStringValuePluralized.fromJson(Map<String, dynamic> json) {
    zeroValue = tryConvertToTdObject(json['zero_value']);
    oneValue = tryConvertToTdObject(json['one_value']);
    twoValue = tryConvertToTdObject(json['two_value']);
    fewValue = tryConvertToTdObject(json['few_value']);
    manyValue = tryConvertToTdObject(json['many_value']);
    otherValue = tryConvertToTdObject(json['other_value']);
  }
}

@reflector
class LanguagePackStringValueDeleted extends LanguagePackStringValue {
  @override
  String get tdType => 'languagePackStringValueDeleted';

  @override
  Map<String, dynamic> get params => {};

  LanguagePackStringValueDeleted();

  LanguagePackStringValueDeleted.fromJson(Map<String, dynamic> json);
}

@reflector
class LanguagePackString extends TdObject {
  @override
  String get tdType => 'languagePackString';

   late String key;
   late LanguagePackStringValue value;

  @override
  Map<String, dynamic> get params => {
    'key': key,
    'value': value,
  };

  LanguagePackString({
  required this.key,
  required this.value,
  });

  LanguagePackString.fromJson(Map<String, dynamic> json) {
    key = tryConvertToTdObject(json['key']);
    value = tryConvertToTdObject(json['value']);
  }
}

@reflector
class LanguagePackStrings extends TdObject {
  @override
  String get tdType => 'languagePackStrings';

   late List<LanguagePackString> strings;

  @override
  Map<String, dynamic> get params => {
    'strings': strings,
  };

  LanguagePackStrings({
  required this.strings,
  });

  LanguagePackStrings.fromJson(Map<String, dynamic> json) {
    strings = tryConvertToTdObject(json['strings']);
  }
}

@reflector
class LanguagePackInfo extends TdObject {
  @override
  String get tdType => 'languagePackInfo';

   late String id;
   late String baseLanguagePackId;
   late String name;
   late String nativeName;
   late String pluralCode;
   late bool isOfficial;
   late bool isRtl;
   late bool isBeta;
   late bool isInstalled;
   late int totalStringCount;
   late int translatedStringCount;
   late int localStringCount;
   late String translationUrl;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'base_language_pack_id': baseLanguagePackId,
    'name': name,
    'native_name': nativeName,
    'plural_code': pluralCode,
    'is_official': isOfficial,
    'is_rtl': isRtl,
    'is_beta': isBeta,
    'is_installed': isInstalled,
    'total_string_count': totalStringCount,
    'translated_string_count': translatedStringCount,
    'local_string_count': localStringCount,
    'translation_url': translationUrl,
  };

  LanguagePackInfo({
  required this.id,
  required this.baseLanguagePackId,
  required this.name,
  required this.nativeName,
  required this.pluralCode,
  required this.isOfficial,
  required this.isRtl,
  required this.isBeta,
  required this.isInstalled,
  required this.totalStringCount,
  required this.translatedStringCount,
  required this.localStringCount,
  required this.translationUrl,
  });

  LanguagePackInfo.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    baseLanguagePackId = tryConvertToTdObject(json['base_language_pack_id']);
    name = tryConvertToTdObject(json['name']);
    nativeName = tryConvertToTdObject(json['native_name']);
    pluralCode = tryConvertToTdObject(json['plural_code']);
    isOfficial = tryConvertToTdObject(json['is_official']);
    isRtl = tryConvertToTdObject(json['is_rtl']);
    isBeta = tryConvertToTdObject(json['is_beta']);
    isInstalled = tryConvertToTdObject(json['is_installed']);
    totalStringCount = tryConvertToTdObject(json['total_string_count']);
    translatedStringCount = tryConvertToTdObject(json['translated_string_count']);
    localStringCount = tryConvertToTdObject(json['local_string_count']);
    translationUrl = tryConvertToTdObject(json['translation_url']);
  }
}

@reflector
class LocalizationTargetInfo extends TdObject {
  @override
  String get tdType => 'localizationTargetInfo';

   late List<LanguagePackInfo> languagePacks;

  @override
  Map<String, dynamic> get params => {
    'language_packs': languagePacks,
  };

  LocalizationTargetInfo({
  required this.languagePacks,
  });

  LocalizationTargetInfo.fromJson(Map<String, dynamic> json) {
    languagePacks = tryConvertToTdObject(json['language_packs']);
  }
}

abstract class DeviceToken extends TdObject {}

@reflector
class DeviceTokenFirebaseCloudMessaging extends DeviceToken {
  @override
  String get tdType => 'deviceTokenFirebaseCloudMessaging';

   late String token;
   late bool encrypt;

  @override
  Map<String, dynamic> get params => {
    'token': token,
    'encrypt': encrypt,
  };

  DeviceTokenFirebaseCloudMessaging({
  required this.token,
  required this.encrypt,
  });

  DeviceTokenFirebaseCloudMessaging.fromJson(Map<String, dynamic> json) {
    token = tryConvertToTdObject(json['token']);
    encrypt = tryConvertToTdObject(json['encrypt']);
  }
}

@reflector
class DeviceTokenApplePush extends DeviceToken {
  @override
  String get tdType => 'deviceTokenApplePush';

   late String deviceToken;
   late bool isAppSandbox;

  @override
  Map<String, dynamic> get params => {
    'device_token': deviceToken,
    'is_app_sandbox': isAppSandbox,
  };

  DeviceTokenApplePush({
  required this.deviceToken,
  required this.isAppSandbox,
  });

  DeviceTokenApplePush.fromJson(Map<String, dynamic> json) {
    deviceToken = tryConvertToTdObject(json['device_token']);
    isAppSandbox = tryConvertToTdObject(json['is_app_sandbox']);
  }
}

@reflector
class DeviceTokenApplePushVoIP extends DeviceToken {
  @override
  String get tdType => 'deviceTokenApplePushVoIP';

   late String deviceToken;
   late bool isAppSandbox;
   late bool encrypt;

  @override
  Map<String, dynamic> get params => {
    'device_token': deviceToken,
    'is_app_sandbox': isAppSandbox,
    'encrypt': encrypt,
  };

  DeviceTokenApplePushVoIP({
  required this.deviceToken,
  required this.isAppSandbox,
  required this.encrypt,
  });

  DeviceTokenApplePushVoIP.fromJson(Map<String, dynamic> json) {
    deviceToken = tryConvertToTdObject(json['device_token']);
    isAppSandbox = tryConvertToTdObject(json['is_app_sandbox']);
    encrypt = tryConvertToTdObject(json['encrypt']);
  }
}

@reflector
class DeviceTokenWindowsPush extends DeviceToken {
  @override
  String get tdType => 'deviceTokenWindowsPush';

   late String accessToken;

  @override
  Map<String, dynamic> get params => {
    'access_token': accessToken,
  };

  DeviceTokenWindowsPush({
  required this.accessToken,
  });

  DeviceTokenWindowsPush.fromJson(Map<String, dynamic> json) {
    accessToken = tryConvertToTdObject(json['access_token']);
  }
}

@reflector
class DeviceTokenMicrosoftPush extends DeviceToken {
  @override
  String get tdType => 'deviceTokenMicrosoftPush';

   late String channelUri;

  @override
  Map<String, dynamic> get params => {
    'channel_uri': channelUri,
  };

  DeviceTokenMicrosoftPush({
  required this.channelUri,
  });

  DeviceTokenMicrosoftPush.fromJson(Map<String, dynamic> json) {
    channelUri = tryConvertToTdObject(json['channel_uri']);
  }
}

@reflector
class DeviceTokenMicrosoftPushVoIP extends DeviceToken {
  @override
  String get tdType => 'deviceTokenMicrosoftPushVoIP';

   late String channelUri;

  @override
  Map<String, dynamic> get params => {
    'channel_uri': channelUri,
  };

  DeviceTokenMicrosoftPushVoIP({
  required this.channelUri,
  });

  DeviceTokenMicrosoftPushVoIP.fromJson(Map<String, dynamic> json) {
    channelUri = tryConvertToTdObject(json['channel_uri']);
  }
}

@reflector
class DeviceTokenWebPush extends DeviceToken {
  @override
  String get tdType => 'deviceTokenWebPush';

   late String endpoint;
   late String p256dhBase64url;
   late String authBase64url;

  @override
  Map<String, dynamic> get params => {
    'endpoint': endpoint,
    'p256dh_base64url': p256dhBase64url,
    'auth_base64url': authBase64url,
  };

  DeviceTokenWebPush({
  required this.endpoint,
  required this.p256dhBase64url,
  required this.authBase64url,
  });

  DeviceTokenWebPush.fromJson(Map<String, dynamic> json) {
    endpoint = tryConvertToTdObject(json['endpoint']);
    p256dhBase64url = tryConvertToTdObject(json['p256dh_base64url']);
    authBase64url = tryConvertToTdObject(json['auth_base64url']);
  }
}

@reflector
class DeviceTokenSimplePush extends DeviceToken {
  @override
  String get tdType => 'deviceTokenSimplePush';

   late String endpoint;

  @override
  Map<String, dynamic> get params => {
    'endpoint': endpoint,
  };

  DeviceTokenSimplePush({
  required this.endpoint,
  });

  DeviceTokenSimplePush.fromJson(Map<String, dynamic> json) {
    endpoint = tryConvertToTdObject(json['endpoint']);
  }
}

@reflector
class DeviceTokenUbuntuPush extends DeviceToken {
  @override
  String get tdType => 'deviceTokenUbuntuPush';

   late String token;

  @override
  Map<String, dynamic> get params => {
    'token': token,
  };

  DeviceTokenUbuntuPush({
  required this.token,
  });

  DeviceTokenUbuntuPush.fromJson(Map<String, dynamic> json) {
    token = tryConvertToTdObject(json['token']);
  }
}

@reflector
class DeviceTokenBlackBerryPush extends DeviceToken {
  @override
  String get tdType => 'deviceTokenBlackBerryPush';

   late String token;

  @override
  Map<String, dynamic> get params => {
    'token': token,
  };

  DeviceTokenBlackBerryPush({
  required this.token,
  });

  DeviceTokenBlackBerryPush.fromJson(Map<String, dynamic> json) {
    token = tryConvertToTdObject(json['token']);
  }
}

@reflector
class DeviceTokenTizenPush extends DeviceToken {
  @override
  String get tdType => 'deviceTokenTizenPush';

   late String regId;

  @override
  Map<String, dynamic> get params => {
    'reg_id': regId,
  };

  DeviceTokenTizenPush({
  required this.regId,
  });

  DeviceTokenTizenPush.fromJson(Map<String, dynamic> json) {
    regId = tryConvertToTdObject(json['reg_id']);
  }
}

@reflector
class PushReceiverId extends TdObject {
  @override
  String get tdType => 'pushReceiverId';

   late int id;

  @override
  Map<String, dynamic> get params => {
    'id': id,
  };

  PushReceiverId({
  required this.id,
  });

  PushReceiverId.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
  }
}

abstract class BackgroundFill extends TdObject {}

@reflector
class BackgroundFillSolid extends BackgroundFill {
  @override
  String get tdType => 'backgroundFillSolid';

   late int color;

  @override
  Map<String, dynamic> get params => {
    'color': color,
  };

  BackgroundFillSolid({
  required this.color,
  });

  BackgroundFillSolid.fromJson(Map<String, dynamic> json) {
    color = tryConvertToTdObject(json['color']);
  }
}

@reflector
class BackgroundFillGradient extends BackgroundFill {
  @override
  String get tdType => 'backgroundFillGradient';

   late int topColor;
   late int bottomColor;
   late int rotationAngle;

  @override
  Map<String, dynamic> get params => {
    'top_color': topColor,
    'bottom_color': bottomColor,
    'rotation_angle': rotationAngle,
  };

  BackgroundFillGradient({
  required this.topColor,
  required this.bottomColor,
  required this.rotationAngle,
  });

  BackgroundFillGradient.fromJson(Map<String, dynamic> json) {
    topColor = tryConvertToTdObject(json['top_color']);
    bottomColor = tryConvertToTdObject(json['bottom_color']);
    rotationAngle = tryConvertToTdObject(json['rotation_angle']);
  }
}

@reflector
class BackgroundFillFreeformGradient extends BackgroundFill {
  @override
  String get tdType => 'backgroundFillFreeformGradient';

   late List<int> colors;

  @override
  Map<String, dynamic> get params => {
    'colors': colors,
  };

  BackgroundFillFreeformGradient({
  required this.colors,
  });

  BackgroundFillFreeformGradient.fromJson(Map<String, dynamic> json) {
    colors = tryConvertToTdObject(json['colors']);
  }
}

abstract class BackgroundType extends TdObject {}

@reflector
class BackgroundTypeWallpaper extends BackgroundType {
  @override
  String get tdType => 'backgroundTypeWallpaper';

   late bool isBlurred;
   late bool isMoving;

  @override
  Map<String, dynamic> get params => {
    'is_blurred': isBlurred,
    'is_moving': isMoving,
  };

  BackgroundTypeWallpaper({
  required this.isBlurred,
  required this.isMoving,
  });

  BackgroundTypeWallpaper.fromJson(Map<String, dynamic> json) {
    isBlurred = tryConvertToTdObject(json['is_blurred']);
    isMoving = tryConvertToTdObject(json['is_moving']);
  }
}

@reflector
class BackgroundTypePattern extends BackgroundType {
  @override
  String get tdType => 'backgroundTypePattern';

   late BackgroundFill fill;
   late int intensity;
   late bool isInverted;
   late bool isMoving;

  @override
  Map<String, dynamic> get params => {
    'fill': fill,
    'intensity': intensity,
    'is_inverted': isInverted,
    'is_moving': isMoving,
  };

  BackgroundTypePattern({
  required this.fill,
  required this.intensity,
  required this.isInverted,
  required this.isMoving,
  });

  BackgroundTypePattern.fromJson(Map<String, dynamic> json) {
    fill = tryConvertToTdObject(json['fill']);
    intensity = tryConvertToTdObject(json['intensity']);
    isInverted = tryConvertToTdObject(json['is_inverted']);
    isMoving = tryConvertToTdObject(json['is_moving']);
  }
}

@reflector
class BackgroundTypeFill extends BackgroundType {
  @override
  String get tdType => 'backgroundTypeFill';

   late BackgroundFill fill;

  @override
  Map<String, dynamic> get params => {
    'fill': fill,
  };

  BackgroundTypeFill({
  required this.fill,
  });

  BackgroundTypeFill.fromJson(Map<String, dynamic> json) {
    fill = tryConvertToTdObject(json['fill']);
  }
}

@reflector
class Background extends TdObject {
  @override
  String get tdType => 'background';

   late int id;
   late bool isDefault;
   late bool isDark;
   late String name;
   late Document document;
   late BackgroundType type;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'is_default': isDefault,
    'is_dark': isDark,
    'name': name,
    'document': document,
    'type': type,
  };

  Background({
  required this.id,
  required this.isDefault,
  required this.isDark,
  required this.name,
  required this.document,
  required this.type,
  });

  Background.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    isDefault = tryConvertToTdObject(json['is_default']);
    isDark = tryConvertToTdObject(json['is_dark']);
    name = tryConvertToTdObject(json['name']);
    document = tryConvertToTdObject(json['document']);
    type = tryConvertToTdObject(json['type']);
  }
}

@reflector
class Backgrounds extends TdObject {
  @override
  String get tdType => 'backgrounds';

   late List<Background> backgrounds;

  @override
  Map<String, dynamic> get params => {
    'backgrounds': backgrounds,
  };

  Backgrounds({
  required this.backgrounds,
  });

  Backgrounds.fromJson(Map<String, dynamic> json) {
    backgrounds = tryConvertToTdObject(json['backgrounds']);
  }
}

abstract class InputBackground extends TdObject {}

@reflector
class InputBackgroundLocal extends InputBackground {
  @override
  String get tdType => 'inputBackgroundLocal';

   late InputFile background;

  @override
  Map<String, dynamic> get params => {
    'background': background,
  };

  InputBackgroundLocal({
  required this.background,
  });

  InputBackgroundLocal.fromJson(Map<String, dynamic> json) {
    background = tryConvertToTdObject(json['background']);
  }
}

@reflector
class InputBackgroundRemote extends InputBackground {
  @override
  String get tdType => 'inputBackgroundRemote';

   late int backgroundId;

  @override
  Map<String, dynamic> get params => {
    'background_id': backgroundId,
  };

  InputBackgroundRemote({
  required this.backgroundId,
  });

  InputBackgroundRemote.fromJson(Map<String, dynamic> json) {
    backgroundId = tryConvertToTdObject(json['background_id']);
  }
}

@reflector
class ThemeSettings extends TdObject {
  @override
  String get tdType => 'themeSettings';

   late int accentColor;
   late Background background;
   late BackgroundFill outgoingMessageFill;
   late bool animateOutgoingMessageFill;
   late int outgoingMessageAccentColor;

  @override
  Map<String, dynamic> get params => {
    'accent_color': accentColor,
    'background': background,
    'outgoing_message_fill': outgoingMessageFill,
    'animate_outgoing_message_fill': animateOutgoingMessageFill,
    'outgoing_message_accent_color': outgoingMessageAccentColor,
  };

  ThemeSettings({
  required this.accentColor,
  required this.background,
  required this.outgoingMessageFill,
  required this.animateOutgoingMessageFill,
  required this.outgoingMessageAccentColor,
  });

  ThemeSettings.fromJson(Map<String, dynamic> json) {
    accentColor = tryConvertToTdObject(json['accent_color']);
    background = tryConvertToTdObject(json['background']);
    outgoingMessageFill = tryConvertToTdObject(json['outgoing_message_fill']);
    animateOutgoingMessageFill = tryConvertToTdObject(json['animate_outgoing_message_fill']);
    outgoingMessageAccentColor = tryConvertToTdObject(json['outgoing_message_accent_color']);
  }
}

@reflector
class ChatTheme extends TdObject {
  @override
  String get tdType => 'chatTheme';

   late String name;
   late ThemeSettings lightSettings;
   late ThemeSettings darkSettings;

  @override
  Map<String, dynamic> get params => {
    'name': name,
    'light_settings': lightSettings,
    'dark_settings': darkSettings,
  };

  ChatTheme({
  required this.name,
  required this.lightSettings,
  required this.darkSettings,
  });

  ChatTheme.fromJson(Map<String, dynamic> json) {
    name = tryConvertToTdObject(json['name']);
    lightSettings = tryConvertToTdObject(json['light_settings']);
    darkSettings = tryConvertToTdObject(json['dark_settings']);
  }
}

@reflector
class Hashtags extends TdObject {
  @override
  String get tdType => 'hashtags';

   late List<String> hashtags;

  @override
  Map<String, dynamic> get params => {
    'hashtags': hashtags,
  };

  Hashtags({
  required this.hashtags,
  });

  Hashtags.fromJson(Map<String, dynamic> json) {
    hashtags = tryConvertToTdObject(json['hashtags']);
  }
}

abstract class CanTransferOwnershipResult extends TdObject {}

@reflector
class CanTransferOwnershipResultOk extends CanTransferOwnershipResult {
  @override
  String get tdType => 'canTransferOwnershipResultOk';

  @override
  Map<String, dynamic> get params => {};

  CanTransferOwnershipResultOk();

  CanTransferOwnershipResultOk.fromJson(Map<String, dynamic> json);
}

@reflector
class CanTransferOwnershipResultPasswordNeeded extends CanTransferOwnershipResult {
  @override
  String get tdType => 'canTransferOwnershipResultPasswordNeeded';

  @override
  Map<String, dynamic> get params => {};

  CanTransferOwnershipResultPasswordNeeded();

  CanTransferOwnershipResultPasswordNeeded.fromJson(Map<String, dynamic> json);
}

@reflector
class CanTransferOwnershipResultPasswordTooFresh extends CanTransferOwnershipResult {
  @override
  String get tdType => 'canTransferOwnershipResultPasswordTooFresh';

   late int retryAfter;

  @override
  Map<String, dynamic> get params => {
    'retry_after': retryAfter,
  };

  CanTransferOwnershipResultPasswordTooFresh({
  required this.retryAfter,
  });

  CanTransferOwnershipResultPasswordTooFresh.fromJson(Map<String, dynamic> json) {
    retryAfter = tryConvertToTdObject(json['retry_after']);
  }
}

@reflector
class CanTransferOwnershipResultSessionTooFresh extends CanTransferOwnershipResult {
  @override
  String get tdType => 'canTransferOwnershipResultSessionTooFresh';

   late int retryAfter;

  @override
  Map<String, dynamic> get params => {
    'retry_after': retryAfter,
  };

  CanTransferOwnershipResultSessionTooFresh({
  required this.retryAfter,
  });

  CanTransferOwnershipResultSessionTooFresh.fromJson(Map<String, dynamic> json) {
    retryAfter = tryConvertToTdObject(json['retry_after']);
  }
}

abstract class CheckChatUsernameResult extends TdObject {}

@reflector
class CheckChatUsernameResultOk extends CheckChatUsernameResult {
  @override
  String get tdType => 'checkChatUsernameResultOk';

  @override
  Map<String, dynamic> get params => {};

  CheckChatUsernameResultOk();

  CheckChatUsernameResultOk.fromJson(Map<String, dynamic> json);
}

@reflector
class CheckChatUsernameResultUsernameInvalid extends CheckChatUsernameResult {
  @override
  String get tdType => 'checkChatUsernameResultUsernameInvalid';

  @override
  Map<String, dynamic> get params => {};

  CheckChatUsernameResultUsernameInvalid();

  CheckChatUsernameResultUsernameInvalid.fromJson(Map<String, dynamic> json);
}

@reflector
class CheckChatUsernameResultUsernameOccupied extends CheckChatUsernameResult {
  @override
  String get tdType => 'checkChatUsernameResultUsernameOccupied';

  @override
  Map<String, dynamic> get params => {};

  CheckChatUsernameResultUsernameOccupied();

  CheckChatUsernameResultUsernameOccupied.fromJson(Map<String, dynamic> json);
}

@reflector
class CheckChatUsernameResultPublicChatsTooMuch extends CheckChatUsernameResult {
  @override
  String get tdType => 'checkChatUsernameResultPublicChatsTooMuch';

  @override
  Map<String, dynamic> get params => {};

  CheckChatUsernameResultPublicChatsTooMuch();

  CheckChatUsernameResultPublicChatsTooMuch.fromJson(Map<String, dynamic> json);
}

@reflector
class CheckChatUsernameResultPublicGroupsUnavailable extends CheckChatUsernameResult {
  @override
  String get tdType => 'checkChatUsernameResultPublicGroupsUnavailable';

  @override
  Map<String, dynamic> get params => {};

  CheckChatUsernameResultPublicGroupsUnavailable();

  CheckChatUsernameResultPublicGroupsUnavailable.fromJson(Map<String, dynamic> json);
}

abstract class CheckStickerSetNameResult extends TdObject {}

@reflector
class CheckStickerSetNameResultOk extends CheckStickerSetNameResult {
  @override
  String get tdType => 'checkStickerSetNameResultOk';

  @override
  Map<String, dynamic> get params => {};

  CheckStickerSetNameResultOk();

  CheckStickerSetNameResultOk.fromJson(Map<String, dynamic> json);
}

@reflector
class CheckStickerSetNameResultNameInvalid extends CheckStickerSetNameResult {
  @override
  String get tdType => 'checkStickerSetNameResultNameInvalid';

  @override
  Map<String, dynamic> get params => {};

  CheckStickerSetNameResultNameInvalid();

  CheckStickerSetNameResultNameInvalid.fromJson(Map<String, dynamic> json);
}

@reflector
class CheckStickerSetNameResultNameOccupied extends CheckStickerSetNameResult {
  @override
  String get tdType => 'checkStickerSetNameResultNameOccupied';

  @override
  Map<String, dynamic> get params => {};

  CheckStickerSetNameResultNameOccupied();

  CheckStickerSetNameResultNameOccupied.fromJson(Map<String, dynamic> json);
}

abstract class ResetPasswordResult extends TdObject {}

@reflector
class ResetPasswordResultOk extends ResetPasswordResult {
  @override
  String get tdType => 'resetPasswordResultOk';

  @override
  Map<String, dynamic> get params => {};

  ResetPasswordResultOk();

  ResetPasswordResultOk.fromJson(Map<String, dynamic> json);
}

@reflector
class ResetPasswordResultPending extends ResetPasswordResult {
  @override
  String get tdType => 'resetPasswordResultPending';

   late int pendingResetDate;

  @override
  Map<String, dynamic> get params => {
    'pending_reset_date': pendingResetDate,
  };

  ResetPasswordResultPending({
  required this.pendingResetDate,
  });

  ResetPasswordResultPending.fromJson(Map<String, dynamic> json) {
    pendingResetDate = tryConvertToTdObject(json['pending_reset_date']);
  }
}

@reflector
class ResetPasswordResultDeclined extends ResetPasswordResult {
  @override
  String get tdType => 'resetPasswordResultDeclined';

   late int retryDate;

  @override
  Map<String, dynamic> get params => {
    'retry_date': retryDate,
  };

  ResetPasswordResultDeclined({
  required this.retryDate,
  });

  ResetPasswordResultDeclined.fromJson(Map<String, dynamic> json) {
    retryDate = tryConvertToTdObject(json['retry_date']);
  }
}

abstract class MessageFileType extends TdObject {}

@reflector
class MessageFileTypePrivate extends MessageFileType {
  @override
  String get tdType => 'messageFileTypePrivate';

   late String name;

  @override
  Map<String, dynamic> get params => {
    'name': name,
  };

  MessageFileTypePrivate({
  required this.name,
  });

  MessageFileTypePrivate.fromJson(Map<String, dynamic> json) {
    name = tryConvertToTdObject(json['name']);
  }
}

@reflector
class MessageFileTypeGroup extends MessageFileType {
  @override
  String get tdType => 'messageFileTypeGroup';

   late String title;

  @override
  Map<String, dynamic> get params => {
    'title': title,
  };

  MessageFileTypeGroup({
  required this.title,
  });

  MessageFileTypeGroup.fromJson(Map<String, dynamic> json) {
    title = tryConvertToTdObject(json['title']);
  }
}

@reflector
class MessageFileTypeUnknown extends MessageFileType {
  @override
  String get tdType => 'messageFileTypeUnknown';

  @override
  Map<String, dynamic> get params => {};

  MessageFileTypeUnknown();

  MessageFileTypeUnknown.fromJson(Map<String, dynamic> json);
}

abstract class PushMessageContent extends TdObject {}

@reflector
class PushMessageContentHidden extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentHidden';

   late bool isPinned;

  @override
  Map<String, dynamic> get params => {
    'is_pinned': isPinned,
  };

  PushMessageContentHidden({
  required this.isPinned,
  });

  PushMessageContentHidden.fromJson(Map<String, dynamic> json) {
    isPinned = tryConvertToTdObject(json['is_pinned']);
  }
}

@reflector
class PushMessageContentAnimation extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentAnimation';

   late Animation animation;
   late String caption;
   late bool isPinned;

  @override
  Map<String, dynamic> get params => {
    'animation': animation,
    'caption': caption,
    'is_pinned': isPinned,
  };

  PushMessageContentAnimation({
  required this.animation,
  required this.caption,
  required this.isPinned,
  });

  PushMessageContentAnimation.fromJson(Map<String, dynamic> json) {
    animation = tryConvertToTdObject(json['animation']);
    caption = tryConvertToTdObject(json['caption']);
    isPinned = tryConvertToTdObject(json['is_pinned']);
  }
}

@reflector
class PushMessageContentAudio extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentAudio';

   late Audio audio;
   late bool isPinned;

  @override
  Map<String, dynamic> get params => {
    'audio': audio,
    'is_pinned': isPinned,
  };

  PushMessageContentAudio({
  required this.audio,
  required this.isPinned,
  });

  PushMessageContentAudio.fromJson(Map<String, dynamic> json) {
    audio = tryConvertToTdObject(json['audio']);
    isPinned = tryConvertToTdObject(json['is_pinned']);
  }
}

@reflector
class PushMessageContentContact extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentContact';

   late String name;
   late bool isPinned;

  @override
  Map<String, dynamic> get params => {
    'name': name,
    'is_pinned': isPinned,
  };

  PushMessageContentContact({
  required this.name,
  required this.isPinned,
  });

  PushMessageContentContact.fromJson(Map<String, dynamic> json) {
    name = tryConvertToTdObject(json['name']);
    isPinned = tryConvertToTdObject(json['is_pinned']);
  }
}

@reflector
class PushMessageContentContactRegistered extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentContactRegistered';

  @override
  Map<String, dynamic> get params => {};

  PushMessageContentContactRegistered();

  PushMessageContentContactRegistered.fromJson(Map<String, dynamic> json);
}

@reflector
class PushMessageContentDocument extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentDocument';

   late Document document;
   late bool isPinned;

  @override
  Map<String, dynamic> get params => {
    'document': document,
    'is_pinned': isPinned,
  };

  PushMessageContentDocument({
  required this.document,
  required this.isPinned,
  });

  PushMessageContentDocument.fromJson(Map<String, dynamic> json) {
    document = tryConvertToTdObject(json['document']);
    isPinned = tryConvertToTdObject(json['is_pinned']);
  }
}

@reflector
class PushMessageContentGame extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentGame';

   late String title;
   late bool isPinned;

  @override
  Map<String, dynamic> get params => {
    'title': title,
    'is_pinned': isPinned,
  };

  PushMessageContentGame({
  required this.title,
  required this.isPinned,
  });

  PushMessageContentGame.fromJson(Map<String, dynamic> json) {
    title = tryConvertToTdObject(json['title']);
    isPinned = tryConvertToTdObject(json['is_pinned']);
  }
}

@reflector
class PushMessageContentGameScore extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentGameScore';

   late String title;
   late int score;
   late bool isPinned;

  @override
  Map<String, dynamic> get params => {
    'title': title,
    'score': score,
    'is_pinned': isPinned,
  };

  PushMessageContentGameScore({
  required this.title,
  required this.score,
  required this.isPinned,
  });

  PushMessageContentGameScore.fromJson(Map<String, dynamic> json) {
    title = tryConvertToTdObject(json['title']);
    score = tryConvertToTdObject(json['score']);
    isPinned = tryConvertToTdObject(json['is_pinned']);
  }
}

@reflector
class PushMessageContentInvoice extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentInvoice';

   late String price;
   late bool isPinned;

  @override
  Map<String, dynamic> get params => {
    'price': price,
    'is_pinned': isPinned,
  };

  PushMessageContentInvoice({
  required this.price,
  required this.isPinned,
  });

  PushMessageContentInvoice.fromJson(Map<String, dynamic> json) {
    price = tryConvertToTdObject(json['price']);
    isPinned = tryConvertToTdObject(json['is_pinned']);
  }
}

@reflector
class PushMessageContentLocation extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentLocation';

   late bool isLive;
   late bool isPinned;

  @override
  Map<String, dynamic> get params => {
    'is_live': isLive,
    'is_pinned': isPinned,
  };

  PushMessageContentLocation({
  required this.isLive,
  required this.isPinned,
  });

  PushMessageContentLocation.fromJson(Map<String, dynamic> json) {
    isLive = tryConvertToTdObject(json['is_live']);
    isPinned = tryConvertToTdObject(json['is_pinned']);
  }
}

@reflector
class PushMessageContentPhoto extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentPhoto';

   late Photo photo;
   late String caption;
   late bool isSecret;
   late bool isPinned;

  @override
  Map<String, dynamic> get params => {
    'photo': photo,
    'caption': caption,
    'is_secret': isSecret,
    'is_pinned': isPinned,
  };

  PushMessageContentPhoto({
  required this.photo,
  required this.caption,
  required this.isSecret,
  required this.isPinned,
  });

  PushMessageContentPhoto.fromJson(Map<String, dynamic> json) {
    photo = tryConvertToTdObject(json['photo']);
    caption = tryConvertToTdObject(json['caption']);
    isSecret = tryConvertToTdObject(json['is_secret']);
    isPinned = tryConvertToTdObject(json['is_pinned']);
  }
}

@reflector
class PushMessageContentPoll extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentPoll';

   late String question;
   late bool isRegular;
   late bool isPinned;

  @override
  Map<String, dynamic> get params => {
    'question': question,
    'is_regular': isRegular,
    'is_pinned': isPinned,
  };

  PushMessageContentPoll({
  required this.question,
  required this.isRegular,
  required this.isPinned,
  });

  PushMessageContentPoll.fromJson(Map<String, dynamic> json) {
    question = tryConvertToTdObject(json['question']);
    isRegular = tryConvertToTdObject(json['is_regular']);
    isPinned = tryConvertToTdObject(json['is_pinned']);
  }
}

@reflector
class PushMessageContentScreenshotTaken extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentScreenshotTaken';

  @override
  Map<String, dynamic> get params => {};

  PushMessageContentScreenshotTaken();

  PushMessageContentScreenshotTaken.fromJson(Map<String, dynamic> json);
}

@reflector
class PushMessageContentSticker extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentSticker';

   late Sticker sticker;
   late String emoji;
   late bool isPinned;

  @override
  Map<String, dynamic> get params => {
    'sticker': sticker,
    'emoji': emoji,
    'is_pinned': isPinned,
  };

  PushMessageContentSticker({
  required this.sticker,
  required this.emoji,
  required this.isPinned,
  });

  PushMessageContentSticker.fromJson(Map<String, dynamic> json) {
    sticker = tryConvertToTdObject(json['sticker']);
    emoji = tryConvertToTdObject(json['emoji']);
    isPinned = tryConvertToTdObject(json['is_pinned']);
  }
}

@reflector
class PushMessageContentText extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentText';

   late String text;
   late bool isPinned;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'is_pinned': isPinned,
  };

  PushMessageContentText({
  required this.text,
  required this.isPinned,
  });

  PushMessageContentText.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    isPinned = tryConvertToTdObject(json['is_pinned']);
  }
}

@reflector
class PushMessageContentVideo extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentVideo';

   late Video video;
   late String caption;
   late bool isSecret;
   late bool isPinned;

  @override
  Map<String, dynamic> get params => {
    'video': video,
    'caption': caption,
    'is_secret': isSecret,
    'is_pinned': isPinned,
  };

  PushMessageContentVideo({
  required this.video,
  required this.caption,
  required this.isSecret,
  required this.isPinned,
  });

  PushMessageContentVideo.fromJson(Map<String, dynamic> json) {
    video = tryConvertToTdObject(json['video']);
    caption = tryConvertToTdObject(json['caption']);
    isSecret = tryConvertToTdObject(json['is_secret']);
    isPinned = tryConvertToTdObject(json['is_pinned']);
  }
}

@reflector
class PushMessageContentVideoNote extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentVideoNote';

   late VideoNote videoNote;
   late bool isPinned;

  @override
  Map<String, dynamic> get params => {
    'video_note': videoNote,
    'is_pinned': isPinned,
  };

  PushMessageContentVideoNote({
  required this.videoNote,
  required this.isPinned,
  });

  PushMessageContentVideoNote.fromJson(Map<String, dynamic> json) {
    videoNote = tryConvertToTdObject(json['video_note']);
    isPinned = tryConvertToTdObject(json['is_pinned']);
  }
}

@reflector
class PushMessageContentVoiceNote extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentVoiceNote';

   late VoiceNote voiceNote;
   late bool isPinned;

  @override
  Map<String, dynamic> get params => {
    'voice_note': voiceNote,
    'is_pinned': isPinned,
  };

  PushMessageContentVoiceNote({
  required this.voiceNote,
  required this.isPinned,
  });

  PushMessageContentVoiceNote.fromJson(Map<String, dynamic> json) {
    voiceNote = tryConvertToTdObject(json['voice_note']);
    isPinned = tryConvertToTdObject(json['is_pinned']);
  }
}

@reflector
class PushMessageContentBasicGroupChatCreate extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentBasicGroupChatCreate';

  @override
  Map<String, dynamic> get params => {};

  PushMessageContentBasicGroupChatCreate();

  PushMessageContentBasicGroupChatCreate.fromJson(Map<String, dynamic> json);
}

@reflector
class PushMessageContentChatAddMembers extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentChatAddMembers';

   late String memberName;
   late bool isCurrentUser;
   late bool isReturned;

  @override
  Map<String, dynamic> get params => {
    'member_name': memberName,
    'is_current_user': isCurrentUser,
    'is_returned': isReturned,
  };

  PushMessageContentChatAddMembers({
  required this.memberName,
  required this.isCurrentUser,
  required this.isReturned,
  });

  PushMessageContentChatAddMembers.fromJson(Map<String, dynamic> json) {
    memberName = tryConvertToTdObject(json['member_name']);
    isCurrentUser = tryConvertToTdObject(json['is_current_user']);
    isReturned = tryConvertToTdObject(json['is_returned']);
  }
}

@reflector
class PushMessageContentChatChangePhoto extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentChatChangePhoto';

  @override
  Map<String, dynamic> get params => {};

  PushMessageContentChatChangePhoto();

  PushMessageContentChatChangePhoto.fromJson(Map<String, dynamic> json);
}

@reflector
class PushMessageContentChatChangeTitle extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentChatChangeTitle';

   late String title;

  @override
  Map<String, dynamic> get params => {
    'title': title,
  };

  PushMessageContentChatChangeTitle({
  required this.title,
  });

  PushMessageContentChatChangeTitle.fromJson(Map<String, dynamic> json) {
    title = tryConvertToTdObject(json['title']);
  }
}

@reflector
class PushMessageContentChatSetTheme extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentChatSetTheme';

   late String themeName;

  @override
  Map<String, dynamic> get params => {
    'theme_name': themeName,
  };

  PushMessageContentChatSetTheme({
  required this.themeName,
  });

  PushMessageContentChatSetTheme.fromJson(Map<String, dynamic> json) {
    themeName = tryConvertToTdObject(json['theme_name']);
  }
}

@reflector
class PushMessageContentChatDeleteMember extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentChatDeleteMember';

   late String memberName;
   late bool isCurrentUser;
   late bool isLeft;

  @override
  Map<String, dynamic> get params => {
    'member_name': memberName,
    'is_current_user': isCurrentUser,
    'is_left': isLeft,
  };

  PushMessageContentChatDeleteMember({
  required this.memberName,
  required this.isCurrentUser,
  required this.isLeft,
  });

  PushMessageContentChatDeleteMember.fromJson(Map<String, dynamic> json) {
    memberName = tryConvertToTdObject(json['member_name']);
    isCurrentUser = tryConvertToTdObject(json['is_current_user']);
    isLeft = tryConvertToTdObject(json['is_left']);
  }
}

@reflector
class PushMessageContentChatJoinByLink extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentChatJoinByLink';

  @override
  Map<String, dynamic> get params => {};

  PushMessageContentChatJoinByLink();

  PushMessageContentChatJoinByLink.fromJson(Map<String, dynamic> json);
}

@reflector
class PushMessageContentMessageForwards extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentMessageForwards';

   late int totalCount;

  @override
  Map<String, dynamic> get params => {
    'total_count': totalCount,
  };

  PushMessageContentMessageForwards({
  required this.totalCount,
  });

  PushMessageContentMessageForwards.fromJson(Map<String, dynamic> json) {
    totalCount = tryConvertToTdObject(json['total_count']);
  }
}

@reflector
class PushMessageContentMediaAlbum extends PushMessageContent {
  @override
  String get tdType => 'pushMessageContentMediaAlbum';

   late int totalCount;
   late bool hasPhotos;
   late bool hasVideos;
   late bool hasAudios;
   late bool hasDocuments;

  @override
  Map<String, dynamic> get params => {
    'total_count': totalCount,
    'has_photos': hasPhotos,
    'has_videos': hasVideos,
    'has_audios': hasAudios,
    'has_documents': hasDocuments,
  };

  PushMessageContentMediaAlbum({
  required this.totalCount,
  required this.hasPhotos,
  required this.hasVideos,
  required this.hasAudios,
  required this.hasDocuments,
  });

  PushMessageContentMediaAlbum.fromJson(Map<String, dynamic> json) {
    totalCount = tryConvertToTdObject(json['total_count']);
    hasPhotos = tryConvertToTdObject(json['has_photos']);
    hasVideos = tryConvertToTdObject(json['has_videos']);
    hasAudios = tryConvertToTdObject(json['has_audios']);
    hasDocuments = tryConvertToTdObject(json['has_documents']);
  }
}

abstract class NotificationType extends TdObject {}

@reflector
class NotificationTypeNewMessage extends NotificationType {
  @override
  String get tdType => 'notificationTypeNewMessage';

   late Message message;

  @override
  Map<String, dynamic> get params => {
    'message': message,
  };

  NotificationTypeNewMessage({
  required this.message,
  });

  NotificationTypeNewMessage.fromJson(Map<String, dynamic> json) {
    message = tryConvertToTdObject(json['message']);
  }
}

@reflector
class NotificationTypeNewSecretChat extends NotificationType {
  @override
  String get tdType => 'notificationTypeNewSecretChat';

  @override
  Map<String, dynamic> get params => {};

  NotificationTypeNewSecretChat();

  NotificationTypeNewSecretChat.fromJson(Map<String, dynamic> json);
}

@reflector
class NotificationTypeNewCall extends NotificationType {
  @override
  String get tdType => 'notificationTypeNewCall';

   late int callId;

  @override
  Map<String, dynamic> get params => {
    'call_id': callId,
  };

  NotificationTypeNewCall({
  required this.callId,
  });

  NotificationTypeNewCall.fromJson(Map<String, dynamic> json) {
    callId = tryConvertToTdObject(json['call_id']);
  }
}

@reflector
class NotificationTypeNewPushMessage extends NotificationType {
  @override
  String get tdType => 'notificationTypeNewPushMessage';

   late int messageId;
   late MessageSender sender;
   late String senderName;
   late bool isOutgoing;
   late PushMessageContent content;

  @override
  Map<String, dynamic> get params => {
    'message_id': messageId,
    'sender': sender,
    'sender_name': senderName,
    'is_outgoing': isOutgoing,
    'content': content,
  };

  NotificationTypeNewPushMessage({
  required this.messageId,
  required this.sender,
  required this.senderName,
  required this.isOutgoing,
  required this.content,
  });

  NotificationTypeNewPushMessage.fromJson(Map<String, dynamic> json) {
    messageId = tryConvertToTdObject(json['message_id']);
    sender = tryConvertToTdObject(json['sender']);
    senderName = tryConvertToTdObject(json['sender_name']);
    isOutgoing = tryConvertToTdObject(json['is_outgoing']);
    content = tryConvertToTdObject(json['content']);
  }
}

abstract class NotificationGroupType extends TdObject {}

@reflector
class NotificationGroupTypeMessages extends NotificationGroupType {
  @override
  String get tdType => 'notificationGroupTypeMessages';

  @override
  Map<String, dynamic> get params => {};

  NotificationGroupTypeMessages();

  NotificationGroupTypeMessages.fromJson(Map<String, dynamic> json);
}

@reflector
class NotificationGroupTypeMentions extends NotificationGroupType {
  @override
  String get tdType => 'notificationGroupTypeMentions';

  @override
  Map<String, dynamic> get params => {};

  NotificationGroupTypeMentions();

  NotificationGroupTypeMentions.fromJson(Map<String, dynamic> json);
}

@reflector
class NotificationGroupTypeSecretChat extends NotificationGroupType {
  @override
  String get tdType => 'notificationGroupTypeSecretChat';

  @override
  Map<String, dynamic> get params => {};

  NotificationGroupTypeSecretChat();

  NotificationGroupTypeSecretChat.fromJson(Map<String, dynamic> json);
}

@reflector
class NotificationGroupTypeCalls extends NotificationGroupType {
  @override
  String get tdType => 'notificationGroupTypeCalls';

  @override
  Map<String, dynamic> get params => {};

  NotificationGroupTypeCalls();

  NotificationGroupTypeCalls.fromJson(Map<String, dynamic> json);
}

@reflector
class Notification extends TdObject {
  @override
  String get tdType => 'notification';

   late int id;
   late int date;
   late bool isSilent;
   late NotificationType type;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'date': date,
    'is_silent': isSilent,
    'type': type,
  };

  Notification({
  required this.id,
  required this.date,
  required this.isSilent,
  required this.type,
  });

  Notification.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    date = tryConvertToTdObject(json['date']);
    isSilent = tryConvertToTdObject(json['is_silent']);
    type = tryConvertToTdObject(json['type']);
  }
}

@reflector
class NotificationGroup extends TdObject {
  @override
  String get tdType => 'notificationGroup';

   late int id;
   late NotificationGroupType type;
   late int chatId;
   late int totalCount;
   late List<Notification> notifications;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'type': type,
    'chat_id': chatId,
    'total_count': totalCount,
    'notifications': notifications,
  };

  NotificationGroup({
  required this.id,
  required this.type,
  required this.chatId,
  required this.totalCount,
  required this.notifications,
  });

  NotificationGroup.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    type = tryConvertToTdObject(json['type']);
    chatId = tryConvertToTdObject(json['chat_id']);
    totalCount = tryConvertToTdObject(json['total_count']);
    notifications = tryConvertToTdObject(json['notifications']);
  }
}

abstract class OptionValue extends TdObject {}

@reflector
class OptionValueBoolean extends OptionValue {
  @override
  String get tdType => 'optionValueBoolean';

   late bool value;

  @override
  Map<String, dynamic> get params => {
    'value': value,
  };

  OptionValueBoolean({
  required this.value,
  });

  OptionValueBoolean.fromJson(Map<String, dynamic> json) {
    value = tryConvertToTdObject(json['value']);
  }
}

@reflector
class OptionValueEmpty extends OptionValue {
  @override
  String get tdType => 'optionValueEmpty';

  @override
  Map<String, dynamic> get params => {};

  OptionValueEmpty();

  OptionValueEmpty.fromJson(Map<String, dynamic> json);
}

@reflector
class OptionValueInteger extends OptionValue {
  @override
  String get tdType => 'optionValueInteger';

   late int value;

  @override
  Map<String, dynamic> get params => {
    'value': value,
  };

  OptionValueInteger({
  required this.value,
  });

  OptionValueInteger.fromJson(Map<String, dynamic> json) {
    value = tryConvertToTdObject(json['value']);
  }
}

@reflector
class OptionValueString extends OptionValue {
  @override
  String get tdType => 'optionValueString';

   late String value;

  @override
  Map<String, dynamic> get params => {
    'value': value,
  };

  OptionValueString({
  required this.value,
  });

  OptionValueString.fromJson(Map<String, dynamic> json) {
    value = tryConvertToTdObject(json['value']);
  }
}

@reflector
class JsonObjectMember extends TdObject {
  @override
  String get tdType => 'jsonObjectMember';

   late String key;
   late JsonValue value;

  @override
  Map<String, dynamic> get params => {
    'key': key,
    'value': value,
  };

  JsonObjectMember({
  required this.key,
  required this.value,
  });

  JsonObjectMember.fromJson(Map<String, dynamic> json) {
    key = tryConvertToTdObject(json['key']);
    value = tryConvertToTdObject(json['value']);
  }
}

abstract class JsonValue extends TdObject {}

@reflector
class JsonValueNull extends JsonValue {
  @override
  String get tdType => 'jsonValueNull';

  @override
  Map<String, dynamic> get params => {};

  JsonValueNull();

  JsonValueNull.fromJson(Map<String, dynamic> json);
}

@reflector
class JsonValueBoolean extends JsonValue {
  @override
  String get tdType => 'jsonValueBoolean';

   late bool value;

  @override
  Map<String, dynamic> get params => {
    'value': value,
  };

  JsonValueBoolean({
  required this.value,
  });

  JsonValueBoolean.fromJson(Map<String, dynamic> json) {
    value = tryConvertToTdObject(json['value']);
  }
}

@reflector
class JsonValueNumber extends JsonValue {
  @override
  String get tdType => 'jsonValueNumber';

   late double value;

  @override
  Map<String, dynamic> get params => {
    'value': value,
  };

  JsonValueNumber({
  required this.value,
  });

  JsonValueNumber.fromJson(Map<String, dynamic> json) {
    value = tryConvertToTdObject(json['value']);
  }
}

@reflector
class JsonValueString extends JsonValue {
  @override
  String get tdType => 'jsonValueString';

   late String value;

  @override
  Map<String, dynamic> get params => {
    'value': value,
  };

  JsonValueString({
  required this.value,
  });

  JsonValueString.fromJson(Map<String, dynamic> json) {
    value = tryConvertToTdObject(json['value']);
  }
}

@reflector
class JsonValueArray extends JsonValue {
  @override
  String get tdType => 'jsonValueArray';

   late List<JsonValue> values;

  @override
  Map<String, dynamic> get params => {
    'values': values,
  };

  JsonValueArray({
  required this.values,
  });

  JsonValueArray.fromJson(Map<String, dynamic> json) {
    values = tryConvertToTdObject(json['values']);
  }
}

@reflector
class JsonValueObject extends JsonValue {
  @override
  String get tdType => 'jsonValueObject';

   late List<JsonObjectMember> members;

  @override
  Map<String, dynamic> get params => {
    'members': members,
  };

  JsonValueObject({
  required this.members,
  });

  JsonValueObject.fromJson(Map<String, dynamic> json) {
    members = tryConvertToTdObject(json['members']);
  }
}

abstract class UserPrivacySettingRule extends TdObject {}

@reflector
class UserPrivacySettingRuleAllowAll extends UserPrivacySettingRule {
  @override
  String get tdType => 'userPrivacySettingRuleAllowAll';

  @override
  Map<String, dynamic> get params => {};

  UserPrivacySettingRuleAllowAll();

  UserPrivacySettingRuleAllowAll.fromJson(Map<String, dynamic> json);
}

@reflector
class UserPrivacySettingRuleAllowContacts extends UserPrivacySettingRule {
  @override
  String get tdType => 'userPrivacySettingRuleAllowContacts';

  @override
  Map<String, dynamic> get params => {};

  UserPrivacySettingRuleAllowContacts();

  UserPrivacySettingRuleAllowContacts.fromJson(Map<String, dynamic> json);
}

@reflector
class UserPrivacySettingRuleAllowUsers extends UserPrivacySettingRule {
  @override
  String get tdType => 'userPrivacySettingRuleAllowUsers';

   late List<int> userIds;

  @override
  Map<String, dynamic> get params => {
    'user_ids': userIds,
  };

  UserPrivacySettingRuleAllowUsers({
  required this.userIds,
  });

  UserPrivacySettingRuleAllowUsers.fromJson(Map<String, dynamic> json) {
    userIds = tryConvertToTdObject(json['user_ids']);
  }
}

@reflector
class UserPrivacySettingRuleAllowChatMembers extends UserPrivacySettingRule {
  @override
  String get tdType => 'userPrivacySettingRuleAllowChatMembers';

   late List<int> chatIds;

  @override
  Map<String, dynamic> get params => {
    'chat_ids': chatIds,
  };

  UserPrivacySettingRuleAllowChatMembers({
  required this.chatIds,
  });

  UserPrivacySettingRuleAllowChatMembers.fromJson(Map<String, dynamic> json) {
    chatIds = tryConvertToTdObject(json['chat_ids']);
  }
}

@reflector
class UserPrivacySettingRuleRestrictAll extends UserPrivacySettingRule {
  @override
  String get tdType => 'userPrivacySettingRuleRestrictAll';

  @override
  Map<String, dynamic> get params => {};

  UserPrivacySettingRuleRestrictAll();

  UserPrivacySettingRuleRestrictAll.fromJson(Map<String, dynamic> json);
}

@reflector
class UserPrivacySettingRuleRestrictContacts extends UserPrivacySettingRule {
  @override
  String get tdType => 'userPrivacySettingRuleRestrictContacts';

  @override
  Map<String, dynamic> get params => {};

  UserPrivacySettingRuleRestrictContacts();

  UserPrivacySettingRuleRestrictContacts.fromJson(Map<String, dynamic> json);
}

@reflector
class UserPrivacySettingRuleRestrictUsers extends UserPrivacySettingRule {
  @override
  String get tdType => 'userPrivacySettingRuleRestrictUsers';

   late List<int> userIds;

  @override
  Map<String, dynamic> get params => {
    'user_ids': userIds,
  };

  UserPrivacySettingRuleRestrictUsers({
  required this.userIds,
  });

  UserPrivacySettingRuleRestrictUsers.fromJson(Map<String, dynamic> json) {
    userIds = tryConvertToTdObject(json['user_ids']);
  }
}

@reflector
class UserPrivacySettingRuleRestrictChatMembers extends UserPrivacySettingRule {
  @override
  String get tdType => 'userPrivacySettingRuleRestrictChatMembers';

   late List<int> chatIds;

  @override
  Map<String, dynamic> get params => {
    'chat_ids': chatIds,
  };

  UserPrivacySettingRuleRestrictChatMembers({
  required this.chatIds,
  });

  UserPrivacySettingRuleRestrictChatMembers.fromJson(Map<String, dynamic> json) {
    chatIds = tryConvertToTdObject(json['chat_ids']);
  }
}

@reflector
class UserPrivacySettingRules extends TdObject {
  @override
  String get tdType => 'userPrivacySettingRules';

   late List<UserPrivacySettingRule> rules;

  @override
  Map<String, dynamic> get params => {
    'rules': rules,
  };

  UserPrivacySettingRules({
  required this.rules,
  });

  UserPrivacySettingRules.fromJson(Map<String, dynamic> json) {
    rules = tryConvertToTdObject(json['rules']);
  }
}

abstract class UserPrivacySetting extends TdObject {}

@reflector
class UserPrivacySettingShowStatus extends UserPrivacySetting {
  @override
  String get tdType => 'userPrivacySettingShowStatus';

  @override
  Map<String, dynamic> get params => {};

  UserPrivacySettingShowStatus();

  UserPrivacySettingShowStatus.fromJson(Map<String, dynamic> json);
}

@reflector
class UserPrivacySettingShowProfilePhoto extends UserPrivacySetting {
  @override
  String get tdType => 'userPrivacySettingShowProfilePhoto';

  @override
  Map<String, dynamic> get params => {};

  UserPrivacySettingShowProfilePhoto();

  UserPrivacySettingShowProfilePhoto.fromJson(Map<String, dynamic> json);
}

@reflector
class UserPrivacySettingShowLinkInForwardedMessages extends UserPrivacySetting {
  @override
  String get tdType => 'userPrivacySettingShowLinkInForwardedMessages';

  @override
  Map<String, dynamic> get params => {};

  UserPrivacySettingShowLinkInForwardedMessages();

  UserPrivacySettingShowLinkInForwardedMessages.fromJson(Map<String, dynamic> json);
}

@reflector
class UserPrivacySettingShowPhoneNumber extends UserPrivacySetting {
  @override
  String get tdType => 'userPrivacySettingShowPhoneNumber';

  @override
  Map<String, dynamic> get params => {};

  UserPrivacySettingShowPhoneNumber();

  UserPrivacySettingShowPhoneNumber.fromJson(Map<String, dynamic> json);
}

@reflector
class UserPrivacySettingAllowChatInvites extends UserPrivacySetting {
  @override
  String get tdType => 'userPrivacySettingAllowChatInvites';

  @override
  Map<String, dynamic> get params => {};

  UserPrivacySettingAllowChatInvites();

  UserPrivacySettingAllowChatInvites.fromJson(Map<String, dynamic> json);
}

@reflector
class UserPrivacySettingAllowCalls extends UserPrivacySetting {
  @override
  String get tdType => 'userPrivacySettingAllowCalls';

  @override
  Map<String, dynamic> get params => {};

  UserPrivacySettingAllowCalls();

  UserPrivacySettingAllowCalls.fromJson(Map<String, dynamic> json);
}

@reflector
class UserPrivacySettingAllowPeerToPeerCalls extends UserPrivacySetting {
  @override
  String get tdType => 'userPrivacySettingAllowPeerToPeerCalls';

  @override
  Map<String, dynamic> get params => {};

  UserPrivacySettingAllowPeerToPeerCalls();

  UserPrivacySettingAllowPeerToPeerCalls.fromJson(Map<String, dynamic> json);
}

@reflector
class UserPrivacySettingAllowFindingByPhoneNumber extends UserPrivacySetting {
  @override
  String get tdType => 'userPrivacySettingAllowFindingByPhoneNumber';

  @override
  Map<String, dynamic> get params => {};

  UserPrivacySettingAllowFindingByPhoneNumber();

  UserPrivacySettingAllowFindingByPhoneNumber.fromJson(Map<String, dynamic> json);
}

@reflector
class AccountTtl extends TdObject {
  @override
  String get tdType => 'accountTtl';

   late int days;

  @override
  Map<String, dynamic> get params => {
    'days': days,
  };

  AccountTtl({
  required this.days,
  });

  AccountTtl.fromJson(Map<String, dynamic> json) {
    days = tryConvertToTdObject(json['days']);
  }
}

@reflector
class Session extends TdObject {
  @override
  String get tdType => 'session';

   late int id;
   late bool isCurrent;
   late bool isPasswordPending;
   late int apiId;
   late String applicationName;
   late String applicationVersion;
   late bool isOfficialApplication;
   late String deviceModel;
   late String platform;
   late String systemVersion;
   late int logInDate;
   late int lastActiveDate;
   late String ip;
   late String country;
   late String region;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'is_current': isCurrent,
    'is_password_pending': isPasswordPending,
    'api_id': apiId,
    'application_name': applicationName,
    'application_version': applicationVersion,
    'is_official_application': isOfficialApplication,
    'device_model': deviceModel,
    'platform': platform,
    'system_version': systemVersion,
    'log_in_date': logInDate,
    'last_active_date': lastActiveDate,
    'ip': ip,
    'country': country,
    'region': region,
  };

  Session({
  required this.id,
  required this.isCurrent,
  required this.isPasswordPending,
  required this.apiId,
  required this.applicationName,
  required this.applicationVersion,
  required this.isOfficialApplication,
  required this.deviceModel,
  required this.platform,
  required this.systemVersion,
  required this.logInDate,
  required this.lastActiveDate,
  required this.ip,
  required this.country,
  required this.region,
  });

  Session.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    isCurrent = tryConvertToTdObject(json['is_current']);
    isPasswordPending = tryConvertToTdObject(json['is_password_pending']);
    apiId = tryConvertToTdObject(json['api_id']);
    applicationName = tryConvertToTdObject(json['application_name']);
    applicationVersion = tryConvertToTdObject(json['application_version']);
    isOfficialApplication = tryConvertToTdObject(json['is_official_application']);
    deviceModel = tryConvertToTdObject(json['device_model']);
    platform = tryConvertToTdObject(json['platform']);
    systemVersion = tryConvertToTdObject(json['system_version']);
    logInDate = tryConvertToTdObject(json['log_in_date']);
    lastActiveDate = tryConvertToTdObject(json['last_active_date']);
    ip = tryConvertToTdObject(json['ip']);
    country = tryConvertToTdObject(json['country']);
    region = tryConvertToTdObject(json['region']);
  }
}

@reflector
class Sessions extends TdObject {
  @override
  String get tdType => 'sessions';

   late List<Session> sessions;

  @override
  Map<String, dynamic> get params => {
    'sessions': sessions,
  };

  Sessions({
  required this.sessions,
  });

  Sessions.fromJson(Map<String, dynamic> json) {
    sessions = tryConvertToTdObject(json['sessions']);
  }
}

@reflector
class ConnectedWebsite extends TdObject {
  @override
  String get tdType => 'connectedWebsite';

   late int id;
   late String domainName;
   late int botUserId;
   late String browser;
   late String platform;
   late int logInDate;
   late int lastActiveDate;
   late String ip;
   late String location;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'domain_name': domainName,
    'bot_user_id': botUserId,
    'browser': browser,
    'platform': platform,
    'log_in_date': logInDate,
    'last_active_date': lastActiveDate,
    'ip': ip,
    'location': location,
  };

  ConnectedWebsite({
  required this.id,
  required this.domainName,
  required this.botUserId,
  required this.browser,
  required this.platform,
  required this.logInDate,
  required this.lastActiveDate,
  required this.ip,
  required this.location,
  });

  ConnectedWebsite.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    domainName = tryConvertToTdObject(json['domain_name']);
    botUserId = tryConvertToTdObject(json['bot_user_id']);
    browser = tryConvertToTdObject(json['browser']);
    platform = tryConvertToTdObject(json['platform']);
    logInDate = tryConvertToTdObject(json['log_in_date']);
    lastActiveDate = tryConvertToTdObject(json['last_active_date']);
    ip = tryConvertToTdObject(json['ip']);
    location = tryConvertToTdObject(json['location']);
  }
}

@reflector
class ConnectedWebsites extends TdObject {
  @override
  String get tdType => 'connectedWebsites';

   late List<ConnectedWebsite> websites;

  @override
  Map<String, dynamic> get params => {
    'websites': websites,
  };

  ConnectedWebsites({
  required this.websites,
  });

  ConnectedWebsites.fromJson(Map<String, dynamic> json) {
    websites = tryConvertToTdObject(json['websites']);
  }
}

abstract class ChatReportReason extends TdObject {}

@reflector
class ChatReportReasonSpam extends ChatReportReason {
  @override
  String get tdType => 'chatReportReasonSpam';

  @override
  Map<String, dynamic> get params => {};

  ChatReportReasonSpam();

  ChatReportReasonSpam.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatReportReasonViolence extends ChatReportReason {
  @override
  String get tdType => 'chatReportReasonViolence';

  @override
  Map<String, dynamic> get params => {};

  ChatReportReasonViolence();

  ChatReportReasonViolence.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatReportReasonPornography extends ChatReportReason {
  @override
  String get tdType => 'chatReportReasonPornography';

  @override
  Map<String, dynamic> get params => {};

  ChatReportReasonPornography();

  ChatReportReasonPornography.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatReportReasonChildAbuse extends ChatReportReason {
  @override
  String get tdType => 'chatReportReasonChildAbuse';

  @override
  Map<String, dynamic> get params => {};

  ChatReportReasonChildAbuse();

  ChatReportReasonChildAbuse.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatReportReasonCopyright extends ChatReportReason {
  @override
  String get tdType => 'chatReportReasonCopyright';

  @override
  Map<String, dynamic> get params => {};

  ChatReportReasonCopyright();

  ChatReportReasonCopyright.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatReportReasonUnrelatedLocation extends ChatReportReason {
  @override
  String get tdType => 'chatReportReasonUnrelatedLocation';

  @override
  Map<String, dynamic> get params => {};

  ChatReportReasonUnrelatedLocation();

  ChatReportReasonUnrelatedLocation.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatReportReasonFake extends ChatReportReason {
  @override
  String get tdType => 'chatReportReasonFake';

  @override
  Map<String, dynamic> get params => {};

  ChatReportReasonFake();

  ChatReportReasonFake.fromJson(Map<String, dynamic> json);
}

@reflector
class ChatReportReasonCustom extends ChatReportReason {
  @override
  String get tdType => 'chatReportReasonCustom';

  @override
  Map<String, dynamic> get params => {};

  ChatReportReasonCustom();

  ChatReportReasonCustom.fromJson(Map<String, dynamic> json);
}

abstract class InternalLinkType extends TdObject {}

@reflector
class InternalLinkTypeActiveSessions extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeActiveSessions';

  @override
  Map<String, dynamic> get params => {};

  InternalLinkTypeActiveSessions();

  InternalLinkTypeActiveSessions.fromJson(Map<String, dynamic> json);
}

@reflector
class InternalLinkTypeAuthenticationCode extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeAuthenticationCode';

   late String code;

  @override
  Map<String, dynamic> get params => {
    'code': code,
  };

  InternalLinkTypeAuthenticationCode({
  required this.code,
  });

  InternalLinkTypeAuthenticationCode.fromJson(Map<String, dynamic> json) {
    code = tryConvertToTdObject(json['code']);
  }
}

@reflector
class InternalLinkTypeBackground extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeBackground';

   late String backgroundName;

  @override
  Map<String, dynamic> get params => {
    'background_name': backgroundName,
  };

  InternalLinkTypeBackground({
  required this.backgroundName,
  });

  InternalLinkTypeBackground.fromJson(Map<String, dynamic> json) {
    backgroundName = tryConvertToTdObject(json['background_name']);
  }
}

@reflector
class InternalLinkTypeBotStart extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeBotStart';

   late String botUsername;
   late String startParameter;

  @override
  Map<String, dynamic> get params => {
    'bot_username': botUsername,
    'start_parameter': startParameter,
  };

  InternalLinkTypeBotStart({
  required this.botUsername,
  required this.startParameter,
  });

  InternalLinkTypeBotStart.fromJson(Map<String, dynamic> json) {
    botUsername = tryConvertToTdObject(json['bot_username']);
    startParameter = tryConvertToTdObject(json['start_parameter']);
  }
}

@reflector
class InternalLinkTypeBotStartInGroup extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeBotStartInGroup';

   late String botUsername;
   late String startParameter;

  @override
  Map<String, dynamic> get params => {
    'bot_username': botUsername,
    'start_parameter': startParameter,
  };

  InternalLinkTypeBotStartInGroup({
  required this.botUsername,
  required this.startParameter,
  });

  InternalLinkTypeBotStartInGroup.fromJson(Map<String, dynamic> json) {
    botUsername = tryConvertToTdObject(json['bot_username']);
    startParameter = tryConvertToTdObject(json['start_parameter']);
  }
}

@reflector
class InternalLinkTypeChangePhoneNumber extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeChangePhoneNumber';

  @override
  Map<String, dynamic> get params => {};

  InternalLinkTypeChangePhoneNumber();

  InternalLinkTypeChangePhoneNumber.fromJson(Map<String, dynamic> json);
}

@reflector
class InternalLinkTypeChatInvite extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeChatInvite';

   late String inviteLink;

  @override
  Map<String, dynamic> get params => {
    'invite_link': inviteLink,
  };

  InternalLinkTypeChatInvite({
  required this.inviteLink,
  });

  InternalLinkTypeChatInvite.fromJson(Map<String, dynamic> json) {
    inviteLink = tryConvertToTdObject(json['invite_link']);
  }
}

@reflector
class InternalLinkTypeFilterSettings extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeFilterSettings';

  @override
  Map<String, dynamic> get params => {};

  InternalLinkTypeFilterSettings();

  InternalLinkTypeFilterSettings.fromJson(Map<String, dynamic> json);
}

@reflector
class InternalLinkTypeGame extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeGame';

   late String botUsername;
   late String gameShortName;

  @override
  Map<String, dynamic> get params => {
    'bot_username': botUsername,
    'game_short_name': gameShortName,
  };

  InternalLinkTypeGame({
  required this.botUsername,
  required this.gameShortName,
  });

  InternalLinkTypeGame.fromJson(Map<String, dynamic> json) {
    botUsername = tryConvertToTdObject(json['bot_username']);
    gameShortName = tryConvertToTdObject(json['game_short_name']);
  }
}

@reflector
class InternalLinkTypeLanguagePack extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeLanguagePack';

   late String languagePackId;

  @override
  Map<String, dynamic> get params => {
    'language_pack_id': languagePackId,
  };

  InternalLinkTypeLanguagePack({
  required this.languagePackId,
  });

  InternalLinkTypeLanguagePack.fromJson(Map<String, dynamic> json) {
    languagePackId = tryConvertToTdObject(json['language_pack_id']);
  }
}

@reflector
class InternalLinkTypeMessage extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeMessage';

   late String url;

  @override
  Map<String, dynamic> get params => {
    'url': url,
  };

  InternalLinkTypeMessage({
  required this.url,
  });

  InternalLinkTypeMessage.fromJson(Map<String, dynamic> json) {
    url = tryConvertToTdObject(json['url']);
  }
}

@reflector
class InternalLinkTypeMessageDraft extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeMessageDraft';

   late FormattedText text;
   late bool containsLink;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'contains_link': containsLink,
  };

  InternalLinkTypeMessageDraft({
  required this.text,
  required this.containsLink,
  });

  InternalLinkTypeMessageDraft.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    containsLink = tryConvertToTdObject(json['contains_link']);
  }
}

@reflector
class InternalLinkTypePassportDataRequest extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypePassportDataRequest';

   late int botUserId;
   late String scope;
   late String publicKey;
   late String nonce;
   late String callbackUrl;

  @override
  Map<String, dynamic> get params => {
    'bot_user_id': botUserId,
    'scope': scope,
    'public_key': publicKey,
    'nonce': nonce,
    'callback_url': callbackUrl,
  };

  InternalLinkTypePassportDataRequest({
  required this.botUserId,
  required this.scope,
  required this.publicKey,
  required this.nonce,
  required this.callbackUrl,
  });

  InternalLinkTypePassportDataRequest.fromJson(Map<String, dynamic> json) {
    botUserId = tryConvertToTdObject(json['bot_user_id']);
    scope = tryConvertToTdObject(json['scope']);
    publicKey = tryConvertToTdObject(json['public_key']);
    nonce = tryConvertToTdObject(json['nonce']);
    callbackUrl = tryConvertToTdObject(json['callback_url']);
  }
}

@reflector
class InternalLinkTypePhoneNumberConfirmation extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypePhoneNumberConfirmation';

   late String hash;
   late String phoneNumber;

  @override
  Map<String, dynamic> get params => {
    'hash': hash,
    'phone_number': phoneNumber,
  };

  InternalLinkTypePhoneNumberConfirmation({
  required this.hash,
  required this.phoneNumber,
  });

  InternalLinkTypePhoneNumberConfirmation.fromJson(Map<String, dynamic> json) {
    hash = tryConvertToTdObject(json['hash']);
    phoneNumber = tryConvertToTdObject(json['phone_number']);
  }
}

@reflector
class InternalLinkTypeProxy extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeProxy';

   late String server;
   late int port;
   late ProxyType type;

  @override
  Map<String, dynamic> get params => {
    'server': server,
    'port': port,
    'type': type,
  };

  InternalLinkTypeProxy({
  required this.server,
  required this.port,
  required this.type,
  });

  InternalLinkTypeProxy.fromJson(Map<String, dynamic> json) {
    server = tryConvertToTdObject(json['server']);
    port = tryConvertToTdObject(json['port']);
    type = tryConvertToTdObject(json['type']);
  }
}

@reflector
class InternalLinkTypePublicChat extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypePublicChat';

   late String chatUsername;

  @override
  Map<String, dynamic> get params => {
    'chat_username': chatUsername,
  };

  InternalLinkTypePublicChat({
  required this.chatUsername,
  });

  InternalLinkTypePublicChat.fromJson(Map<String, dynamic> json) {
    chatUsername = tryConvertToTdObject(json['chat_username']);
  }
}

@reflector
class InternalLinkTypeQrCodeAuthentication extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeQrCodeAuthentication';

  @override
  Map<String, dynamic> get params => {};

  InternalLinkTypeQrCodeAuthentication();

  InternalLinkTypeQrCodeAuthentication.fromJson(Map<String, dynamic> json);
}

@reflector
class InternalLinkTypeSettings extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeSettings';

  @override
  Map<String, dynamic> get params => {};

  InternalLinkTypeSettings();

  InternalLinkTypeSettings.fromJson(Map<String, dynamic> json);
}

@reflector
class InternalLinkTypeStickerSet extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeStickerSet';

   late String stickerSetName;

  @override
  Map<String, dynamic> get params => {
    'sticker_set_name': stickerSetName,
  };

  InternalLinkTypeStickerSet({
  required this.stickerSetName,
  });

  InternalLinkTypeStickerSet.fromJson(Map<String, dynamic> json) {
    stickerSetName = tryConvertToTdObject(json['sticker_set_name']);
  }
}

@reflector
class InternalLinkTypeTheme extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeTheme';

   late String themeName;

  @override
  Map<String, dynamic> get params => {
    'theme_name': themeName,
  };

  InternalLinkTypeTheme({
  required this.themeName,
  });

  InternalLinkTypeTheme.fromJson(Map<String, dynamic> json) {
    themeName = tryConvertToTdObject(json['theme_name']);
  }
}

@reflector
class InternalLinkTypeThemeSettings extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeThemeSettings';

  @override
  Map<String, dynamic> get params => {};

  InternalLinkTypeThemeSettings();

  InternalLinkTypeThemeSettings.fromJson(Map<String, dynamic> json);
}

@reflector
class InternalLinkTypeUnknownDeepLink extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeUnknownDeepLink';

   late String link;

  @override
  Map<String, dynamic> get params => {
    'link': link,
  };

  InternalLinkTypeUnknownDeepLink({
  required this.link,
  });

  InternalLinkTypeUnknownDeepLink.fromJson(Map<String, dynamic> json) {
    link = tryConvertToTdObject(json['link']);
  }
}

@reflector
class InternalLinkTypeVoiceChat extends InternalLinkType {
  @override
  String get tdType => 'internalLinkTypeVoiceChat';

   late String chatUsername;
   late String inviteHash;
   late bool isLiveStream;

  @override
  Map<String, dynamic> get params => {
    'chat_username': chatUsername,
    'invite_hash': inviteHash,
    'is_live_stream': isLiveStream,
  };

  InternalLinkTypeVoiceChat({
  required this.chatUsername,
  required this.inviteHash,
  required this.isLiveStream,
  });

  InternalLinkTypeVoiceChat.fromJson(Map<String, dynamic> json) {
    chatUsername = tryConvertToTdObject(json['chat_username']);
    inviteHash = tryConvertToTdObject(json['invite_hash']);
    isLiveStream = tryConvertToTdObject(json['is_live_stream']);
  }
}

@reflector
class MessageLink extends TdObject {
  @override
  String get tdType => 'messageLink';

   late String link;
   late bool isPublic;

  @override
  Map<String, dynamic> get params => {
    'link': link,
    'is_public': isPublic,
  };

  MessageLink({
  required this.link,
  required this.isPublic,
  });

  MessageLink.fromJson(Map<String, dynamic> json) {
    link = tryConvertToTdObject(json['link']);
    isPublic = tryConvertToTdObject(json['is_public']);
  }
}

@reflector
class MessageLinkInfo extends TdObject {
  @override
  String get tdType => 'messageLinkInfo';

   late bool isPublic;
   late int chatId;
   late Message message;
   late int mediaTimestamp;
   late bool forAlbum;
   late bool forComment;

  @override
  Map<String, dynamic> get params => {
    'is_public': isPublic,
    'chat_id': chatId,
    'message': message,
    'media_timestamp': mediaTimestamp,
    'for_album': forAlbum,
    'for_comment': forComment,
  };

  MessageLinkInfo({
  required this.isPublic,
  required this.chatId,
  required this.message,
  required this.mediaTimestamp,
  required this.forAlbum,
  required this.forComment,
  });

  MessageLinkInfo.fromJson(Map<String, dynamic> json) {
    isPublic = tryConvertToTdObject(json['is_public']);
    chatId = tryConvertToTdObject(json['chat_id']);
    message = tryConvertToTdObject(json['message']);
    mediaTimestamp = tryConvertToTdObject(json['media_timestamp']);
    forAlbum = tryConvertToTdObject(json['for_album']);
    forComment = tryConvertToTdObject(json['for_comment']);
  }
}

@reflector
class FilePart extends TdObject {
  @override
  String get tdType => 'filePart';

   late String data;

  @override
  Map<String, dynamic> get params => {
    'data': data,
  };

  FilePart({
  required this.data,
  });

  FilePart.fromJson(Map<String, dynamic> json) {
    data = tryConvertToTdObject(json['data']);
  }
}

abstract class FileType extends TdObject {}

@reflector
class FileTypeNone extends FileType {
  @override
  String get tdType => 'fileTypeNone';

  @override
  Map<String, dynamic> get params => {};

  FileTypeNone();

  FileTypeNone.fromJson(Map<String, dynamic> json);
}

@reflector
class FileTypeAnimation extends FileType {
  @override
  String get tdType => 'fileTypeAnimation';

  @override
  Map<String, dynamic> get params => {};

  FileTypeAnimation();

  FileTypeAnimation.fromJson(Map<String, dynamic> json);
}

@reflector
class FileTypeAudio extends FileType {
  @override
  String get tdType => 'fileTypeAudio';

  @override
  Map<String, dynamic> get params => {};

  FileTypeAudio();

  FileTypeAudio.fromJson(Map<String, dynamic> json);
}

@reflector
class FileTypeDocument extends FileType {
  @override
  String get tdType => 'fileTypeDocument';

  @override
  Map<String, dynamic> get params => {};

  FileTypeDocument();

  FileTypeDocument.fromJson(Map<String, dynamic> json);
}

@reflector
class FileTypePhoto extends FileType {
  @override
  String get tdType => 'fileTypePhoto';

  @override
  Map<String, dynamic> get params => {};

  FileTypePhoto();

  FileTypePhoto.fromJson(Map<String, dynamic> json);
}

@reflector
class FileTypeProfilePhoto extends FileType {
  @override
  String get tdType => 'fileTypeProfilePhoto';

  @override
  Map<String, dynamic> get params => {};

  FileTypeProfilePhoto();

  FileTypeProfilePhoto.fromJson(Map<String, dynamic> json);
}

@reflector
class FileTypeSecret extends FileType {
  @override
  String get tdType => 'fileTypeSecret';

  @override
  Map<String, dynamic> get params => {};

  FileTypeSecret();

  FileTypeSecret.fromJson(Map<String, dynamic> json);
}

@reflector
class FileTypeSecretThumbnail extends FileType {
  @override
  String get tdType => 'fileTypeSecretThumbnail';

  @override
  Map<String, dynamic> get params => {};

  FileTypeSecretThumbnail();

  FileTypeSecretThumbnail.fromJson(Map<String, dynamic> json);
}

@reflector
class FileTypeSecure extends FileType {
  @override
  String get tdType => 'fileTypeSecure';

  @override
  Map<String, dynamic> get params => {};

  FileTypeSecure();

  FileTypeSecure.fromJson(Map<String, dynamic> json);
}

@reflector
class FileTypeSticker extends FileType {
  @override
  String get tdType => 'fileTypeSticker';

  @override
  Map<String, dynamic> get params => {};

  FileTypeSticker();

  FileTypeSticker.fromJson(Map<String, dynamic> json);
}

@reflector
class FileTypeThumbnail extends FileType {
  @override
  String get tdType => 'fileTypeThumbnail';

  @override
  Map<String, dynamic> get params => {};

  FileTypeThumbnail();

  FileTypeThumbnail.fromJson(Map<String, dynamic> json);
}

@reflector
class FileTypeUnknown extends FileType {
  @override
  String get tdType => 'fileTypeUnknown';

  @override
  Map<String, dynamic> get params => {};

  FileTypeUnknown();

  FileTypeUnknown.fromJson(Map<String, dynamic> json);
}

@reflector
class FileTypeVideo extends FileType {
  @override
  String get tdType => 'fileTypeVideo';

  @override
  Map<String, dynamic> get params => {};

  FileTypeVideo();

  FileTypeVideo.fromJson(Map<String, dynamic> json);
}

@reflector
class FileTypeVideoNote extends FileType {
  @override
  String get tdType => 'fileTypeVideoNote';

  @override
  Map<String, dynamic> get params => {};

  FileTypeVideoNote();

  FileTypeVideoNote.fromJson(Map<String, dynamic> json);
}

@reflector
class FileTypeVoiceNote extends FileType {
  @override
  String get tdType => 'fileTypeVoiceNote';

  @override
  Map<String, dynamic> get params => {};

  FileTypeVoiceNote();

  FileTypeVoiceNote.fromJson(Map<String, dynamic> json);
}

@reflector
class FileTypeWallpaper extends FileType {
  @override
  String get tdType => 'fileTypeWallpaper';

  @override
  Map<String, dynamic> get params => {};

  FileTypeWallpaper();

  FileTypeWallpaper.fromJson(Map<String, dynamic> json);
}

@reflector
class StorageStatisticsByFileType extends TdObject {
  @override
  String get tdType => 'storageStatisticsByFileType';

   late FileType fileType;
   late int size;
   late int count;

  @override
  Map<String, dynamic> get params => {
    'file_type': fileType,
    'size': size,
    'count': count,
  };

  StorageStatisticsByFileType({
  required this.fileType,
  required this.size,
  required this.count,
  });

  StorageStatisticsByFileType.fromJson(Map<String, dynamic> json) {
    fileType = tryConvertToTdObject(json['file_type']);
    size = tryConvertToTdObject(json['size']);
    count = tryConvertToTdObject(json['count']);
  }
}

@reflector
class StorageStatisticsByChat extends TdObject {
  @override
  String get tdType => 'storageStatisticsByChat';

   late int chatId;
   late int size;
   late int count;
   late List<StorageStatisticsByFileType> byFileType;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'size': size,
    'count': count,
    'by_file_type': byFileType,
  };

  StorageStatisticsByChat({
  required this.chatId,
  required this.size,
  required this.count,
  required this.byFileType,
  });

  StorageStatisticsByChat.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    size = tryConvertToTdObject(json['size']);
    count = tryConvertToTdObject(json['count']);
    byFileType = tryConvertToTdObject(json['by_file_type']);
  }
}

@reflector
class StorageStatistics extends TdObject {
  @override
  String get tdType => 'storageStatistics';

   late int size;
   late int count;
   late List<StorageStatisticsByChat> byChat;

  @override
  Map<String, dynamic> get params => {
    'size': size,
    'count': count,
    'by_chat': byChat,
  };

  StorageStatistics({
  required this.size,
  required this.count,
  required this.byChat,
  });

  StorageStatistics.fromJson(Map<String, dynamic> json) {
    size = tryConvertToTdObject(json['size']);
    count = tryConvertToTdObject(json['count']);
    byChat = tryConvertToTdObject(json['by_chat']);
  }
}

@reflector
class StorageStatisticsFast extends TdObject {
  @override
  String get tdType => 'storageStatisticsFast';

   late int filesSize;
   late int fileCount;
   late int databaseSize;
   late int languagePackDatabaseSize;
   late int logSize;

  @override
  Map<String, dynamic> get params => {
    'files_size': filesSize,
    'file_count': fileCount,
    'database_size': databaseSize,
    'language_pack_database_size': languagePackDatabaseSize,
    'log_size': logSize,
  };

  StorageStatisticsFast({
  required this.filesSize,
  required this.fileCount,
  required this.databaseSize,
  required this.languagePackDatabaseSize,
  required this.logSize,
  });

  StorageStatisticsFast.fromJson(Map<String, dynamic> json) {
    filesSize = tryConvertToTdObject(json['files_size']);
    fileCount = tryConvertToTdObject(json['file_count']);
    databaseSize = tryConvertToTdObject(json['database_size']);
    languagePackDatabaseSize = tryConvertToTdObject(json['language_pack_database_size']);
    logSize = tryConvertToTdObject(json['log_size']);
  }
}

@reflector
class DatabaseStatistics extends TdObject {
  @override
  String get tdType => 'databaseStatistics';

   late String statistics;

  @override
  Map<String, dynamic> get params => {
    'statistics': statistics,
  };

  DatabaseStatistics({
  required this.statistics,
  });

  DatabaseStatistics.fromJson(Map<String, dynamic> json) {
    statistics = tryConvertToTdObject(json['statistics']);
  }
}

abstract class NetworkType extends TdObject {}

@reflector
class NetworkTypeNone extends NetworkType {
  @override
  String get tdType => 'networkTypeNone';

  @override
  Map<String, dynamic> get params => {};

  NetworkTypeNone();

  NetworkTypeNone.fromJson(Map<String, dynamic> json);
}

@reflector
class NetworkTypeMobile extends NetworkType {
  @override
  String get tdType => 'networkTypeMobile';

  @override
  Map<String, dynamic> get params => {};

  NetworkTypeMobile();

  NetworkTypeMobile.fromJson(Map<String, dynamic> json);
}

@reflector
class NetworkTypeMobileRoaming extends NetworkType {
  @override
  String get tdType => 'networkTypeMobileRoaming';

  @override
  Map<String, dynamic> get params => {};

  NetworkTypeMobileRoaming();

  NetworkTypeMobileRoaming.fromJson(Map<String, dynamic> json);
}

@reflector
class NetworkTypeWiFi extends NetworkType {
  @override
  String get tdType => 'networkTypeWiFi';

  @override
  Map<String, dynamic> get params => {};

  NetworkTypeWiFi();

  NetworkTypeWiFi.fromJson(Map<String, dynamic> json);
}

@reflector
class NetworkTypeOther extends NetworkType {
  @override
  String get tdType => 'networkTypeOther';

  @override
  Map<String, dynamic> get params => {};

  NetworkTypeOther();

  NetworkTypeOther.fromJson(Map<String, dynamic> json);
}

abstract class NetworkStatisticsEntry extends TdObject {}

@reflector
class NetworkStatisticsEntryFile extends NetworkStatisticsEntry {
  @override
  String get tdType => 'networkStatisticsEntryFile';

   late FileType fileType;
   late NetworkType networkType;
   late int sentBytes;
   late int receivedBytes;

  @override
  Map<String, dynamic> get params => {
    'file_type': fileType,
    'network_type': networkType,
    'sent_bytes': sentBytes,
    'received_bytes': receivedBytes,
  };

  NetworkStatisticsEntryFile({
  required this.fileType,
  required this.networkType,
  required this.sentBytes,
  required this.receivedBytes,
  });

  NetworkStatisticsEntryFile.fromJson(Map<String, dynamic> json) {
    fileType = tryConvertToTdObject(json['file_type']);
    networkType = tryConvertToTdObject(json['network_type']);
    sentBytes = tryConvertToTdObject(json['sent_bytes']);
    receivedBytes = tryConvertToTdObject(json['received_bytes']);
  }
}

@reflector
class NetworkStatisticsEntryCall extends NetworkStatisticsEntry {
  @override
  String get tdType => 'networkStatisticsEntryCall';

   late NetworkType networkType;
   late int sentBytes;
   late int receivedBytes;
   late double duration;

  @override
  Map<String, dynamic> get params => {
    'network_type': networkType,
    'sent_bytes': sentBytes,
    'received_bytes': receivedBytes,
    'duration': duration,
  };

  NetworkStatisticsEntryCall({
  required this.networkType,
  required this.sentBytes,
  required this.receivedBytes,
  required this.duration,
  });

  NetworkStatisticsEntryCall.fromJson(Map<String, dynamic> json) {
    networkType = tryConvertToTdObject(json['network_type']);
    sentBytes = tryConvertToTdObject(json['sent_bytes']);
    receivedBytes = tryConvertToTdObject(json['received_bytes']);
    duration = tryConvertToTdObject(json['duration']);
  }
}

@reflector
class NetworkStatistics extends TdObject {
  @override
  String get tdType => 'networkStatistics';

   late int sinceDate;
   late List<NetworkStatisticsEntry> entries;

  @override
  Map<String, dynamic> get params => {
    'since_date': sinceDate,
    'entries': entries,
  };

  NetworkStatistics({
  required this.sinceDate,
  required this.entries,
  });

  NetworkStatistics.fromJson(Map<String, dynamic> json) {
    sinceDate = tryConvertToTdObject(json['since_date']);
    entries = tryConvertToTdObject(json['entries']);
  }
}

@reflector
class AutoDownloadSettings extends TdObject {
  @override
  String get tdType => 'autoDownloadSettings';

   late bool isAutoDownloadEnabled;
   late int maxPhotoFileSize;
   late int maxVideoFileSize;
   late int maxOtherFileSize;
   late int videoUploadBitrate;
   late bool preloadLargeVideos;
   late bool preloadNextAudio;
   late bool useLessDataForCalls;

  @override
  Map<String, dynamic> get params => {
    'is_auto_download_enabled': isAutoDownloadEnabled,
    'max_photo_file_size': maxPhotoFileSize,
    'max_video_file_size': maxVideoFileSize,
    'max_other_file_size': maxOtherFileSize,
    'video_upload_bitrate': videoUploadBitrate,
    'preload_large_videos': preloadLargeVideos,
    'preload_next_audio': preloadNextAudio,
    'use_less_data_for_calls': useLessDataForCalls,
  };

  AutoDownloadSettings({
  required this.isAutoDownloadEnabled,
  required this.maxPhotoFileSize,
  required this.maxVideoFileSize,
  required this.maxOtherFileSize,
  required this.videoUploadBitrate,
  required this.preloadLargeVideos,
  required this.preloadNextAudio,
  required this.useLessDataForCalls,
  });

  AutoDownloadSettings.fromJson(Map<String, dynamic> json) {
    isAutoDownloadEnabled = tryConvertToTdObject(json['is_auto_download_enabled']);
    maxPhotoFileSize = tryConvertToTdObject(json['max_photo_file_size']);
    maxVideoFileSize = tryConvertToTdObject(json['max_video_file_size']);
    maxOtherFileSize = tryConvertToTdObject(json['max_other_file_size']);
    videoUploadBitrate = tryConvertToTdObject(json['video_upload_bitrate']);
    preloadLargeVideos = tryConvertToTdObject(json['preload_large_videos']);
    preloadNextAudio = tryConvertToTdObject(json['preload_next_audio']);
    useLessDataForCalls = tryConvertToTdObject(json['use_less_data_for_calls']);
  }
}

@reflector
class AutoDownloadSettingsPresets extends TdObject {
  @override
  String get tdType => 'autoDownloadSettingsPresets';

   late AutoDownloadSettings low;
   late AutoDownloadSettings medium;
   late AutoDownloadSettings high;

  @override
  Map<String, dynamic> get params => {
    'low': low,
    'medium': medium,
    'high': high,
  };

  AutoDownloadSettingsPresets({
  required this.low,
  required this.medium,
  required this.high,
  });

  AutoDownloadSettingsPresets.fromJson(Map<String, dynamic> json) {
    low = tryConvertToTdObject(json['low']);
    medium = tryConvertToTdObject(json['medium']);
    high = tryConvertToTdObject(json['high']);
  }
}

abstract class ConnectionState extends TdObject {}

@reflector
class ConnectionStateWaitingForNetwork extends ConnectionState {
  @override
  String get tdType => 'connectionStateWaitingForNetwork';

  @override
  Map<String, dynamic> get params => {};

  ConnectionStateWaitingForNetwork();

  ConnectionStateWaitingForNetwork.fromJson(Map<String, dynamic> json);
}

@reflector
class ConnectionStateConnectingToProxy extends ConnectionState {
  @override
  String get tdType => 'connectionStateConnectingToProxy';

  @override
  Map<String, dynamic> get params => {};

  ConnectionStateConnectingToProxy();

  ConnectionStateConnectingToProxy.fromJson(Map<String, dynamic> json);
}

@reflector
class ConnectionStateConnecting extends ConnectionState {
  @override
  String get tdType => 'connectionStateConnecting';

  @override
  Map<String, dynamic> get params => {};

  ConnectionStateConnecting();

  ConnectionStateConnecting.fromJson(Map<String, dynamic> json);
}

@reflector
class ConnectionStateUpdating extends ConnectionState {
  @override
  String get tdType => 'connectionStateUpdating';

  @override
  Map<String, dynamic> get params => {};

  ConnectionStateUpdating();

  ConnectionStateUpdating.fromJson(Map<String, dynamic> json);
}

@reflector
class ConnectionStateReady extends ConnectionState {
  @override
  String get tdType => 'connectionStateReady';

  @override
  Map<String, dynamic> get params => {};

  ConnectionStateReady();

  ConnectionStateReady.fromJson(Map<String, dynamic> json);
}

abstract class TopChatCategory extends TdObject {}

@reflector
class TopChatCategoryUsers extends TopChatCategory {
  @override
  String get tdType => 'topChatCategoryUsers';

  @override
  Map<String, dynamic> get params => {};

  TopChatCategoryUsers();

  TopChatCategoryUsers.fromJson(Map<String, dynamic> json);
}

@reflector
class TopChatCategoryBots extends TopChatCategory {
  @override
  String get tdType => 'topChatCategoryBots';

  @override
  Map<String, dynamic> get params => {};

  TopChatCategoryBots();

  TopChatCategoryBots.fromJson(Map<String, dynamic> json);
}

@reflector
class TopChatCategoryGroups extends TopChatCategory {
  @override
  String get tdType => 'topChatCategoryGroups';

  @override
  Map<String, dynamic> get params => {};

  TopChatCategoryGroups();

  TopChatCategoryGroups.fromJson(Map<String, dynamic> json);
}

@reflector
class TopChatCategoryChannels extends TopChatCategory {
  @override
  String get tdType => 'topChatCategoryChannels';

  @override
  Map<String, dynamic> get params => {};

  TopChatCategoryChannels();

  TopChatCategoryChannels.fromJson(Map<String, dynamic> json);
}

@reflector
class TopChatCategoryInlineBots extends TopChatCategory {
  @override
  String get tdType => 'topChatCategoryInlineBots';

  @override
  Map<String, dynamic> get params => {};

  TopChatCategoryInlineBots();

  TopChatCategoryInlineBots.fromJson(Map<String, dynamic> json);
}

@reflector
class TopChatCategoryCalls extends TopChatCategory {
  @override
  String get tdType => 'topChatCategoryCalls';

  @override
  Map<String, dynamic> get params => {};

  TopChatCategoryCalls();

  TopChatCategoryCalls.fromJson(Map<String, dynamic> json);
}

@reflector
class TopChatCategoryForwardChats extends TopChatCategory {
  @override
  String get tdType => 'topChatCategoryForwardChats';

  @override
  Map<String, dynamic> get params => {};

  TopChatCategoryForwardChats();

  TopChatCategoryForwardChats.fromJson(Map<String, dynamic> json);
}

abstract class TMeUrlType extends TdObject {}

@reflector
class TMeUrlTypeUser extends TMeUrlType {
  @override
  String get tdType => 'tMeUrlTypeUser';

   late int userId;

  @override
  Map<String, dynamic> get params => {
    'user_id': userId,
  };

  TMeUrlTypeUser({
  required this.userId,
  });

  TMeUrlTypeUser.fromJson(Map<String, dynamic> json) {
    userId = tryConvertToTdObject(json['user_id']);
  }
}

@reflector
class TMeUrlTypeSupergroup extends TMeUrlType {
  @override
  String get tdType => 'tMeUrlTypeSupergroup';

   late int supergroupId;

  @override
  Map<String, dynamic> get params => {
    'supergroup_id': supergroupId,
  };

  TMeUrlTypeSupergroup({
  required this.supergroupId,
  });

  TMeUrlTypeSupergroup.fromJson(Map<String, dynamic> json) {
    supergroupId = tryConvertToTdObject(json['supergroup_id']);
  }
}

@reflector
class TMeUrlTypeChatInvite extends TMeUrlType {
  @override
  String get tdType => 'tMeUrlTypeChatInvite';

   late ChatInviteLinkInfo info;

  @override
  Map<String, dynamic> get params => {
    'info': info,
  };

  TMeUrlTypeChatInvite({
  required this.info,
  });

  TMeUrlTypeChatInvite.fromJson(Map<String, dynamic> json) {
    info = tryConvertToTdObject(json['info']);
  }
}

@reflector
class TMeUrlTypeStickerSet extends TMeUrlType {
  @override
  String get tdType => 'tMeUrlTypeStickerSet';

   late int stickerSetId;

  @override
  Map<String, dynamic> get params => {
    'sticker_set_id': stickerSetId,
  };

  TMeUrlTypeStickerSet({
  required this.stickerSetId,
  });

  TMeUrlTypeStickerSet.fromJson(Map<String, dynamic> json) {
    stickerSetId = tryConvertToTdObject(json['sticker_set_id']);
  }
}

@reflector
class TMeUrl extends TdObject {
  @override
  String get tdType => 'tMeUrl';

   late String url;
   late TMeUrlType type;

  @override
  Map<String, dynamic> get params => {
    'url': url,
    'type': type,
  };

  TMeUrl({
  required this.url,
  required this.type,
  });

  TMeUrl.fromJson(Map<String, dynamic> json) {
    url = tryConvertToTdObject(json['url']);
    type = tryConvertToTdObject(json['type']);
  }
}

@reflector
class TMeUrls extends TdObject {
  @override
  String get tdType => 'tMeUrls';

   late List<TMeUrl> urls;

  @override
  Map<String, dynamic> get params => {
    'urls': urls,
  };

  TMeUrls({
  required this.urls,
  });

  TMeUrls.fromJson(Map<String, dynamic> json) {
    urls = tryConvertToTdObject(json['urls']);
  }
}

abstract class SuggestedAction extends TdObject {}

@reflector
class SuggestedActionEnableArchiveAndMuteNewChats extends SuggestedAction {
  @override
  String get tdType => 'suggestedActionEnableArchiveAndMuteNewChats';

  @override
  Map<String, dynamic> get params => {};

  SuggestedActionEnableArchiveAndMuteNewChats();

  SuggestedActionEnableArchiveAndMuteNewChats.fromJson(Map<String, dynamic> json);
}

@reflector
class SuggestedActionCheckPassword extends SuggestedAction {
  @override
  String get tdType => 'suggestedActionCheckPassword';

  @override
  Map<String, dynamic> get params => {};

  SuggestedActionCheckPassword();

  SuggestedActionCheckPassword.fromJson(Map<String, dynamic> json);
}

@reflector
class SuggestedActionCheckPhoneNumber extends SuggestedAction {
  @override
  String get tdType => 'suggestedActionCheckPhoneNumber';

  @override
  Map<String, dynamic> get params => {};

  SuggestedActionCheckPhoneNumber();

  SuggestedActionCheckPhoneNumber.fromJson(Map<String, dynamic> json);
}

@reflector
class SuggestedActionSeeTicksHint extends SuggestedAction {
  @override
  String get tdType => 'suggestedActionSeeTicksHint';

  @override
  Map<String, dynamic> get params => {};

  SuggestedActionSeeTicksHint();

  SuggestedActionSeeTicksHint.fromJson(Map<String, dynamic> json);
}

@reflector
class SuggestedActionConvertToBroadcastGroup extends SuggestedAction {
  @override
  String get tdType => 'suggestedActionConvertToBroadcastGroup';

   late int supergroupId;

  @override
  Map<String, dynamic> get params => {
    'supergroup_id': supergroupId,
  };

  SuggestedActionConvertToBroadcastGroup({
  required this.supergroupId,
  });

  SuggestedActionConvertToBroadcastGroup.fromJson(Map<String, dynamic> json) {
    supergroupId = tryConvertToTdObject(json['supergroup_id']);
  }
}

@reflector
class Count extends TdObject {
  @override
  String get tdType => 'count';

   late int count;

  @override
  Map<String, dynamic> get params => {
    'count': count,
  };

  Count({
  required this.count,
  });

  Count.fromJson(Map<String, dynamic> json) {
    count = tryConvertToTdObject(json['count']);
  }
}

@reflector
class Text extends TdObject {
  @override
  String get tdType => 'text';

   late String text;

  @override
  Map<String, dynamic> get params => {
    'text': text,
  };

  Text({
  required this.text,
  });

  Text.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
  }
}

@reflector
class Seconds extends TdObject {
  @override
  String get tdType => 'seconds';

   late double seconds;

  @override
  Map<String, dynamic> get params => {
    'seconds': seconds,
  };

  Seconds({
  required this.seconds,
  });

  Seconds.fromJson(Map<String, dynamic> json) {
    seconds = tryConvertToTdObject(json['seconds']);
  }
}

@reflector
class DeepLinkInfo extends TdObject {
  @override
  String get tdType => 'deepLinkInfo';

   late FormattedText text;
   late bool needUpdateApplication;

  @override
  Map<String, dynamic> get params => {
    'text': text,
    'need_update_application': needUpdateApplication,
  };

  DeepLinkInfo({
  required this.text,
  required this.needUpdateApplication,
  });

  DeepLinkInfo.fromJson(Map<String, dynamic> json) {
    text = tryConvertToTdObject(json['text']);
    needUpdateApplication = tryConvertToTdObject(json['need_update_application']);
  }
}

abstract class TextParseMode extends TdObject {}

@reflector
class TextParseModeMarkdown extends TextParseMode {
  @override
  String get tdType => 'textParseModeMarkdown';

   late int version;

  @override
  Map<String, dynamic> get params => {
    'version': version,
  };

  TextParseModeMarkdown({
  required this.version,
  });

  TextParseModeMarkdown.fromJson(Map<String, dynamic> json) {
    version = tryConvertToTdObject(json['version']);
  }
}

@reflector
class TextParseModeHTML extends TextParseMode {
  @override
  String get tdType => 'textParseModeHTML';

  @override
  Map<String, dynamic> get params => {};

  TextParseModeHTML();

  TextParseModeHTML.fromJson(Map<String, dynamic> json);
}

abstract class ProxyType extends TdObject {}

@reflector
class ProxyTypeSocks5 extends ProxyType {
  @override
  String get tdType => 'proxyTypeSocks5';

   late String username;
   late String password;

  @override
  Map<String, dynamic> get params => {
    'username': username,
    'password': password,
  };

  ProxyTypeSocks5({
  required this.username,
  required this.password,
  });

  ProxyTypeSocks5.fromJson(Map<String, dynamic> json) {
    username = tryConvertToTdObject(json['username']);
    password = tryConvertToTdObject(json['password']);
  }
}

@reflector
class ProxyTypeHttp extends ProxyType {
  @override
  String get tdType => 'proxyTypeHttp';

   late String username;
   late String password;
   late bool httpOnly;

  @override
  Map<String, dynamic> get params => {
    'username': username,
    'password': password,
    'http_only': httpOnly,
  };

  ProxyTypeHttp({
  required this.username,
  required this.password,
  required this.httpOnly,
  });

  ProxyTypeHttp.fromJson(Map<String, dynamic> json) {
    username = tryConvertToTdObject(json['username']);
    password = tryConvertToTdObject(json['password']);
    httpOnly = tryConvertToTdObject(json['http_only']);
  }
}

@reflector
class ProxyTypeMtproto extends ProxyType {
  @override
  String get tdType => 'proxyTypeMtproto';

   late String secret;

  @override
  Map<String, dynamic> get params => {
    'secret': secret,
  };

  ProxyTypeMtproto({
  required this.secret,
  });

  ProxyTypeMtproto.fromJson(Map<String, dynamic> json) {
    secret = tryConvertToTdObject(json['secret']);
  }
}

@reflector
class Proxy extends TdObject {
  @override
  String get tdType => 'proxy';

   late int id;
   late String server;
   late int port;
   late int lastUsedDate;
   late bool isEnabled;
   late ProxyType type;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'server': server,
    'port': port,
    'last_used_date': lastUsedDate,
    'is_enabled': isEnabled,
    'type': type,
  };

  Proxy({
  required this.id,
  required this.server,
  required this.port,
  required this.lastUsedDate,
  required this.isEnabled,
  required this.type,
  });

  Proxy.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    server = tryConvertToTdObject(json['server']);
    port = tryConvertToTdObject(json['port']);
    lastUsedDate = tryConvertToTdObject(json['last_used_date']);
    isEnabled = tryConvertToTdObject(json['is_enabled']);
    type = tryConvertToTdObject(json['type']);
  }
}

@reflector
class Proxies extends TdObject {
  @override
  String get tdType => 'proxies';

   late List<Proxy> proxies;

  @override
  Map<String, dynamic> get params => {
    'proxies': proxies,
  };

  Proxies({
  required this.proxies,
  });

  Proxies.fromJson(Map<String, dynamic> json) {
    proxies = tryConvertToTdObject(json['proxies']);
  }
}

abstract class InputSticker extends TdObject {}

@reflector
class InputStickerStatic extends InputSticker {
  @override
  String get tdType => 'inputStickerStatic';

   late InputFile sticker;
   late String emojis;
   late MaskPosition maskPosition;

  @override
  Map<String, dynamic> get params => {
    'sticker': sticker,
    'emojis': emojis,
    'mask_position': maskPosition,
  };

  InputStickerStatic({
  required this.sticker,
  required this.emojis,
  required this.maskPosition,
  });

  InputStickerStatic.fromJson(Map<String, dynamic> json) {
    sticker = tryConvertToTdObject(json['sticker']);
    emojis = tryConvertToTdObject(json['emojis']);
    maskPosition = tryConvertToTdObject(json['mask_position']);
  }
}

@reflector
class InputStickerAnimated extends InputSticker {
  @override
  String get tdType => 'inputStickerAnimated';

   late InputFile sticker;
   late String emojis;

  @override
  Map<String, dynamic> get params => {
    'sticker': sticker,
    'emojis': emojis,
  };

  InputStickerAnimated({
  required this.sticker,
  required this.emojis,
  });

  InputStickerAnimated.fromJson(Map<String, dynamic> json) {
    sticker = tryConvertToTdObject(json['sticker']);
    emojis = tryConvertToTdObject(json['emojis']);
  }
}

@reflector
class DateRange extends TdObject {
  @override
  String get tdType => 'dateRange';

   late int startDate;
   late int endDate;

  @override
  Map<String, dynamic> get params => {
    'start_date': startDate,
    'end_date': endDate,
  };

  DateRange({
  required this.startDate,
  required this.endDate,
  });

  DateRange.fromJson(Map<String, dynamic> json) {
    startDate = tryConvertToTdObject(json['start_date']);
    endDate = tryConvertToTdObject(json['end_date']);
  }
}

@reflector
class StatisticalValue extends TdObject {
  @override
  String get tdType => 'statisticalValue';

   late double value;
   late double previousValue;
   late double growthRatePercentage;

  @override
  Map<String, dynamic> get params => {
    'value': value,
    'previous_value': previousValue,
    'growth_rate_percentage': growthRatePercentage,
  };

  StatisticalValue({
  required this.value,
  required this.previousValue,
  required this.growthRatePercentage,
  });

  StatisticalValue.fromJson(Map<String, dynamic> json) {
    value = tryConvertToTdObject(json['value']);
    previousValue = tryConvertToTdObject(json['previous_value']);
    growthRatePercentage = tryConvertToTdObject(json['growth_rate_percentage']);
  }
}

abstract class StatisticalGraph extends TdObject {}

@reflector
class StatisticalGraphData extends StatisticalGraph {
  @override
  String get tdType => 'statisticalGraphData';

   late String jsonData;
   late String zoomToken;

  @override
  Map<String, dynamic> get params => {
    'json_data': jsonData,
    'zoom_token': zoomToken,
  };

  StatisticalGraphData({
  required this.jsonData,
  required this.zoomToken,
  });

  StatisticalGraphData.fromJson(Map<String, dynamic> json) {
    jsonData = tryConvertToTdObject(json['json_data']);
    zoomToken = tryConvertToTdObject(json['zoom_token']);
  }
}

@reflector
class StatisticalGraphAsync extends StatisticalGraph {
  @override
  String get tdType => 'statisticalGraphAsync';

   late String token;

  @override
  Map<String, dynamic> get params => {
    'token': token,
  };

  StatisticalGraphAsync({
  required this.token,
  });

  StatisticalGraphAsync.fromJson(Map<String, dynamic> json) {
    token = tryConvertToTdObject(json['token']);
  }
}

@reflector
class StatisticalGraphError extends StatisticalGraph {
  @override
  String get tdType => 'statisticalGraphError';

   late String errorMessage;

  @override
  Map<String, dynamic> get params => {
    'error_message': errorMessage,
  };

  StatisticalGraphError({
  required this.errorMessage,
  });

  StatisticalGraphError.fromJson(Map<String, dynamic> json) {
    errorMessage = tryConvertToTdObject(json['error_message']);
  }
}

@reflector
class ChatStatisticsMessageInteractionInfo extends TdObject {
  @override
  String get tdType => 'chatStatisticsMessageInteractionInfo';

   late int messageId;
   late int viewCount;
   late int forwardCount;

  @override
  Map<String, dynamic> get params => {
    'message_id': messageId,
    'view_count': viewCount,
    'forward_count': forwardCount,
  };

  ChatStatisticsMessageInteractionInfo({
  required this.messageId,
  required this.viewCount,
  required this.forwardCount,
  });

  ChatStatisticsMessageInteractionInfo.fromJson(Map<String, dynamic> json) {
    messageId = tryConvertToTdObject(json['message_id']);
    viewCount = tryConvertToTdObject(json['view_count']);
    forwardCount = tryConvertToTdObject(json['forward_count']);
  }
}

@reflector
class ChatStatisticsMessageSenderInfo extends TdObject {
  @override
  String get tdType => 'chatStatisticsMessageSenderInfo';

   late int userId;
   late int sentMessageCount;
   late int averageCharacterCount;

  @override
  Map<String, dynamic> get params => {
    'user_id': userId,
    'sent_message_count': sentMessageCount,
    'average_character_count': averageCharacterCount,
  };

  ChatStatisticsMessageSenderInfo({
  required this.userId,
  required this.sentMessageCount,
  required this.averageCharacterCount,
  });

  ChatStatisticsMessageSenderInfo.fromJson(Map<String, dynamic> json) {
    userId = tryConvertToTdObject(json['user_id']);
    sentMessageCount = tryConvertToTdObject(json['sent_message_count']);
    averageCharacterCount = tryConvertToTdObject(json['average_character_count']);
  }
}

@reflector
class ChatStatisticsAdministratorActionsInfo extends TdObject {
  @override
  String get tdType => 'chatStatisticsAdministratorActionsInfo';

   late int userId;
   late int deletedMessageCount;
   late int bannedUserCount;
   late int restrictedUserCount;

  @override
  Map<String, dynamic> get params => {
    'user_id': userId,
    'deleted_message_count': deletedMessageCount,
    'banned_user_count': bannedUserCount,
    'restricted_user_count': restrictedUserCount,
  };

  ChatStatisticsAdministratorActionsInfo({
  required this.userId,
  required this.deletedMessageCount,
  required this.bannedUserCount,
  required this.restrictedUserCount,
  });

  ChatStatisticsAdministratorActionsInfo.fromJson(Map<String, dynamic> json) {
    userId = tryConvertToTdObject(json['user_id']);
    deletedMessageCount = tryConvertToTdObject(json['deleted_message_count']);
    bannedUserCount = tryConvertToTdObject(json['banned_user_count']);
    restrictedUserCount = tryConvertToTdObject(json['restricted_user_count']);
  }
}

@reflector
class ChatStatisticsInviterInfo extends TdObject {
  @override
  String get tdType => 'chatStatisticsInviterInfo';

   late int userId;
   late int addedMemberCount;

  @override
  Map<String, dynamic> get params => {
    'user_id': userId,
    'added_member_count': addedMemberCount,
  };

  ChatStatisticsInviterInfo({
  required this.userId,
  required this.addedMemberCount,
  });

  ChatStatisticsInviterInfo.fromJson(Map<String, dynamic> json) {
    userId = tryConvertToTdObject(json['user_id']);
    addedMemberCount = tryConvertToTdObject(json['added_member_count']);
  }
}

abstract class ChatStatistics extends TdObject {}

@reflector
class ChatStatisticsSupergroup extends ChatStatistics {
  @override
  String get tdType => 'chatStatisticsSupergroup';

   late DateRange period;
   late StatisticalValue memberCount;
   late StatisticalValue messageCount;
   late StatisticalValue viewerCount;
   late StatisticalValue senderCount;
   late StatisticalGraph memberCountGraph;
   late StatisticalGraph joinGraph;
   late StatisticalGraph joinBySourceGraph;
   late StatisticalGraph languageGraph;
   late StatisticalGraph messageContentGraph;
   late StatisticalGraph actionGraph;
   late StatisticalGraph dayGraph;
   late StatisticalGraph weekGraph;
   late List<ChatStatisticsMessageSenderInfo> topSenders;
   late List<ChatStatisticsAdministratorActionsInfo> topAdministrators;
   late List<ChatStatisticsInviterInfo> topInviters;

  @override
  Map<String, dynamic> get params => {
    'period': period,
    'member_count': memberCount,
    'message_count': messageCount,
    'viewer_count': viewerCount,
    'sender_count': senderCount,
    'member_count_graph': memberCountGraph,
    'join_graph': joinGraph,
    'join_by_source_graph': joinBySourceGraph,
    'language_graph': languageGraph,
    'message_content_graph': messageContentGraph,
    'action_graph': actionGraph,
    'day_graph': dayGraph,
    'week_graph': weekGraph,
    'top_senders': topSenders,
    'top_administrators': topAdministrators,
    'top_inviters': topInviters,
  };

  ChatStatisticsSupergroup({
  required this.period,
  required this.memberCount,
  required this.messageCount,
  required this.viewerCount,
  required this.senderCount,
  required this.memberCountGraph,
  required this.joinGraph,
  required this.joinBySourceGraph,
  required this.languageGraph,
  required this.messageContentGraph,
  required this.actionGraph,
  required this.dayGraph,
  required this.weekGraph,
  required this.topSenders,
  required this.topAdministrators,
  required this.topInviters,
  });

  ChatStatisticsSupergroup.fromJson(Map<String, dynamic> json) {
    period = tryConvertToTdObject(json['period']);
    memberCount = tryConvertToTdObject(json['member_count']);
    messageCount = tryConvertToTdObject(json['message_count']);
    viewerCount = tryConvertToTdObject(json['viewer_count']);
    senderCount = tryConvertToTdObject(json['sender_count']);
    memberCountGraph = tryConvertToTdObject(json['member_count_graph']);
    joinGraph = tryConvertToTdObject(json['join_graph']);
    joinBySourceGraph = tryConvertToTdObject(json['join_by_source_graph']);
    languageGraph = tryConvertToTdObject(json['language_graph']);
    messageContentGraph = tryConvertToTdObject(json['message_content_graph']);
    actionGraph = tryConvertToTdObject(json['action_graph']);
    dayGraph = tryConvertToTdObject(json['day_graph']);
    weekGraph = tryConvertToTdObject(json['week_graph']);
    topSenders = tryConvertToTdObject(json['top_senders']);
    topAdministrators = tryConvertToTdObject(json['top_administrators']);
    topInviters = tryConvertToTdObject(json['top_inviters']);
  }
}

@reflector
class ChatStatisticsChannel extends ChatStatistics {
  @override
  String get tdType => 'chatStatisticsChannel';

   late DateRange period;
   late StatisticalValue memberCount;
   late StatisticalValue meanViewCount;
   late StatisticalValue meanShareCount;
   late double enabledNotificationsPercentage;
   late StatisticalGraph memberCountGraph;
   late StatisticalGraph joinGraph;
   late StatisticalGraph muteGraph;
   late StatisticalGraph viewCountByHourGraph;
   late StatisticalGraph viewCountBySourceGraph;
   late StatisticalGraph joinBySourceGraph;
   late StatisticalGraph languageGraph;
   late StatisticalGraph messageInteractionGraph;
   late StatisticalGraph instantViewInteractionGraph;
   late List<ChatStatisticsMessageInteractionInfo> recentMessageInteractions;

  @override
  Map<String, dynamic> get params => {
    'period': period,
    'member_count': memberCount,
    'mean_view_count': meanViewCount,
    'mean_share_count': meanShareCount,
    'enabled_notifications_percentage': enabledNotificationsPercentage,
    'member_count_graph': memberCountGraph,
    'join_graph': joinGraph,
    'mute_graph': muteGraph,
    'view_count_by_hour_graph': viewCountByHourGraph,
    'view_count_by_source_graph': viewCountBySourceGraph,
    'join_by_source_graph': joinBySourceGraph,
    'language_graph': languageGraph,
    'message_interaction_graph': messageInteractionGraph,
    'instant_view_interaction_graph': instantViewInteractionGraph,
    'recent_message_interactions': recentMessageInteractions,
  };

  ChatStatisticsChannel({
  required this.period,
  required this.memberCount,
  required this.meanViewCount,
  required this.meanShareCount,
  required this.enabledNotificationsPercentage,
  required this.memberCountGraph,
  required this.joinGraph,
  required this.muteGraph,
  required this.viewCountByHourGraph,
  required this.viewCountBySourceGraph,
  required this.joinBySourceGraph,
  required this.languageGraph,
  required this.messageInteractionGraph,
  required this.instantViewInteractionGraph,
  required this.recentMessageInteractions,
  });

  ChatStatisticsChannel.fromJson(Map<String, dynamic> json) {
    period = tryConvertToTdObject(json['period']);
    memberCount = tryConvertToTdObject(json['member_count']);
    meanViewCount = tryConvertToTdObject(json['mean_view_count']);
    meanShareCount = tryConvertToTdObject(json['mean_share_count']);
    enabledNotificationsPercentage = tryConvertToTdObject(json['enabled_notifications_percentage']);
    memberCountGraph = tryConvertToTdObject(json['member_count_graph']);
    joinGraph = tryConvertToTdObject(json['join_graph']);
    muteGraph = tryConvertToTdObject(json['mute_graph']);
    viewCountByHourGraph = tryConvertToTdObject(json['view_count_by_hour_graph']);
    viewCountBySourceGraph = tryConvertToTdObject(json['view_count_by_source_graph']);
    joinBySourceGraph = tryConvertToTdObject(json['join_by_source_graph']);
    languageGraph = tryConvertToTdObject(json['language_graph']);
    messageInteractionGraph = tryConvertToTdObject(json['message_interaction_graph']);
    instantViewInteractionGraph = tryConvertToTdObject(json['instant_view_interaction_graph']);
    recentMessageInteractions = tryConvertToTdObject(json['recent_message_interactions']);
  }
}

@reflector
class MessageStatistics extends TdObject {
  @override
  String get tdType => 'messageStatistics';

   late StatisticalGraph messageInteractionGraph;

  @override
  Map<String, dynamic> get params => {
    'message_interaction_graph': messageInteractionGraph,
  };

  MessageStatistics({
  required this.messageInteractionGraph,
  });

  MessageStatistics.fromJson(Map<String, dynamic> json) {
    messageInteractionGraph = tryConvertToTdObject(json['message_interaction_graph']);
  }
}

@reflector
class Point extends TdObject {
  @override
  String get tdType => 'point';

   late double x;
   late double y;

  @override
  Map<String, dynamic> get params => {
    'x': x,
    'y': y,
  };

  Point({
  required this.x,
  required this.y,
  });

  Point.fromJson(Map<String, dynamic> json) {
    x = tryConvertToTdObject(json['x']);
    y = tryConvertToTdObject(json['y']);
  }
}

abstract class VectorPathCommand extends TdObject {}

@reflector
class VectorPathCommandLine extends VectorPathCommand {
  @override
  String get tdType => 'vectorPathCommandLine';

   late Point endPoint;

  @override
  Map<String, dynamic> get params => {
    'end_point': endPoint,
  };

  VectorPathCommandLine({
  required this.endPoint,
  });

  VectorPathCommandLine.fromJson(Map<String, dynamic> json) {
    endPoint = tryConvertToTdObject(json['end_point']);
  }
}

@reflector
class VectorPathCommandCubicBezierCurve extends VectorPathCommand {
  @override
  String get tdType => 'vectorPathCommandCubicBezierCurve';

   late Point startControlPoint;
   late Point endControlPoint;
   late Point endPoint;

  @override
  Map<String, dynamic> get params => {
    'start_control_point': startControlPoint,
    'end_control_point': endControlPoint,
    'end_point': endPoint,
  };

  VectorPathCommandCubicBezierCurve({
  required this.startControlPoint,
  required this.endControlPoint,
  required this.endPoint,
  });

  VectorPathCommandCubicBezierCurve.fromJson(Map<String, dynamic> json) {
    startControlPoint = tryConvertToTdObject(json['start_control_point']);
    endControlPoint = tryConvertToTdObject(json['end_control_point']);
    endPoint = tryConvertToTdObject(json['end_point']);
  }
}

abstract class BotCommandScope extends TdObject {}

@reflector
class BotCommandScopeDefault extends BotCommandScope {
  @override
  String get tdType => 'botCommandScopeDefault';

  @override
  Map<String, dynamic> get params => {};

  BotCommandScopeDefault();

  BotCommandScopeDefault.fromJson(Map<String, dynamic> json);
}

@reflector
class BotCommandScopeAllPrivateChats extends BotCommandScope {
  @override
  String get tdType => 'botCommandScopeAllPrivateChats';

  @override
  Map<String, dynamic> get params => {};

  BotCommandScopeAllPrivateChats();

  BotCommandScopeAllPrivateChats.fromJson(Map<String, dynamic> json);
}

@reflector
class BotCommandScopeAllGroupChats extends BotCommandScope {
  @override
  String get tdType => 'botCommandScopeAllGroupChats';

  @override
  Map<String, dynamic> get params => {};

  BotCommandScopeAllGroupChats();

  BotCommandScopeAllGroupChats.fromJson(Map<String, dynamic> json);
}

@reflector
class BotCommandScopeAllChatAdministrators extends BotCommandScope {
  @override
  String get tdType => 'botCommandScopeAllChatAdministrators';

  @override
  Map<String, dynamic> get params => {};

  BotCommandScopeAllChatAdministrators();

  BotCommandScopeAllChatAdministrators.fromJson(Map<String, dynamic> json);
}

@reflector
class BotCommandScopeChat extends BotCommandScope {
  @override
  String get tdType => 'botCommandScopeChat';

   late int chatId;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
  };

  BotCommandScopeChat({
  required this.chatId,
  });

  BotCommandScopeChat.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
  }
}

@reflector
class BotCommandScopeChatAdministrators extends BotCommandScope {
  @override
  String get tdType => 'botCommandScopeChatAdministrators';

   late int chatId;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
  };

  BotCommandScopeChatAdministrators({
  required this.chatId,
  });

  BotCommandScopeChatAdministrators.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
  }
}

@reflector
class BotCommandScopeChatMember extends BotCommandScope {
  @override
  String get tdType => 'botCommandScopeChatMember';

   late int chatId;
   late int userId;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'user_id': userId,
  };

  BotCommandScopeChatMember({
  required this.chatId,
  required this.userId,
  });

  BotCommandScopeChatMember.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    userId = tryConvertToTdObject(json['user_id']);
  }
}

abstract class Update extends TdObject {}

@reflector
class UpdateAuthorizationState extends Update {
  @override
  String get tdType => 'updateAuthorizationState';

   late AuthorizationState authorizationState;

  @override
  Map<String, dynamic> get params => {
    'authorization_state': authorizationState,
  };

  UpdateAuthorizationState({
  required this.authorizationState,
  });

  UpdateAuthorizationState.fromJson(Map<String, dynamic> json) {
    authorizationState = tryConvertToTdObject(json['authorization_state']);
  }
}

@reflector
class UpdateNewMessage extends Update {
  @override
  String get tdType => 'updateNewMessage';

   late Message message;

  @override
  Map<String, dynamic> get params => {
    'message': message,
  };

  UpdateNewMessage({
  required this.message,
  });

  UpdateNewMessage.fromJson(Map<String, dynamic> json) {
    message = tryConvertToTdObject(json['message']);
  }
}

@reflector
class UpdateMessageSendAcknowledged extends Update {
  @override
  String get tdType => 'updateMessageSendAcknowledged';

   late int chatId;
   late int messageId;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'message_id': messageId,
  };

  UpdateMessageSendAcknowledged({
  required this.chatId,
  required this.messageId,
  });

  UpdateMessageSendAcknowledged.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    messageId = tryConvertToTdObject(json['message_id']);
  }
}

@reflector
class UpdateMessageSendSucceeded extends Update {
  @override
  String get tdType => 'updateMessageSendSucceeded';

   late Message message;
   late int oldMessageId;

  @override
  Map<String, dynamic> get params => {
    'message': message,
    'old_message_id': oldMessageId,
  };

  UpdateMessageSendSucceeded({
  required this.message,
  required this.oldMessageId,
  });

  UpdateMessageSendSucceeded.fromJson(Map<String, dynamic> json) {
    message = tryConvertToTdObject(json['message']);
    oldMessageId = tryConvertToTdObject(json['old_message_id']);
  }
}

@reflector
class UpdateMessageSendFailed extends Update {
  @override
  String get tdType => 'updateMessageSendFailed';

   late Message message;
   late int oldMessageId;
   late int errorCode;
   late String errorMessage;

  @override
  Map<String, dynamic> get params => {
    'message': message,
    'old_message_id': oldMessageId,
    'error_code': errorCode,
    'error_message': errorMessage,
  };

  UpdateMessageSendFailed({
  required this.message,
  required this.oldMessageId,
  required this.errorCode,
  required this.errorMessage,
  });

  UpdateMessageSendFailed.fromJson(Map<String, dynamic> json) {
    message = tryConvertToTdObject(json['message']);
    oldMessageId = tryConvertToTdObject(json['old_message_id']);
    errorCode = tryConvertToTdObject(json['error_code']);
    errorMessage = tryConvertToTdObject(json['error_message']);
  }
}

@reflector
class UpdateMessageContent extends Update {
  @override
  String get tdType => 'updateMessageContent';

   late int chatId;
   late int messageId;
   late MessageContent newContent;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'message_id': messageId,
    'new_content': newContent,
  };

  UpdateMessageContent({
  required this.chatId,
  required this.messageId,
  required this.newContent,
  });

  UpdateMessageContent.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    messageId = tryConvertToTdObject(json['message_id']);
    newContent = tryConvertToTdObject(json['new_content']);
  }
}

@reflector
class UpdateMessageEdited extends Update {
  @override
  String get tdType => 'updateMessageEdited';

   late int chatId;
   late int messageId;
   late int editDate;
   late ReplyMarkup replyMarkup;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'message_id': messageId,
    'edit_date': editDate,
    'reply_markup': replyMarkup,
  };

  UpdateMessageEdited({
  required this.chatId,
  required this.messageId,
  required this.editDate,
  required this.replyMarkup,
  });

  UpdateMessageEdited.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    messageId = tryConvertToTdObject(json['message_id']);
    editDate = tryConvertToTdObject(json['edit_date']);
    replyMarkup = tryConvertToTdObject(json['reply_markup']);
  }
}

@reflector
class UpdateMessageIsPinned extends Update {
  @override
  String get tdType => 'updateMessageIsPinned';

   late int chatId;
   late int messageId;
   late bool isPinned;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'message_id': messageId,
    'is_pinned': isPinned,
  };

  UpdateMessageIsPinned({
  required this.chatId,
  required this.messageId,
  required this.isPinned,
  });

  UpdateMessageIsPinned.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    messageId = tryConvertToTdObject(json['message_id']);
    isPinned = tryConvertToTdObject(json['is_pinned']);
  }
}

@reflector
class UpdateMessageInteractionInfo extends Update {
  @override
  String get tdType => 'updateMessageInteractionInfo';

   late int chatId;
   late int messageId;
   late MessageInteractionInfo interactionInfo;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'message_id': messageId,
    'interaction_info': interactionInfo,
  };

  UpdateMessageInteractionInfo({
  required this.chatId,
  required this.messageId,
  required this.interactionInfo,
  });

  UpdateMessageInteractionInfo.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    messageId = tryConvertToTdObject(json['message_id']);
    interactionInfo = tryConvertToTdObject(json['interaction_info']);
  }
}

@reflector
class UpdateMessageContentOpened extends Update {
  @override
  String get tdType => 'updateMessageContentOpened';

   late int chatId;
   late int messageId;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'message_id': messageId,
  };

  UpdateMessageContentOpened({
  required this.chatId,
  required this.messageId,
  });

  UpdateMessageContentOpened.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    messageId = tryConvertToTdObject(json['message_id']);
  }
}

@reflector
class UpdateMessageMentionRead extends Update {
  @override
  String get tdType => 'updateMessageMentionRead';

   late int chatId;
   late int messageId;
   late int unreadMentionCount;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'message_id': messageId,
    'unread_mention_count': unreadMentionCount,
  };

  UpdateMessageMentionRead({
  required this.chatId,
  required this.messageId,
  required this.unreadMentionCount,
  });

  UpdateMessageMentionRead.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    messageId = tryConvertToTdObject(json['message_id']);
    unreadMentionCount = tryConvertToTdObject(json['unread_mention_count']);
  }
}

@reflector
class UpdateMessageLiveLocationViewed extends Update {
  @override
  String get tdType => 'updateMessageLiveLocationViewed';

   late int chatId;
   late int messageId;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'message_id': messageId,
  };

  UpdateMessageLiveLocationViewed({
  required this.chatId,
  required this.messageId,
  });

  UpdateMessageLiveLocationViewed.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    messageId = tryConvertToTdObject(json['message_id']);
  }
}

@reflector
class UpdateNewChat extends Update {
  @override
  String get tdType => 'updateNewChat';

   late Chat chat;

  @override
  Map<String, dynamic> get params => {
    'chat': chat,
  };

  UpdateNewChat({
  required this.chat,
  });

  UpdateNewChat.fromJson(Map<String, dynamic> json) {
    chat = tryConvertToTdObject(json['chat']);
  }
}

@reflector
class UpdateChatTitle extends Update {
  @override
  String get tdType => 'updateChatTitle';

   late int chatId;
   late String title;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'title': title,
  };

  UpdateChatTitle({
  required this.chatId,
  required this.title,
  });

  UpdateChatTitle.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    title = tryConvertToTdObject(json['title']);
  }
}

@reflector
class UpdateChatPhoto extends Update {
  @override
  String get tdType => 'updateChatPhoto';

   late int chatId;
   late ChatPhotoInfo photo;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'photo': photo,
  };

  UpdateChatPhoto({
  required this.chatId,
  required this.photo,
  });

  UpdateChatPhoto.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    photo = tryConvertToTdObject(json['photo']);
  }
}

@reflector
class UpdateChatPermissions extends Update {
  @override
  String get tdType => 'updateChatPermissions';

   late int chatId;
   late ChatPermissions permissions;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'permissions': permissions,
  };

  UpdateChatPermissions({
  required this.chatId,
  required this.permissions,
  });

  UpdateChatPermissions.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    permissions = tryConvertToTdObject(json['permissions']);
  }
}

@reflector
class UpdateChatLastMessage extends Update {
  @override
  String get tdType => 'updateChatLastMessage';

   late int chatId;
   late Message lastMessage;
   late List<ChatPosition> positions;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'last_message': lastMessage,
    'positions': positions,
  };

  UpdateChatLastMessage({
  required this.chatId,
  required this.lastMessage,
  required this.positions,
  });

  UpdateChatLastMessage.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    lastMessage = tryConvertToTdObject(json['last_message']);
    positions = tryConvertToTdObject(json['positions']);
  }
}

@reflector
class UpdateChatPosition extends Update {
  @override
  String get tdType => 'updateChatPosition';

   late int chatId;
   late ChatPosition position;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'position': position,
  };

  UpdateChatPosition({
  required this.chatId,
  required this.position,
  });

  UpdateChatPosition.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    position = tryConvertToTdObject(json['position']);
  }
}

@reflector
class UpdateChatIsMarkedAsUnread extends Update {
  @override
  String get tdType => 'updateChatIsMarkedAsUnread';

   late int chatId;
   late bool isMarkedAsUnread;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'is_marked_as_unread': isMarkedAsUnread,
  };

  UpdateChatIsMarkedAsUnread({
  required this.chatId,
  required this.isMarkedAsUnread,
  });

  UpdateChatIsMarkedAsUnread.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    isMarkedAsUnread = tryConvertToTdObject(json['is_marked_as_unread']);
  }
}

@reflector
class UpdateChatIsBlocked extends Update {
  @override
  String get tdType => 'updateChatIsBlocked';

   late int chatId;
   late bool isBlocked;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'is_blocked': isBlocked,
  };

  UpdateChatIsBlocked({
  required this.chatId,
  required this.isBlocked,
  });

  UpdateChatIsBlocked.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    isBlocked = tryConvertToTdObject(json['is_blocked']);
  }
}

@reflector
class UpdateChatHasScheduledMessages extends Update {
  @override
  String get tdType => 'updateChatHasScheduledMessages';

   late int chatId;
   late bool hasScheduledMessages;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'has_scheduled_messages': hasScheduledMessages,
  };

  UpdateChatHasScheduledMessages({
  required this.chatId,
  required this.hasScheduledMessages,
  });

  UpdateChatHasScheduledMessages.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    hasScheduledMessages = tryConvertToTdObject(json['has_scheduled_messages']);
  }
}

@reflector
class UpdateChatVoiceChat extends Update {
  @override
  String get tdType => 'updateChatVoiceChat';

   late int chatId;
   late VoiceChat voiceChat;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'voice_chat': voiceChat,
  };

  UpdateChatVoiceChat({
  required this.chatId,
  required this.voiceChat,
  });

  UpdateChatVoiceChat.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    voiceChat = tryConvertToTdObject(json['voice_chat']);
  }
}

@reflector
class UpdateChatDefaultDisableNotification extends Update {
  @override
  String get tdType => 'updateChatDefaultDisableNotification';

   late int chatId;
   late bool defaultDisableNotification;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'default_disable_notification': defaultDisableNotification,
  };

  UpdateChatDefaultDisableNotification({
  required this.chatId,
  required this.defaultDisableNotification,
  });

  UpdateChatDefaultDisableNotification.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    defaultDisableNotification = tryConvertToTdObject(json['default_disable_notification']);
  }
}

@reflector
class UpdateChatReadInbox extends Update {
  @override
  String get tdType => 'updateChatReadInbox';

   late int chatId;
   late int lastReadInboxMessageId;
   late int unreadCount;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'last_read_inbox_message_id': lastReadInboxMessageId,
    'unread_count': unreadCount,
  };

  UpdateChatReadInbox({
  required this.chatId,
  required this.lastReadInboxMessageId,
  required this.unreadCount,
  });

  UpdateChatReadInbox.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    lastReadInboxMessageId = tryConvertToTdObject(json['last_read_inbox_message_id']);
    unreadCount = tryConvertToTdObject(json['unread_count']);
  }
}

@reflector
class UpdateChatReadOutbox extends Update {
  @override
  String get tdType => 'updateChatReadOutbox';

   late int chatId;
   late int lastReadOutboxMessageId;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'last_read_outbox_message_id': lastReadOutboxMessageId,
  };

  UpdateChatReadOutbox({
  required this.chatId,
  required this.lastReadOutboxMessageId,
  });

  UpdateChatReadOutbox.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    lastReadOutboxMessageId = tryConvertToTdObject(json['last_read_outbox_message_id']);
  }
}

@reflector
class UpdateChatUnreadMentionCount extends Update {
  @override
  String get tdType => 'updateChatUnreadMentionCount';

   late int chatId;
   late int unreadMentionCount;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'unread_mention_count': unreadMentionCount,
  };

  UpdateChatUnreadMentionCount({
  required this.chatId,
  required this.unreadMentionCount,
  });

  UpdateChatUnreadMentionCount.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    unreadMentionCount = tryConvertToTdObject(json['unread_mention_count']);
  }
}

@reflector
class UpdateChatNotificationSettings extends Update {
  @override
  String get tdType => 'updateChatNotificationSettings';

   late int chatId;
   late ChatNotificationSettings notificationSettings;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'notification_settings': notificationSettings,
  };

  UpdateChatNotificationSettings({
  required this.chatId,
  required this.notificationSettings,
  });

  UpdateChatNotificationSettings.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    notificationSettings = tryConvertToTdObject(json['notification_settings']);
  }
}

@reflector
class UpdateScopeNotificationSettings extends Update {
  @override
  String get tdType => 'updateScopeNotificationSettings';

   late NotificationSettingsScope scope;
   late ScopeNotificationSettings notificationSettings;

  @override
  Map<String, dynamic> get params => {
    'scope': scope,
    'notification_settings': notificationSettings,
  };

  UpdateScopeNotificationSettings({
  required this.scope,
  required this.notificationSettings,
  });

  UpdateScopeNotificationSettings.fromJson(Map<String, dynamic> json) {
    scope = tryConvertToTdObject(json['scope']);
    notificationSettings = tryConvertToTdObject(json['notification_settings']);
  }
}

@reflector
class UpdateChatMessageTtlSetting extends Update {
  @override
  String get tdType => 'updateChatMessageTtlSetting';

   late int chatId;
   late int messageTtlSetting;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'message_ttl_setting': messageTtlSetting,
  };

  UpdateChatMessageTtlSetting({
  required this.chatId,
  required this.messageTtlSetting,
  });

  UpdateChatMessageTtlSetting.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    messageTtlSetting = tryConvertToTdObject(json['message_ttl_setting']);
  }
}

@reflector
class UpdateChatActionBar extends Update {
  @override
  String get tdType => 'updateChatActionBar';

   late int chatId;
   late ChatActionBar actionBar;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'action_bar': actionBar,
  };

  UpdateChatActionBar({
  required this.chatId,
  required this.actionBar,
  });

  UpdateChatActionBar.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    actionBar = tryConvertToTdObject(json['action_bar']);
  }
}

@reflector
class UpdateChatTheme extends Update {
  @override
  String get tdType => 'updateChatTheme';

   late int chatId;
   late String themeName;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'theme_name': themeName,
  };

  UpdateChatTheme({
  required this.chatId,
  required this.themeName,
  });

  UpdateChatTheme.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    themeName = tryConvertToTdObject(json['theme_name']);
  }
}

@reflector
class UpdateChatReplyMarkup extends Update {
  @override
  String get tdType => 'updateChatReplyMarkup';

   late int chatId;
   late int replyMarkupMessageId;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'reply_markup_message_id': replyMarkupMessageId,
  };

  UpdateChatReplyMarkup({
  required this.chatId,
  required this.replyMarkupMessageId,
  });

  UpdateChatReplyMarkup.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    replyMarkupMessageId = tryConvertToTdObject(json['reply_markup_message_id']);
  }
}

@reflector
class UpdateChatDraftMessage extends Update {
  @override
  String get tdType => 'updateChatDraftMessage';

   late int chatId;
   late DraftMessage draftMessage;
   late List<ChatPosition> positions;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'draft_message': draftMessage,
    'positions': positions,
  };

  UpdateChatDraftMessage({
  required this.chatId,
  required this.draftMessage,
  required this.positions,
  });

  UpdateChatDraftMessage.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    draftMessage = tryConvertToTdObject(json['draft_message']);
    positions = tryConvertToTdObject(json['positions']);
  }
}

@reflector
class UpdateChatFilters extends Update {
  @override
  String get tdType => 'updateChatFilters';

   late List<ChatFilterInfo> chatFilters;

  @override
  Map<String, dynamic> get params => {
    'chat_filters': chatFilters,
  };

  UpdateChatFilters({
  required this.chatFilters,
  });

  UpdateChatFilters.fromJson(Map<String, dynamic> json) {
    chatFilters = tryConvertToTdObject(json['chat_filters']);
  }
}

@reflector
class UpdateChatOnlineMemberCount extends Update {
  @override
  String get tdType => 'updateChatOnlineMemberCount';

   late int chatId;
   late int onlineMemberCount;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'online_member_count': onlineMemberCount,
  };

  UpdateChatOnlineMemberCount({
  required this.chatId,
  required this.onlineMemberCount,
  });

  UpdateChatOnlineMemberCount.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    onlineMemberCount = tryConvertToTdObject(json['online_member_count']);
  }
}

@reflector
class UpdateNotification extends Update {
  @override
  String get tdType => 'updateNotification';

   late int notificationGroupId;
   late Notification notification;

  @override
  Map<String, dynamic> get params => {
    'notification_group_id': notificationGroupId,
    'notification': notification,
  };

  UpdateNotification({
  required this.notificationGroupId,
  required this.notification,
  });

  UpdateNotification.fromJson(Map<String, dynamic> json) {
    notificationGroupId = tryConvertToTdObject(json['notification_group_id']);
    notification = tryConvertToTdObject(json['notification']);
  }
}

@reflector
class UpdateNotificationGroup extends Update {
  @override
  String get tdType => 'updateNotificationGroup';

   late int notificationGroupId;
   late NotificationGroupType type;
   late int chatId;
   late int notificationSettingsChatId;
   late bool isSilent;
   late int totalCount;
   late List<Notification> addedNotifications;
   late List<int> removedNotificationIds;

  @override
  Map<String, dynamic> get params => {
    'notification_group_id': notificationGroupId,
    'type': type,
    'chat_id': chatId,
    'notification_settings_chat_id': notificationSettingsChatId,
    'is_silent': isSilent,
    'total_count': totalCount,
    'added_notifications': addedNotifications,
    'removed_notification_ids': removedNotificationIds,
  };

  UpdateNotificationGroup({
  required this.notificationGroupId,
  required this.type,
  required this.chatId,
  required this.notificationSettingsChatId,
  required this.isSilent,
  required this.totalCount,
  required this.addedNotifications,
  required this.removedNotificationIds,
  });

  UpdateNotificationGroup.fromJson(Map<String, dynamic> json) {
    notificationGroupId = tryConvertToTdObject(json['notification_group_id']);
    type = tryConvertToTdObject(json['type']);
    chatId = tryConvertToTdObject(json['chat_id']);
    notificationSettingsChatId = tryConvertToTdObject(json['notification_settings_chat_id']);
    isSilent = tryConvertToTdObject(json['is_silent']);
    totalCount = tryConvertToTdObject(json['total_count']);
    addedNotifications = tryConvertToTdObject(json['added_notifications']);
    removedNotificationIds = tryConvertToTdObject(json['removed_notification_ids']);
  }
}

@reflector
class UpdateActiveNotifications extends Update {
  @override
  String get tdType => 'updateActiveNotifications';

   late List<NotificationGroup> groups;

  @override
  Map<String, dynamic> get params => {
    'groups': groups,
  };

  UpdateActiveNotifications({
  required this.groups,
  });

  UpdateActiveNotifications.fromJson(Map<String, dynamic> json) {
    groups = tryConvertToTdObject(json['groups']);
  }
}

@reflector
class UpdateHavePendingNotifications extends Update {
  @override
  String get tdType => 'updateHavePendingNotifications';

   late bool haveDelayedNotifications;
   late bool haveUnreceivedNotifications;

  @override
  Map<String, dynamic> get params => {
    'have_delayed_notifications': haveDelayedNotifications,
    'have_unreceived_notifications': haveUnreceivedNotifications,
  };

  UpdateHavePendingNotifications({
  required this.haveDelayedNotifications,
  required this.haveUnreceivedNotifications,
  });

  UpdateHavePendingNotifications.fromJson(Map<String, dynamic> json) {
    haveDelayedNotifications = tryConvertToTdObject(json['have_delayed_notifications']);
    haveUnreceivedNotifications = tryConvertToTdObject(json['have_unreceived_notifications']);
  }
}

@reflector
class UpdateDeleteMessages extends Update {
  @override
  String get tdType => 'updateDeleteMessages';

   late int chatId;
   late List<int> messageIds;
   late bool isPermanent;
   late bool fromCache;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'message_ids': messageIds,
    'is_permanent': isPermanent,
    'from_cache': fromCache,
  };

  UpdateDeleteMessages({
  required this.chatId,
  required this.messageIds,
  required this.isPermanent,
  required this.fromCache,
  });

  UpdateDeleteMessages.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    messageIds = tryConvertToTdObject(json['message_ids']);
    isPermanent = tryConvertToTdObject(json['is_permanent']);
    fromCache = tryConvertToTdObject(json['from_cache']);
  }
}

@reflector
class UpdateUserChatAction extends Update {
  @override
  String get tdType => 'updateUserChatAction';

   late int chatId;
   late int messageThreadId;
   late int userId;
   late ChatAction action;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'message_thread_id': messageThreadId,
    'user_id': userId,
    'action': action,
  };

  UpdateUserChatAction({
  required this.chatId,
  required this.messageThreadId,
  required this.userId,
  required this.action,
  });

  UpdateUserChatAction.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    messageThreadId = tryConvertToTdObject(json['message_thread_id']);
    userId = tryConvertToTdObject(json['user_id']);
    action = tryConvertToTdObject(json['action']);
  }
}

@reflector
class UpdateUserStatus extends Update {
  @override
  String get tdType => 'updateUserStatus';

   late int userId;
   late UserStatus status;

  @override
  Map<String, dynamic> get params => {
    'user_id': userId,
    'status': status,
  };

  UpdateUserStatus({
  required this.userId,
  required this.status,
  });

  UpdateUserStatus.fromJson(Map<String, dynamic> json) {
    userId = tryConvertToTdObject(json['user_id']);
    status = tryConvertToTdObject(json['status']);
  }
}

@reflector
class UpdateUser extends Update {
  @override
  String get tdType => 'updateUser';

   late User user;

  @override
  Map<String, dynamic> get params => {
    'user': user,
  };

  UpdateUser({
  required this.user,
  });

  UpdateUser.fromJson(Map<String, dynamic> json) {
    user = tryConvertToTdObject(json['user']);
  }
}

@reflector
class UpdateBasicGroup extends Update {
  @override
  String get tdType => 'updateBasicGroup';

   late BasicGroup basicGroup;

  @override
  Map<String, dynamic> get params => {
    'basic_group': basicGroup,
  };

  UpdateBasicGroup({
  required this.basicGroup,
  });

  UpdateBasicGroup.fromJson(Map<String, dynamic> json) {
    basicGroup = tryConvertToTdObject(json['basic_group']);
  }
}

@reflector
class UpdateSupergroup extends Update {
  @override
  String get tdType => 'updateSupergroup';

   late Supergroup supergroup;

  @override
  Map<String, dynamic> get params => {
    'supergroup': supergroup,
  };

  UpdateSupergroup({
  required this.supergroup,
  });

  UpdateSupergroup.fromJson(Map<String, dynamic> json) {
    supergroup = tryConvertToTdObject(json['supergroup']);
  }
}

@reflector
class UpdateSecretChat extends Update {
  @override
  String get tdType => 'updateSecretChat';

   late SecretChat secretChat;

  @override
  Map<String, dynamic> get params => {
    'secret_chat': secretChat,
  };

  UpdateSecretChat({
  required this.secretChat,
  });

  UpdateSecretChat.fromJson(Map<String, dynamic> json) {
    secretChat = tryConvertToTdObject(json['secret_chat']);
  }
}

@reflector
class UpdateUserFullInfo extends Update {
  @override
  String get tdType => 'updateUserFullInfo';

   late int userId;
   late UserFullInfo userFullInfo;

  @override
  Map<String, dynamic> get params => {
    'user_id': userId,
    'user_full_info': userFullInfo,
  };

  UpdateUserFullInfo({
  required this.userId,
  required this.userFullInfo,
  });

  UpdateUserFullInfo.fromJson(Map<String, dynamic> json) {
    userId = tryConvertToTdObject(json['user_id']);
    userFullInfo = tryConvertToTdObject(json['user_full_info']);
  }
}

@reflector
class UpdateBasicGroupFullInfo extends Update {
  @override
  String get tdType => 'updateBasicGroupFullInfo';

   late int basicGroupId;
   late BasicGroupFullInfo basicGroupFullInfo;

  @override
  Map<String, dynamic> get params => {
    'basic_group_id': basicGroupId,
    'basic_group_full_info': basicGroupFullInfo,
  };

  UpdateBasicGroupFullInfo({
  required this.basicGroupId,
  required this.basicGroupFullInfo,
  });

  UpdateBasicGroupFullInfo.fromJson(Map<String, dynamic> json) {
    basicGroupId = tryConvertToTdObject(json['basic_group_id']);
    basicGroupFullInfo = tryConvertToTdObject(json['basic_group_full_info']);
  }
}

@reflector
class UpdateSupergroupFullInfo extends Update {
  @override
  String get tdType => 'updateSupergroupFullInfo';

   late int supergroupId;
   late SupergroupFullInfo supergroupFullInfo;

  @override
  Map<String, dynamic> get params => {
    'supergroup_id': supergroupId,
    'supergroup_full_info': supergroupFullInfo,
  };

  UpdateSupergroupFullInfo({
  required this.supergroupId,
  required this.supergroupFullInfo,
  });

  UpdateSupergroupFullInfo.fromJson(Map<String, dynamic> json) {
    supergroupId = tryConvertToTdObject(json['supergroup_id']);
    supergroupFullInfo = tryConvertToTdObject(json['supergroup_full_info']);
  }
}

@reflector
class UpdateServiceNotification extends Update {
  @override
  String get tdType => 'updateServiceNotification';

   late String type;
   late MessageContent content;

  @override
  Map<String, dynamic> get params => {
    'type': type,
    'content': content,
  };

  UpdateServiceNotification({
  required this.type,
  required this.content,
  });

  UpdateServiceNotification.fromJson(Map<String, dynamic> json) {
    type = tryConvertToTdObject(json['type']);
    content = tryConvertToTdObject(json['content']);
  }
}

@reflector
class UpdateFile extends Update {
  @override
  String get tdType => 'updateFile';

   late File file;

  @override
  Map<String, dynamic> get params => {
    'file': file,
  };

  UpdateFile({
  required this.file,
  });

  UpdateFile.fromJson(Map<String, dynamic> json) {
    file = tryConvertToTdObject(json['file']);
  }
}

@reflector
class UpdateFileGenerationStart extends Update {
  @override
  String get tdType => 'updateFileGenerationStart';

   late int generationId;
   late String originalPath;
   late String destinationPath;
   late String conversion;

  @override
  Map<String, dynamic> get params => {
    'generation_id': generationId,
    'original_path': originalPath,
    'destination_path': destinationPath,
    'conversion': conversion,
  };

  UpdateFileGenerationStart({
  required this.generationId,
  required this.originalPath,
  required this.destinationPath,
  required this.conversion,
  });

  UpdateFileGenerationStart.fromJson(Map<String, dynamic> json) {
    generationId = tryConvertToTdObject(json['generation_id']);
    originalPath = tryConvertToTdObject(json['original_path']);
    destinationPath = tryConvertToTdObject(json['destination_path']);
    conversion = tryConvertToTdObject(json['conversion']);
  }
}

@reflector
class UpdateFileGenerationStop extends Update {
  @override
  String get tdType => 'updateFileGenerationStop';

   late int generationId;

  @override
  Map<String, dynamic> get params => {
    'generation_id': generationId,
  };

  UpdateFileGenerationStop({
  required this.generationId,
  });

  UpdateFileGenerationStop.fromJson(Map<String, dynamic> json) {
    generationId = tryConvertToTdObject(json['generation_id']);
  }
}

@reflector
class UpdateCall extends Update {
  @override
  String get tdType => 'updateCall';

   late Call call;

  @override
  Map<String, dynamic> get params => {
    'call': call,
  };

  UpdateCall({
  required this.call,
  });

  UpdateCall.fromJson(Map<String, dynamic> json) {
    call = tryConvertToTdObject(json['call']);
  }
}

@reflector
class UpdateGroupCall extends Update {
  @override
  String get tdType => 'updateGroupCall';

   late GroupCall groupCall;

  @override
  Map<String, dynamic> get params => {
    'group_call': groupCall,
  };

  UpdateGroupCall({
  required this.groupCall,
  });

  UpdateGroupCall.fromJson(Map<String, dynamic> json) {
    groupCall = tryConvertToTdObject(json['group_call']);
  }
}

@reflector
class UpdateGroupCallParticipant extends Update {
  @override
  String get tdType => 'updateGroupCallParticipant';

   late int groupCallId;
   late GroupCallParticipant participant;

  @override
  Map<String, dynamic> get params => {
    'group_call_id': groupCallId,
    'participant': participant,
  };

  UpdateGroupCallParticipant({
  required this.groupCallId,
  required this.participant,
  });

  UpdateGroupCallParticipant.fromJson(Map<String, dynamic> json) {
    groupCallId = tryConvertToTdObject(json['group_call_id']);
    participant = tryConvertToTdObject(json['participant']);
  }
}

@reflector
class UpdateNewCallSignalingData extends Update {
  @override
  String get tdType => 'updateNewCallSignalingData';

   late int callId;
   late String data;

  @override
  Map<String, dynamic> get params => {
    'call_id': callId,
    'data': data,
  };

  UpdateNewCallSignalingData({
  required this.callId,
  required this.data,
  });

  UpdateNewCallSignalingData.fromJson(Map<String, dynamic> json) {
    callId = tryConvertToTdObject(json['call_id']);
    data = tryConvertToTdObject(json['data']);
  }
}

@reflector
class UpdateUserPrivacySettingRules extends Update {
  @override
  String get tdType => 'updateUserPrivacySettingRules';

   late UserPrivacySetting setting;
   late UserPrivacySettingRules rules;

  @override
  Map<String, dynamic> get params => {
    'setting': setting,
    'rules': rules,
  };

  UpdateUserPrivacySettingRules({
  required this.setting,
  required this.rules,
  });

  UpdateUserPrivacySettingRules.fromJson(Map<String, dynamic> json) {
    setting = tryConvertToTdObject(json['setting']);
    rules = tryConvertToTdObject(json['rules']);
  }
}

@reflector
class UpdateUnreadMessageCount extends Update {
  @override
  String get tdType => 'updateUnreadMessageCount';

   late ChatList chatList;
   late int unreadCount;
   late int unreadUnmutedCount;

  @override
  Map<String, dynamic> get params => {
    'chat_list': chatList,
    'unread_count': unreadCount,
    'unread_unmuted_count': unreadUnmutedCount,
  };

  UpdateUnreadMessageCount({
  required this.chatList,
  required this.unreadCount,
  required this.unreadUnmutedCount,
  });

  UpdateUnreadMessageCount.fromJson(Map<String, dynamic> json) {
    chatList = tryConvertToTdObject(json['chat_list']);
    unreadCount = tryConvertToTdObject(json['unread_count']);
    unreadUnmutedCount = tryConvertToTdObject(json['unread_unmuted_count']);
  }
}

@reflector
class UpdateUnreadChatCount extends Update {
  @override
  String get tdType => 'updateUnreadChatCount';

   late ChatList chatList;
   late int totalCount;
   late int unreadCount;
   late int unreadUnmutedCount;
   late int markedAsUnreadCount;
   late int markedAsUnreadUnmutedCount;

  @override
  Map<String, dynamic> get params => {
    'chat_list': chatList,
    'total_count': totalCount,
    'unread_count': unreadCount,
    'unread_unmuted_count': unreadUnmutedCount,
    'marked_as_unread_count': markedAsUnreadCount,
    'marked_as_unread_unmuted_count': markedAsUnreadUnmutedCount,
  };

  UpdateUnreadChatCount({
  required this.chatList,
  required this.totalCount,
  required this.unreadCount,
  required this.unreadUnmutedCount,
  required this.markedAsUnreadCount,
  required this.markedAsUnreadUnmutedCount,
  });

  UpdateUnreadChatCount.fromJson(Map<String, dynamic> json) {
    chatList = tryConvertToTdObject(json['chat_list']);
    totalCount = tryConvertToTdObject(json['total_count']);
    unreadCount = tryConvertToTdObject(json['unread_count']);
    unreadUnmutedCount = tryConvertToTdObject(json['unread_unmuted_count']);
    markedAsUnreadCount = tryConvertToTdObject(json['marked_as_unread_count']);
    markedAsUnreadUnmutedCount = tryConvertToTdObject(json['marked_as_unread_unmuted_count']);
  }
}

@reflector
class UpdateOption extends Update {
  @override
  String get tdType => 'updateOption';

   late String name;
   late OptionValue value;

  @override
  Map<String, dynamic> get params => {
    'name': name,
    'value': value,
  };

  UpdateOption({
  required this.name,
  required this.value,
  });

  UpdateOption.fromJson(Map<String, dynamic> json) {
    name = tryConvertToTdObject(json['name']);
    value = tryConvertToTdObject(json['value']);
  }
}

@reflector
class UpdateStickerSet extends Update {
  @override
  String get tdType => 'updateStickerSet';

   late StickerSet stickerSet;

  @override
  Map<String, dynamic> get params => {
    'sticker_set': stickerSet,
  };

  UpdateStickerSet({
  required this.stickerSet,
  });

  UpdateStickerSet.fromJson(Map<String, dynamic> json) {
    stickerSet = tryConvertToTdObject(json['sticker_set']);
  }
}

@reflector
class UpdateInstalledStickerSets extends Update {
  @override
  String get tdType => 'updateInstalledStickerSets';

   late bool isMasks;
   late List<int> stickerSetIds;

  @override
  Map<String, dynamic> get params => {
    'is_masks': isMasks,
    'sticker_set_ids': stickerSetIds,
  };

  UpdateInstalledStickerSets({
  required this.isMasks,
  required this.stickerSetIds,
  });

  UpdateInstalledStickerSets.fromJson(Map<String, dynamic> json) {
    isMasks = tryConvertToTdObject(json['is_masks']);
    stickerSetIds = tryConvertToTdObject(json['sticker_set_ids']);
  }
}

@reflector
class UpdateTrendingStickerSets extends Update {
  @override
  String get tdType => 'updateTrendingStickerSets';

   late StickerSets stickerSets;

  @override
  Map<String, dynamic> get params => {
    'sticker_sets': stickerSets,
  };

  UpdateTrendingStickerSets({
  required this.stickerSets,
  });

  UpdateTrendingStickerSets.fromJson(Map<String, dynamic> json) {
    stickerSets = tryConvertToTdObject(json['sticker_sets']);
  }
}

@reflector
class UpdateRecentStickers extends Update {
  @override
  String get tdType => 'updateRecentStickers';

   late bool isAttached;
   late List<int> stickerIds;

  @override
  Map<String, dynamic> get params => {
    'is_attached': isAttached,
    'sticker_ids': stickerIds,
  };

  UpdateRecentStickers({
  required this.isAttached,
  required this.stickerIds,
  });

  UpdateRecentStickers.fromJson(Map<String, dynamic> json) {
    isAttached = tryConvertToTdObject(json['is_attached']);
    stickerIds = tryConvertToTdObject(json['sticker_ids']);
  }
}

@reflector
class UpdateFavoriteStickers extends Update {
  @override
  String get tdType => 'updateFavoriteStickers';

   late List<int> stickerIds;

  @override
  Map<String, dynamic> get params => {
    'sticker_ids': stickerIds,
  };

  UpdateFavoriteStickers({
  required this.stickerIds,
  });

  UpdateFavoriteStickers.fromJson(Map<String, dynamic> json) {
    stickerIds = tryConvertToTdObject(json['sticker_ids']);
  }
}

@reflector
class UpdateSavedAnimations extends Update {
  @override
  String get tdType => 'updateSavedAnimations';

   late List<int> animationIds;

  @override
  Map<String, dynamic> get params => {
    'animation_ids': animationIds,
  };

  UpdateSavedAnimations({
  required this.animationIds,
  });

  UpdateSavedAnimations.fromJson(Map<String, dynamic> json) {
    animationIds = tryConvertToTdObject(json['animation_ids']);
  }
}

@reflector
class UpdateSelectedBackground extends Update {
  @override
  String get tdType => 'updateSelectedBackground';

   late bool forDarkTheme;
   late Background background;

  @override
  Map<String, dynamic> get params => {
    'for_dark_theme': forDarkTheme,
    'background': background,
  };

  UpdateSelectedBackground({
  required this.forDarkTheme,
  required this.background,
  });

  UpdateSelectedBackground.fromJson(Map<String, dynamic> json) {
    forDarkTheme = tryConvertToTdObject(json['for_dark_theme']);
    background = tryConvertToTdObject(json['background']);
  }
}

@reflector
class UpdateChatThemes extends Update {
  @override
  String get tdType => 'updateChatThemes';

   late List<ChatTheme> chatThemes;

  @override
  Map<String, dynamic> get params => {
    'chat_themes': chatThemes,
  };

  UpdateChatThemes({
  required this.chatThemes,
  });

  UpdateChatThemes.fromJson(Map<String, dynamic> json) {
    chatThemes = tryConvertToTdObject(json['chat_themes']);
  }
}

@reflector
class UpdateLanguagePackStrings extends Update {
  @override
  String get tdType => 'updateLanguagePackStrings';

   late String localizationTarget;
   late String languagePackId;
   late List<LanguagePackString> strings;

  @override
  Map<String, dynamic> get params => {
    'localization_target': localizationTarget,
    'language_pack_id': languagePackId,
    'strings': strings,
  };

  UpdateLanguagePackStrings({
  required this.localizationTarget,
  required this.languagePackId,
  required this.strings,
  });

  UpdateLanguagePackStrings.fromJson(Map<String, dynamic> json) {
    localizationTarget = tryConvertToTdObject(json['localization_target']);
    languagePackId = tryConvertToTdObject(json['language_pack_id']);
    strings = tryConvertToTdObject(json['strings']);
  }
}

@reflector
class UpdateConnectionState extends Update {
  @override
  String get tdType => 'updateConnectionState';

   late ConnectionState state;

  @override
  Map<String, dynamic> get params => {
    'state': state,
  };

  UpdateConnectionState({
  required this.state,
  });

  UpdateConnectionState.fromJson(Map<String, dynamic> json) {
    state = tryConvertToTdObject(json['state']);
  }
}

@reflector
class UpdateTermsOfService extends Update {
  @override
  String get tdType => 'updateTermsOfService';

   late String termsOfServiceId;
   late TermsOfService termsOfService;

  @override
  Map<String, dynamic> get params => {
    'terms_of_service_id': termsOfServiceId,
    'terms_of_service': termsOfService,
  };

  UpdateTermsOfService({
  required this.termsOfServiceId,
  required this.termsOfService,
  });

  UpdateTermsOfService.fromJson(Map<String, dynamic> json) {
    termsOfServiceId = tryConvertToTdObject(json['terms_of_service_id']);
    termsOfService = tryConvertToTdObject(json['terms_of_service']);
  }
}

@reflector
class UpdateUsersNearby extends Update {
  @override
  String get tdType => 'updateUsersNearby';

   late List<ChatNearby> usersNearby;

  @override
  Map<String, dynamic> get params => {
    'users_nearby': usersNearby,
  };

  UpdateUsersNearby({
  required this.usersNearby,
  });

  UpdateUsersNearby.fromJson(Map<String, dynamic> json) {
    usersNearby = tryConvertToTdObject(json['users_nearby']);
  }
}

@reflector
class UpdateDiceEmojis extends Update {
  @override
  String get tdType => 'updateDiceEmojis';

   late List<String> emojis;

  @override
  Map<String, dynamic> get params => {
    'emojis': emojis,
  };

  UpdateDiceEmojis({
  required this.emojis,
  });

  UpdateDiceEmojis.fromJson(Map<String, dynamic> json) {
    emojis = tryConvertToTdObject(json['emojis']);
  }
}

@reflector
class UpdateAnimatedEmojiMessageClicked extends Update {
  @override
  String get tdType => 'updateAnimatedEmojiMessageClicked';

   late int chatId;
   late int messageId;
   late Sticker sticker;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'message_id': messageId,
    'sticker': sticker,
  };

  UpdateAnimatedEmojiMessageClicked({
  required this.chatId,
  required this.messageId,
  required this.sticker,
  });

  UpdateAnimatedEmojiMessageClicked.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    messageId = tryConvertToTdObject(json['message_id']);
    sticker = tryConvertToTdObject(json['sticker']);
  }
}

@reflector
class UpdateAnimationSearchParameters extends Update {
  @override
  String get tdType => 'updateAnimationSearchParameters';

   late String provider;
   late List<String> emojis;

  @override
  Map<String, dynamic> get params => {
    'provider': provider,
    'emojis': emojis,
  };

  UpdateAnimationSearchParameters({
  required this.provider,
  required this.emojis,
  });

  UpdateAnimationSearchParameters.fromJson(Map<String, dynamic> json) {
    provider = tryConvertToTdObject(json['provider']);
    emojis = tryConvertToTdObject(json['emojis']);
  }
}

@reflector
class UpdateSuggestedActions extends Update {
  @override
  String get tdType => 'updateSuggestedActions';

   late List<SuggestedAction> addedActions;
   late List<SuggestedAction> removedActions;

  @override
  Map<String, dynamic> get params => {
    'added_actions': addedActions,
    'removed_actions': removedActions,
  };

  UpdateSuggestedActions({
  required this.addedActions,
  required this.removedActions,
  });

  UpdateSuggestedActions.fromJson(Map<String, dynamic> json) {
    addedActions = tryConvertToTdObject(json['added_actions']);
    removedActions = tryConvertToTdObject(json['removed_actions']);
  }
}

@reflector
class UpdateNewInlineQuery extends Update {
  @override
  String get tdType => 'updateNewInlineQuery';

   late int id;
   late int senderUserId;
   late Location userLocation;
   late ChatType chatType;
   late String query;
   late String offset;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'sender_user_id': senderUserId,
    'user_location': userLocation,
    'chat_type': chatType,
    'query': query,
    'offset': offset,
  };

  UpdateNewInlineQuery({
  required this.id,
  required this.senderUserId,
  required this.userLocation,
  required this.chatType,
  required this.query,
  required this.offset,
  });

  UpdateNewInlineQuery.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    senderUserId = tryConvertToTdObject(json['sender_user_id']);
    userLocation = tryConvertToTdObject(json['user_location']);
    chatType = tryConvertToTdObject(json['chat_type']);
    query = tryConvertToTdObject(json['query']);
    offset = tryConvertToTdObject(json['offset']);
  }
}

@reflector
class UpdateNewChosenInlineResult extends Update {
  @override
  String get tdType => 'updateNewChosenInlineResult';

   late int senderUserId;
   late Location userLocation;
   late String query;
   late String resultId;
   late String inlineMessageId;

  @override
  Map<String, dynamic> get params => {
    'sender_user_id': senderUserId,
    'user_location': userLocation,
    'query': query,
    'result_id': resultId,
    'inline_message_id': inlineMessageId,
  };

  UpdateNewChosenInlineResult({
  required this.senderUserId,
  required this.userLocation,
  required this.query,
  required this.resultId,
  required this.inlineMessageId,
  });

  UpdateNewChosenInlineResult.fromJson(Map<String, dynamic> json) {
    senderUserId = tryConvertToTdObject(json['sender_user_id']);
    userLocation = tryConvertToTdObject(json['user_location']);
    query = tryConvertToTdObject(json['query']);
    resultId = tryConvertToTdObject(json['result_id']);
    inlineMessageId = tryConvertToTdObject(json['inline_message_id']);
  }
}

@reflector
class UpdateNewCallbackQuery extends Update {
  @override
  String get tdType => 'updateNewCallbackQuery';

   late int id;
   late int senderUserId;
   late int chatId;
   late int messageId;
   late int chatInstance;
   late CallbackQueryPayload payload;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'sender_user_id': senderUserId,
    'chat_id': chatId,
    'message_id': messageId,
    'chat_instance': chatInstance,
    'payload': payload,
  };

  UpdateNewCallbackQuery({
  required this.id,
  required this.senderUserId,
  required this.chatId,
  required this.messageId,
  required this.chatInstance,
  required this.payload,
  });

  UpdateNewCallbackQuery.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    senderUserId = tryConvertToTdObject(json['sender_user_id']);
    chatId = tryConvertToTdObject(json['chat_id']);
    messageId = tryConvertToTdObject(json['message_id']);
    chatInstance = tryConvertToTdObject(json['chat_instance']);
    payload = tryConvertToTdObject(json['payload']);
  }
}

@reflector
class UpdateNewInlineCallbackQuery extends Update {
  @override
  String get tdType => 'updateNewInlineCallbackQuery';

   late int id;
   late int senderUserId;
   late String inlineMessageId;
   late int chatInstance;
   late CallbackQueryPayload payload;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'sender_user_id': senderUserId,
    'inline_message_id': inlineMessageId,
    'chat_instance': chatInstance,
    'payload': payload,
  };

  UpdateNewInlineCallbackQuery({
  required this.id,
  required this.senderUserId,
  required this.inlineMessageId,
  required this.chatInstance,
  required this.payload,
  });

  UpdateNewInlineCallbackQuery.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    senderUserId = tryConvertToTdObject(json['sender_user_id']);
    inlineMessageId = tryConvertToTdObject(json['inline_message_id']);
    chatInstance = tryConvertToTdObject(json['chat_instance']);
    payload = tryConvertToTdObject(json['payload']);
  }
}

@reflector
class UpdateNewShippingQuery extends Update {
  @override
  String get tdType => 'updateNewShippingQuery';

   late int id;
   late int senderUserId;
   late String invoicePayload;
   late Address shippingAddress;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'sender_user_id': senderUserId,
    'invoice_payload': invoicePayload,
    'shipping_address': shippingAddress,
  };

  UpdateNewShippingQuery({
  required this.id,
  required this.senderUserId,
  required this.invoicePayload,
  required this.shippingAddress,
  });

  UpdateNewShippingQuery.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    senderUserId = tryConvertToTdObject(json['sender_user_id']);
    invoicePayload = tryConvertToTdObject(json['invoice_payload']);
    shippingAddress = tryConvertToTdObject(json['shipping_address']);
  }
}

@reflector
class UpdateNewPreCheckoutQuery extends Update {
  @override
  String get tdType => 'updateNewPreCheckoutQuery';

   late int id;
   late int senderUserId;
   late String currency;
   late int totalAmount;
   late String invoicePayload;
   late String shippingOptionId;
   late OrderInfo orderInfo;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'sender_user_id': senderUserId,
    'currency': currency,
    'total_amount': totalAmount,
    'invoice_payload': invoicePayload,
    'shipping_option_id': shippingOptionId,
    'order_info': orderInfo,
  };

  UpdateNewPreCheckoutQuery({
  required this.id,
  required this.senderUserId,
  required this.currency,
  required this.totalAmount,
  required this.invoicePayload,
  required this.shippingOptionId,
  required this.orderInfo,
  });

  UpdateNewPreCheckoutQuery.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    senderUserId = tryConvertToTdObject(json['sender_user_id']);
    currency = tryConvertToTdObject(json['currency']);
    totalAmount = tryConvertToTdObject(json['total_amount']);
    invoicePayload = tryConvertToTdObject(json['invoice_payload']);
    shippingOptionId = tryConvertToTdObject(json['shipping_option_id']);
    orderInfo = tryConvertToTdObject(json['order_info']);
  }
}

@reflector
class UpdateNewCustomEvent extends Update {
  @override
  String get tdType => 'updateNewCustomEvent';

   late String event;

  @override
  Map<String, dynamic> get params => {
    'event': event,
  };

  UpdateNewCustomEvent({
  required this.event,
  });

  UpdateNewCustomEvent.fromJson(Map<String, dynamic> json) {
    event = tryConvertToTdObject(json['event']);
  }
}

@reflector
class UpdateNewCustomQuery extends Update {
  @override
  String get tdType => 'updateNewCustomQuery';

   late int id;
   late String data;
   late int timeout;

  @override
  Map<String, dynamic> get params => {
    'id': id,
    'data': data,
    'timeout': timeout,
  };

  UpdateNewCustomQuery({
  required this.id,
  required this.data,
  required this.timeout,
  });

  UpdateNewCustomQuery.fromJson(Map<String, dynamic> json) {
    id = tryConvertToTdObject(json['id']);
    data = tryConvertToTdObject(json['data']);
    timeout = tryConvertToTdObject(json['timeout']);
  }
}

@reflector
class UpdatePoll extends Update {
  @override
  String get tdType => 'updatePoll';

   late Poll poll;

  @override
  Map<String, dynamic> get params => {
    'poll': poll,
  };

  UpdatePoll({
  required this.poll,
  });

  UpdatePoll.fromJson(Map<String, dynamic> json) {
    poll = tryConvertToTdObject(json['poll']);
  }
}

@reflector
class UpdatePollAnswer extends Update {
  @override
  String get tdType => 'updatePollAnswer';

   late int pollId;
   late int userId;
   late List<int> optionIds;

  @override
  Map<String, dynamic> get params => {
    'poll_id': pollId,
    'user_id': userId,
    'option_ids': optionIds,
  };

  UpdatePollAnswer({
  required this.pollId,
  required this.userId,
  required this.optionIds,
  });

  UpdatePollAnswer.fromJson(Map<String, dynamic> json) {
    pollId = tryConvertToTdObject(json['poll_id']);
    userId = tryConvertToTdObject(json['user_id']);
    optionIds = tryConvertToTdObject(json['option_ids']);
  }
}

@reflector
class UpdateChatMember extends Update {
  @override
  String get tdType => 'updateChatMember';

   late int chatId;
   late int actorUserId;
   late int date;
   late ChatInviteLink inviteLink;
   late ChatMember oldChatMember;
   late ChatMember newChatMember;

  @override
  Map<String, dynamic> get params => {
    'chat_id': chatId,
    'actor_user_id': actorUserId,
    'date': date,
    'invite_link': inviteLink,
    'old_chat_member': oldChatMember,
    'new_chat_member': newChatMember,
  };

  UpdateChatMember({
  required this.chatId,
  required this.actorUserId,
  required this.date,
  required this.inviteLink,
  required this.oldChatMember,
  required this.newChatMember,
  });

  UpdateChatMember.fromJson(Map<String, dynamic> json) {
    chatId = tryConvertToTdObject(json['chat_id']);
    actorUserId = tryConvertToTdObject(json['actor_user_id']);
    date = tryConvertToTdObject(json['date']);
    inviteLink = tryConvertToTdObject(json['invite_link']);
    oldChatMember = tryConvertToTdObject(json['old_chat_member']);
    newChatMember = tryConvertToTdObject(json['new_chat_member']);
  }
}

@reflector
class Updates extends TdObject {
  @override
  String get tdType => 'updates';

   late List<Update> updates;

  @override
  Map<String, dynamic> get params => {
    'updates': updates,
  };

  Updates({
  required this.updates,
  });

  Updates.fromJson(Map<String, dynamic> json) {
    updates = tryConvertToTdObject(json['updates']);
  }
}

abstract class LogStream extends TdObject {}

@reflector
class LogStreamDefault extends LogStream {
  @override
  String get tdType => 'logStreamDefault';

  @override
  Map<String, dynamic> get params => {};

  LogStreamDefault();

  LogStreamDefault.fromJson(Map<String, dynamic> json);
}

@reflector
class LogStreamFile extends LogStream {
  @override
  String get tdType => 'logStreamFile';

   late String path;
   late int maxFileSize;
   late bool redirectStderr;

  @override
  Map<String, dynamic> get params => {
    'path': path,
    'max_file_size': maxFileSize,
    'redirect_stderr': redirectStderr,
  };

  LogStreamFile({
  required this.path,
  required this.maxFileSize,
  required this.redirectStderr,
  });

  LogStreamFile.fromJson(Map<String, dynamic> json) {
    path = tryConvertToTdObject(json['path']);
    maxFileSize = tryConvertToTdObject(json['max_file_size']);
    redirectStderr = tryConvertToTdObject(json['redirect_stderr']);
  }
}

@reflector
class LogStreamEmpty extends LogStream {
  @override
  String get tdType => 'logStreamEmpty';

  @override
  Map<String, dynamic> get params => {};

  LogStreamEmpty();

  LogStreamEmpty.fromJson(Map<String, dynamic> json);
}

@reflector
class LogVerbosityLevel extends TdObject {
  @override
  String get tdType => 'logVerbosityLevel';

   late int verbosityLevel;

  @override
  Map<String, dynamic> get params => {
    'verbosity_level': verbosityLevel,
  };

  LogVerbosityLevel({
  required this.verbosityLevel,
  });

  LogVerbosityLevel.fromJson(Map<String, dynamic> json) {
    verbosityLevel = tryConvertToTdObject(json['verbosity_level']);
  }
}

@reflector
class LogTags extends TdObject {
  @override
  String get tdType => 'logTags';

   late List<String> tags;

  @override
  Map<String, dynamic> get params => {
    'tags': tags,
  };

  LogTags({
  required this.tags,
  });

  LogTags.fromJson(Map<String, dynamic> json) {
    tags = tryConvertToTdObject(json['tags']);
  }
}

@reflector
class TestInt extends TdObject {
  @override
  String get tdType => 'testInt';

   late int value;

  @override
  Map<String, dynamic> get params => {
    'value': value,
  };

  TestInt({
  required this.value,
  });

  TestInt.fromJson(Map<String, dynamic> json) {
    value = tryConvertToTdObject(json['value']);
  }
}

@reflector
class TestString extends TdObject {
  @override
  String get tdType => 'testString';

   late String value;

  @override
  Map<String, dynamic> get params => {
    'value': value,
  };

  TestString({
  required this.value,
  });

  TestString.fromJson(Map<String, dynamic> json) {
    value = tryConvertToTdObject(json['value']);
  }
}

@reflector
class TestBytes extends TdObject {
  @override
  String get tdType => 'testBytes';

   late String value;

  @override
  Map<String, dynamic> get params => {
    'value': value,
  };

  TestBytes({
  required this.value,
  });

  TestBytes.fromJson(Map<String, dynamic> json) {
    value = tryConvertToTdObject(json['value']);
  }
}

@reflector
class TestVectorInt extends TdObject {
  @override
  String get tdType => 'testVectorInt';

   late List<int> value;

  @override
  Map<String, dynamic> get params => {
    'value': value,
  };

  TestVectorInt({
  required this.value,
  });

  TestVectorInt.fromJson(Map<String, dynamic> json) {
    value = tryConvertToTdObject(json['value']);
  }
}

@reflector
class TestVectorIntObject extends TdObject {
  @override
  String get tdType => 'testVectorIntObject';

   late List<TestInt> value;

  @override
  Map<String, dynamic> get params => {
    'value': value,
  };

  TestVectorIntObject({
  required this.value,
  });

  TestVectorIntObject.fromJson(Map<String, dynamic> json) {
    value = tryConvertToTdObject(json['value']);
  }
}

@reflector
class TestVectorString extends TdObject {
  @override
  String get tdType => 'testVectorString';

   late List<String> value;

  @override
  Map<String, dynamic> get params => {
    'value': value,
  };

  TestVectorString({
  required this.value,
  });

  TestVectorString.fromJson(Map<String, dynamic> json) {
    value = tryConvertToTdObject(json['value']);
  }
}

@reflector
class TestVectorStringObject extends TdObject {
  @override
  String get tdType => 'testVectorStringObject';

   late List<TestString> value;

  @override
  Map<String, dynamic> get params => {
    'value': value,
  };

  TestVectorStringObject({
  required this.value,
  });

  TestVectorStringObject.fromJson(Map<String, dynamic> json) {
    value = tryConvertToTdObject(json['value']);
  }
}
