import 'dart:io';

import 'package:flutter/cupertino.dart';

class UIManager {
  static void screenSizeChange(BuildContext context){
    var screenSize = MediaQuery.of(context).size;
    _useDesktopLayout = screenSize.height <= screenSize.width;
  }
  static bool get isMobile => Platform.isAndroid || Platform.isFuchsia || Platform.isIOS;
  static late bool  _useDesktopLayout;
  static bool get useDesktopLayout => _useDesktopLayout;
}