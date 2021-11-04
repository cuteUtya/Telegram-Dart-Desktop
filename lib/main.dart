import 'package:flutter/foundation.dart';
import 'package:myapp/Screens/introduction.dart';
import 'package:flutter/material.dart';
import 'package:myapp/tdlib/client.dart';

import 'package:myapp/tdlib/td_api.dart';

void main() async {
  runApp(const MaterialApp(home: App()));
  var client = TelegramClient();
  await client.init();
  client.updates.listen((event) {
    print(event.runtimeType);
  });

  client.send(SetLogVerbosityLevel(newVerbosityLevel: 0));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Center(child: Introduction());
  }
}
