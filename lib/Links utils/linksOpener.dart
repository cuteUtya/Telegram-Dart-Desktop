import 'package:myapp/State%20managment/ui_events.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlsUtils {
  static void init(TelegramClient client) {
    _client = client;
  }

  static TelegramClient? _client;

  static void openLink(String link) {
    if (!link.substring(0, 5).contains("tg://")) {
      launch(link);
    } else {
      var methodName = link.substring(5, link.length).split('?')[0];
      Map<String, String> args = {};
      RegExp(r"\?([a-zA-Z]{1,})=([a-zA-Z1-9_]{1,})").allMatches(link).forEach((element) {
        var s = link.substring(element.start + 1, element.end).split("=");
        args[s[0]] = s[1];
      });

      switch (methodName) {
        case "open":
          if (args["username"] != null) {
            _client?.send(SearchPublicChat(username: args["username"])).then((value) {
              if (value is Chat) {
                UIEvents.pushChat(value.id!, _client!);
              }
            });
          } else if (args["id"] != null) {
            UIEvents.pushChat(int.parse(args["id"]!), _client!);
          }
          break;
      }
    }
  }
}
