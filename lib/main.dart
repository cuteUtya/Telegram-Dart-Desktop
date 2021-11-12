import 'package:flutter/foundation.dart';
import 'package:myapp/Screens/introduction.dart';
import 'package:flutter/material.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';

import 'package:myapp/tdlib/td_api.dart';
import 'package:myapp/utils.dart';

void main() async {
  var client = TelegramClient();
  await client.init();
  await client.setTdlibParameters();
  client.userLocale = getUserLocale();
  var req = SetLogVerbosityLevel(newVerbosityLevel: 3);
  await client.send(req);
  if ((await client.getLanguagePackString("lng_start_msgs",
      throwExcepetions: true)) is TdError) {
    await client.setTdlibParameters();
    await client.send(
        GetLanguagePackStrings(keys: [], languagePackId: client.userLocale));
    await client.getLanguagePackString("lng_start_msgs",
        throwExcepetions: true);
  }
  runApp(MaterialApp(home: App(client: client)));
}

class App extends StatelessWidget {
  const App({required this.client, Key? key}) : super(key: key);
  final TelegramClient client;
  @override
  Widget build(BuildContext context) {
    return Center(child: IntroductionScreen(client: client));
  }
}
