import 'package:flutter/material.dart';
import 'package:myapp/Widgets/clickable_object.dart';

class ButtonIcon extends StatelessWidget {
  const ButtonIcon(
    this.icon, {
    Key? key,
    this.color,
    this.size,
    this.onClick,
  }) : super(key: key);

  final IconData icon;
  final double? size;
  final Color? color;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) => InkWell(
        child: Icon(
          icon,
          size: size,
          color: color,
        ),
        onTap: () => onClick?.call(),
      );
}
