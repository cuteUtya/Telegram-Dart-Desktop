import 'package:flutter/foundation.dart';
import 'package:myapp/Screens/autorization_router.dart';
import 'package:flutter/material.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'package:myapp/tdlib/td_api.dart';

void main() {
  var client = TelegramClient();
  client.init();
  client.send(SetLogVerbosityLevel(newVerbosityLevel: 3));

  runApp(MaterialApp(home: Material(child: App(client: client))));
}

class App extends StatelessWidget {
  const App({required this.client, Key? key}) : super(key: key);
  final TelegramClient client;
  @override
  Widget build(BuildContext context) {
    return Center(child: AutorizationRouter(client: client));
  }
}
