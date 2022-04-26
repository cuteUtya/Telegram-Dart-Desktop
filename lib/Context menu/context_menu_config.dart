import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/scale_utils.dart';

class ContextMenu extends StatefulWidget {
  const ContextMenu({
    Key? key,
    required this.items,
    this.previewBuilder,
    required this.child,
    this.viewType = ContextMenuView.desktopView,
  }) : super(key: key);

  final List<ContextMenuItem> items;
  final ContextMenuView viewType;
  final Widget Function(BuildContext, Animation<double>, Widget)?
      previewBuilder;
  final Widget child;

  @override
  State<ContextMenu> createState() => _ContextMenuState();
}

class _ContextMenuState extends State<ContextMenu> {
  double opacity = 0;
  Offset _mousePosition = Offset.zero;
  late GlobalKey _childKey;
  static final List<OverlayEntry> _entryes = [];

  @override
  void initState() {
    super.initState();
  }

  static void close() {
    for (int i = 0; i < _entryes.length; i++) {
      _entryes[i].remove();
    }
    _entryes.clear();
  }

  void _spawnWindow(bool substractChildPosition) {
    Offset position;
    if (substractChildPosition) {
      var box = _childKey.currentContext?.findRenderObject() as RenderBox;
      position = box.globalToLocal(Offset.zero);
      position -= _mousePosition;
    } else {
      position = _mousePosition;
    }

    OverlayEntry entry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: () => close(),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Positioned(
            left: position.dx,
            top: position.dy,
            child: _buildWindow(),
          ),
        ],
      ),
    );
    _entryes.add(entry);
    Overlay.of(context)!.insert(entry);
  }

  List<Widget> buildItems(bool addSeparator) {
    var lineColor = ClientTheme.currentTheme.getField(
      "ContextMenu.line.color",
    );
    List<Widget> _items = [];
    for (int i = 0; i < widget.items.length; i++) {
      var item = widget.items[i];
      var width = p(200.0);
      _items.add(
        Material(
          child: InkWell(
            overlayColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.hovered)
                  ? Colors.black12.withOpacity(0.1)
                  : null,
            ),
            onTap: () {
              item.onClick?.call();
              if (item.closeOnClick) {
                switch (widget.viewType) {
                  case ContextMenuView.desktopView:
                    _ContextMenuState.close();
                    break;
                  case ContextMenuView.iosView:
                    Navigator.pop(context);
                    break;
                }
              }
            },
            child: Container(
              width: width,
              padding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 3,
              ),
              child: item.build(
                TextDisplay.create(
                  size: font(14),
                ),
              ),
            ),
          ),
        ),
      );
      if (i != (widget.items.length - 1) && addSeparator) {
        _items.add(
          Container(
            height: 0.5,
            width: 150,
            margin: const EdgeInsets.only(left: 40),
            color: lineColor,
          ),
        );
      }
    }
    return _items;
  }

  Widget _buildWindow() {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withAlpha(20),
            offset: const Offset(-2, 2),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: ColoredBox(
            color: ClientTheme.currentTheme.getField(
              "ContextMenu.color",
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: buildItems(true),
            )),
      ),
    );
  }

  void handleTap(TapUpDetails details) {
    _mousePosition = details.globalPosition;
    _spawnWindow(false);
  }

  @override
  Widget build(BuildContext context) {
    _childKey = GlobalKey();
    var _child = Container(
      key: _childKey,
      child: widget.child,
    );
    return widget.viewType == ContextMenuView.desktopView
        ? Stack(
            children: [
              _child,
              Positioned.fill(
                child: GestureDetector(
                  onSecondaryTapUp: handleTap,
                  onTapUp: UIManager.isMobile ? handleTap : null,
                ),
              ),
            ],
          )
        : CupertinoContextMenu(
            actions: buildItems(false),
            child: widget.child,
            previewBuilder: widget.previewBuilder,
          );
  }
}

abstract class ContextMenuItem {
  ContextMenuItem({
    this.onClick,
    this.closeOnClick = true,
  });

  VoidCallback? onClick;
  final bool closeOnClick;

  static const double iconSize = 24;
  static const double baseIconMargin = 12;

  Widget build(TextStyle? textStyle) => throw Exception();
}

class ContextMenuItemIconButton extends ContextMenuItem {
  ContextMenuItemIconButton({
    required this.icon,
    required this.text,
    VoidCallback? onClick,
    closeOnClick = true,
    this.destructiveAction = false,
  }) : super(
          onClick: onClick,
          closeOnClick: closeOnClick,
        );

  final IconData icon;
  final String text;
  final bool destructiveAction;

  @override
  Widget build(TextStyle? textStyle) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: ContextMenuItem.iconSize,
            color: ClientTheme.currentTheme.getField(
              destructiveAction
                  ? "ContextMenu.icon.colorDestructive"
                  : "ContextMenu.icon.colorRegular",
            ),
          ),
          const SizedBox(width: ContextMenuItem.baseIconMargin),
          Text(
            text,
            style: textStyle?.copyWith(
              color: ClientTheme.currentTheme.getField(destructiveAction
                  ? "ContextMenu.text.colorDestructive"
                  : "ContextMenu.text.colorRegular"),
            ),
          )
        ],
      );
}

class ContextMenuItemText extends ContextMenuItem {
  ContextMenuItemText({
    required this.text,
    this.icon,
    this.colorIcon,
  }) : super();

  final String text;
  final IconData? icon;
  final Color? colorIcon;

  @override
  Widget build(TextStyle? textStyle) => Row(
        children: [
          if (icon != null)
            Icon(
              icon,
              size: ContextMenuItem.iconSize,
              color: colorIcon,
            ),
          if (icon != null)
            const SizedBox(
              width: ContextMenuItem.baseIconMargin,
            ),
          Text(
            text,
            style: textStyle,
          ),
        ],
      );
}

enum ContextMenuView {
  desktopView,
  iosView,
}
