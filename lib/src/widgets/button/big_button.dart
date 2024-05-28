import 'package:flutter/material.dart';

import '../../../watt.dart';
import 'button_child.dart';

class BigButton extends StatelessWidget {
  const BigButton({
    Key? key,
    this.icon,
    this.child,
    this.label,
    required this.onPressed,
    this.primary,
    this.onPrimary,
  }) : super(key: key);

  final Widget? icon;
  final Widget? child;
  final String? label;
  final void Function()? onPressed;
  final Color? primary;
  final Color? onPrimary;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final wattTheme = WattTheme.of(context);

    return SizedBox(
      height: wattTheme.bigButtonHeight,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
        ),
        onPressed: onPressed,
        child: ButtonChild(
          label: label,
          iconColor: onPrimary ?? palette.onPrimary,
          icon: icon,
          child: child,
        ),
      ),
    );
  }
}
