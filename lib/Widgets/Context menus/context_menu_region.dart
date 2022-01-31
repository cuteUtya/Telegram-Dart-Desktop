import 'package:flutter/cupertino.dart';
import 'package:myapp/Widgets/Context%20menus/context_menu_overlay.dart';

class ContextMenuRegion extends StatelessWidget {
  const ContextMenuRegion({
    Key? key,
    required this.child,
    required this.contextMenu,
    this.workOnMainTap = false,
    this.workOnSecondaryTap = true,
  }) : super(key: key);

  final Widget child;
  final Widget contextMenu;
  final bool workOnSecondaryTap;
  final bool workOnMainTap;

  @override
  Widget build(BuildContext context) {
    void open() {
      ContextMenuOverlayState.openMenu(contextMenu);
      print("open context menu");
    }

    return GestureDetector(
      child: child,
      onSecondaryTap: workOnSecondaryTap ? () => open() : null,
      onTap: workOnMainTap ? () => open() : null,
    );
  }
}
