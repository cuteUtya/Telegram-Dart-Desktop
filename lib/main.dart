import 'package:myapp/Screens/autorization_router.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/big_stickers_overlay.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:libwinmedia/libwinmedia.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LWM.initialize();

  await ClientTheme.init();
  var client = TelegramClient();
  await client.init();
  /* await client.send(SetLogStream(
      logStream: LogStreamFile(
          maxFileSize: 100000000, path: "/home/timur/tdlib_logs.txt")));*/
  await client.send(SetLogVerbosityLevel(newVerbosityLevel: 2));

  runApp(MaterialApp(home: Material(child: App(client: client))));
}

class App extends StatelessWidget {
  const App({required this.client, Key? key}) : super(key: key);
  final TelegramClient client;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: [
        AutorizationRouter(client: client),
        BigStickerOverlay(client: client),
      ],
    ));
  }
}
