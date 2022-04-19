import 'package:flutter/material.dart';
import 'package:myapp/Context%20menu/context_menu_region.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/scale_utils.dart';

class ContextMenuConfig extends StatefulWidget {
  const ContextMenuConfig({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<ContextMenuItem> items;

  @override
  State<ContextMenuConfig> createState() => _ContextMenuConfigState();
}

class _ContextMenuConfigState extends State<ContextMenuConfig> {
  double opacity = 0;

  @override
  void initState() {
    Future.delayed(Duration.zero, () => setState(() => opacity = 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _items = [];
    var lineColor = ClientTheme.currentTheme.getField(
      "ContextMenu.line.color",
    );

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
      if (i != (widget.items.length - 1)) {
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

    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      child: DecoratedBox(
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
              children: _items,
            ),
          ),
        ),
      ),
    );
  }
}

abstract class ContextMenuItem {
  ContextMenuItem({
    VoidCallback? clickEvent,
    this.closeOnClick = true,
  }) {
    onClick = () {
      if (closeOnClick) ContextMenuRegionState.close();
      clickEvent?.call();
    };
  }

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
          clickEvent: onClick,
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
