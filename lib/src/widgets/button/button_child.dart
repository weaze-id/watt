import 'package:flutter/material.dart';

class ButtonChild extends StatelessWidget {
  const ButtonChild({
    Key? key,
    this.label,
    required this.iconColor,
    this.icon,
    this.child,
  }) : super(key: key);

  final String? label;
  final Widget? icon;
  final Color iconColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return child ??
        (icon != null
            ? _IconAndLabel(
                label: label,
                icon: icon!,
                iconColor: iconColor,
              )
            : Text(label ?? ""));
  }
}

class _IconAndLabel extends StatelessWidget {
  const _IconAndLabel({
    Key? key,
    required this.label,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  final String? label;
  final Widget icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconTheme(
          data: IconThemeData(color: iconColor),
          child: icon,
        ),
        if (label != null) ...[
          const SizedBox(width: 16),
          Text(label!),
        ]
      ],
    );
  }
}
