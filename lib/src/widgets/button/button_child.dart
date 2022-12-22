import 'package:flutter/material.dart';

import '../../theme/palette.dart';

class ButtonChild extends StatelessWidget {
  const ButtonChild({
    Key? key,
    this.label,
    this.onPrimary,
    this.icon,
    this.child,
  }) : super(key: key);

  final String? label;
  final Color? onPrimary;
  final Widget? icon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return child ??
        (icon != null
            ? _IconAndLabel(onPrimary: onPrimary, icon: icon!, label: label)
            : Text(label ?? ""));
  }
}

class _IconAndLabel extends StatelessWidget {
  const _IconAndLabel({
    Key? key,
    required this.onPrimary,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final Color? onPrimary;
  final Widget icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    return Row(children: [
      IconTheme(
        data: IconThemeData(color: onPrimary ?? palette.onPrimary),
        child: icon,
      ),
      if (label != null) ...[
        const SizedBox(width: 16),
        Text(label!),
      ]
    ]);
  }
}
