import 'package:flutter/material.dart';

import '../../../watt.dart';

class UnknownErrorMessage extends StatelessWidget {
  const UnknownErrorMessage({
    Key? key,
    this.title,
    this.message,
    this.primary,
    this.onPrimary,
    this.onTryAgain,
  }) : super(key: key);

  final String? title;
  final String? message;
  final Color? primary;
  final Color? onPrimary;
  final void Function()? onTryAgain;

  @override
  Widget build(BuildContext context) {
    final wattTheme = WattTheme.of(context);
    return ErrorMessage(
      title: wattTheme.notificationMessageData.getUnknownErrorTitle(
        context,
        title,
      ),
      message: wattTheme.notificationMessageData.getUnknownErrorMessage(
        context,
        message,
      ),
      icon: const Icon(Icons.bug_report_outlined),
      primary: primary,
      onPrimary: onPrimary,
      onPressed: onTryAgain,
    );
  }
}
