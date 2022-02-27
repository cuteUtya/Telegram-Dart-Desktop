import 'package:flutter/material.dart';

class SafeSpacer extends StatelessWidget {
  const SafeSpacer({
    Key? key,
    required this.flex,
  }) : super(key: key);

  final int flex;

  @override
  Widget build(BuildContext context) {
    return flex <= 0
        ? const SizedBox.shrink()
        : Spacer(
            flex: flex,
          );
  }
}
