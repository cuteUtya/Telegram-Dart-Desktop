import 'dart:io';

class UIManager {
  static bool get isMobile => Platform.isAndroid || Platform.isFuchsia || Platform.isIOS;
}