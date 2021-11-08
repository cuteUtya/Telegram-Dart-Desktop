import 'package:flutter/foundation.dart';
import 'package:myapp/Screens/introduction.dart';
import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/secrets.dart';
import 'package:myapp/tdlib/client.dart';

import 'package:myapp/tdlib/td_api.dart';
import 'package:myapp/utils.dart';

void main() async {
  var client = TelegramClient(getDatabaseDirectory());
  client.userLocale = getUserLocale();
  await client.init();
  await client.send(SetTdlibParameters(
      parameters: TdlibParameters(
          useTestDc: false,
          databaseDirectory: client.databaseDirectory,
          filesDirectory: getFilesDirectory(),
          applicationVersion: appVersion,
          useFileDatabase: true,
          useMessageDatabase: true,
          useChatInfoDatabase: true,
          useSecretChats: false,
          apiHash: appHash,
          apiId: appId,
          systemLanguageCode: client.userLocale,
          deviceModel: await getDeviceName(),
          systemVersion: await getSystemVersion())));
  await client.send(CheckDatabaseEncryptionKey(encryptionKey: ""));
  await client.send(SetOption(
      name: "localization_target",
      value: OptionValueString(value: "tdesktop")));
  await client.send(SetOption(
      name: "language_pack_database_path",
      value: OptionValueString(value: getLanguagePackDatabasePath())));
  if (await client.send(GetLanguagePackString(
      localizationTarget: TelegramClient.localizationTarget,
      languagePackDatabasePath: getLanguagePackDatabasePath(),
      languagePackId: client.userLangPackId,
      key: "lng_start_msgs")) is TdError) {
    await client.send(
        GetLanguagePackStrings(keys: [], languagePackId: client.userLocale));
  }
  await client.send(SetLogVerbosityLevel(newVerbosityLevel: 0));
  runApp(MaterialApp(home: App(client: client)));
}

class App extends StatelessWidget {
  const App({required this.client, Key? key}) : super(key: key);

  final TelegramClient client;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(child: Introduction(client: client));
  }
}
