import 'package:dart_vlc/dart_vlc.dart';
import 'package:myapp/Links%20utils/linksOpener.dart';
import 'package:myapp/Screens/autorization_router.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/Context%20menus/context_menu_overlay.dart';
import 'package:myapp/Widgets/big_stickers_overlay.dart';
import 'package:myapp/Widgets/transcluent_gestures_stack.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:libwinmedia/libwinmedia.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartVLC.initialize();
  await ClientTheme.init();
  var client = TelegramClient();
  await client.init();
  await client.send(SetLogVerbosityLevel(newVerbosityLevel: 0));
  UrlsUtils.init(client);
  runApp(
    MaterialApp(
      color: ClientTheme.currentTheme.getField("BaseColor"),
      home: App(
        client: client,
      ),
    ),
  );
}

class App extends StatelessWidget {
  const App({required this.client, Key? key}) : super(key: key);
  final TelegramClient client;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: TranscluentGesturesStack(
          children: [
            //  Expanded(child: Container(color: Colors.white)),
            AutorizationRouter(client: client),
            BigStickerOverlay(client: client),
            const ContextMenuOverlay(),
          ],
        ),
      ),
    );
  }
}
