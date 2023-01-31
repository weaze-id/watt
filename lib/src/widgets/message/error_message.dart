import 'package:flutter/material.dart';

import '../../constants/string_constants.dart';
import '../../theme/palette.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    Key? key,
    required this.title,
    required this.message,
    required this.icon,
    this.primary,
    this.onPrimary,
    this.buttonLabel,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final String message;
  final Widget icon;
  final Color? primary;
  final Color? onPrimary;
  final String? buttonLabel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ErrorIcon(icon: icon, primary: primary),
            const SizedBox(height: 16),
            Text(title, style: textTheme.bodyLarge),
            const SizedBox(height: 16),
            Text(
              message,
              style: TextStyle(color: palette.gray),
              textAlign: TextAlign.center,
            ),
            if (onPressed != null) ...[
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  foregroundColor: primary,
                  backgroundColor: onPrimary,
                ),
                child: Text(buttonLabel ?? StringConstants.tryAgainLabel),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class _ErrorIcon extends StatelessWidget {
  const _ErrorIcon({
    Key? key,
    required this.icon,
    this.primary,
  }) : super(key: key);

  final Widget icon;
  final Color? primary;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: palette.primary.withOpacity(.1),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(size: 40, color: primary ?? palette.primary),
        ),
        child: icon,
      ),
    );
  }
}
