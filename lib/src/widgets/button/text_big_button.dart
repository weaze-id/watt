import 'package:flutter/material.dart';

import 'button_child.dart';

class TextBigButton extends StatelessWidget {
  const TextBigButton({
    Key? key,
    this.icon,
    this.child,
    required this.label,
    required this.onPressed,
    this.primary,
  }) : super(key: key);

  final Widget? icon;
  final Widget? child;
  final String label;
  final void Function()? onPressed;
  final Color? primary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: TextButton(
        style: OutlinedButton.styleFrom(foregroundColor: primary),
        onPressed: onPressed,
        child: ButtonChild(
          label: label,
          onPrimary: primary,
          icon: icon,
          child: child,
        ),
      ),
    );
  }
}
