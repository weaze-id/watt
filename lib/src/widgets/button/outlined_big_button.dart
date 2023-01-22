import 'package:flutter/material.dart';

import '../../../watt.dart';
import 'button_child.dart';

class OutlinedBigButton extends StatelessWidget {
  const OutlinedBigButton({
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
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: primary,
          side: primary != null ? BorderSide(color: primary!) : null,
        ),
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
