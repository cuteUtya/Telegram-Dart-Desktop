import 'package:flutter/material.dart';
import 'package:myapp/Context%20menu/context_menu_region.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/Widgets/clickable_object.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/horizontal_separator_line.dart';
import 'package:myapp/scale_utils.dart';

class ContextMenuConfig extends StatefulWidget {
  const ContextMenuConfig({
    Key? key,
    required this.items,
    this.closeOnClick = true,
  }) : super(key: key);

  final List<ContextMenuItem> items;
  final bool closeOnClick;

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
              if (widget.closeOnClick) ContextMenuRegionState.close();
            },
            child: Container(
              width: width,
              padding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 3,
              ),
              child: item._build(
                TextDisplay.create(
                  size: font(15),
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
            width: width,
            color: lineColor,
          ),
        );
      }
    }

    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withAlpha(20),
              offset: const Offset(-2, 2),
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
          color: ClientTheme.currentTheme.getField(
            "ContextMenu.color",
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _items,
        ),
      ),
    );
  }
}

class ContextMenuItem {
  const ContextMenuItem({
    required this.icon,
    required this.text,
    this.destructiveAction = false,
    this.onClick,
  });

  final IconData icon;
  final String text;
  final bool destructiveAction;
  final VoidCallback? onClick;

  Widget _build(TextStyle? textStyle) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color: ClientTheme.currentTheme.getField(
              destructiveAction
                  ? "ContextMenu.icon.colorDestructive"
                  : "ContextMenu.icon.colorRegular",
            ),
          ),
          const SizedBox(width: 12),
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
