import 'package:flutter/cupertino.dart';
import 'package:myapp/Widgets/Context%20menus/context_menu_overlay.dart';

///Widget that detect clicks on [child] and open [contextMenu] on click
/// * [child] object click on what will be trigger [contextMenu] open
/// * [contextMenu] menu that will be opened on click
/// * [workOnMainTap] if true, clicks using left mouse button will be trigger [contextMenu] open
/// * [workOnSecondaryTap] if true, clicks using right mouse button will be trigger [contextMenu] open
/// * [placeHolderKey] if not null position of [contextMenu] will be calculated from [placeHolderKey] owner
class ContextMenuRegion extends StatelessWidget {
  const ContextMenuRegion({
    Key? key,
    required this.child,
    required this.contextMenu,
    this.workOnMainTap = false,
    this.workOnSecondaryTap = true,
    this.placeHolderKey,
  }) : super(key: key);

  final Widget child;
  final Widget contextMenu;
  final bool workOnSecondaryTap;
  final bool workOnMainTap;
  final GlobalKey? placeHolderKey;

  @override
  Widget build(BuildContext context) {
    void open() {
      ContextMenuOverlayState.openMenu(contextMenu, placeHolderKey);
    }

    return GestureDetector(
      child: child,
      onSecondaryTap: workOnSecondaryTap ? () => open() : null,
      onTap: workOnMainTap ? () => open() : null,
    );
  }
}
