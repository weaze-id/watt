import 'package:flutter/material.dart';

import '../../../watt.dart';
import 'button_child.dart';

class TextBigButton extends StatelessWidget {
  const TextBigButton({
    Key? key,
    this.icon,
    this.child,
    this.label,
    required this.onPressed,
    this.primary,
  }) : super(key: key);

  final Widget? icon;
  final Widget? child;
  final String? label;
  final void Function()? onPressed;
  final Color? primary;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final wattTheme = WattTheme.of(context);

    return SizedBox(
      height: wattTheme.bigButtonHeight,
      width: double.infinity,
      child: TextButton(
        style: OutlinedButton.styleFrom(foregroundColor: primary),
        onPressed: onPressed,
        child: ButtonChild(
          label: label,
          iconColor: primary ?? palette.primary,
          icon: icon,
          child: child,
        ),
      ),
    );
  }
}
