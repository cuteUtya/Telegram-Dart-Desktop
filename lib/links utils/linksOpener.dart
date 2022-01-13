import 'package:url_launcher/url_launcher.dart';

class HttpUrlsUtils {
  static void openLink(String link) {
    if (!link.substring(0, 5).contains("tg://")) {
      launch(link);
    } else {
      print("deeplinks don't supported yet");
    }
  }
}
