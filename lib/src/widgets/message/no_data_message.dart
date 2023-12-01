import 'package:flutter/material.dart';

import '../../../watt.dart';

class NoDataMessage extends StatelessWidget {
  const NoDataMessage({
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
    final wattTheme = WattTheme.of(context)!;
    return ErrorMessage(
      title: wattTheme.notificationMessageData.getNoDataTitle(
        context,
        title,
      ),
      message: wattTheme.notificationMessageData.getNoDataMessage(
        context,
        message,
      ),
      icon: const Icon(Icons.subtitles_off_outlined),
      primary: primary,
      onPrimary: onPrimary,
      onPressed: onTryAgain,
    );
  }
}
