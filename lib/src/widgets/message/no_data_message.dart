import 'package:flutter/material.dart';

import '../../constants/string_constants.dart';
import 'error_message.dart';

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
    return ErrorMessage(
      title: title ?? StringConstants.noDataTitle,
      message: message ?? StringConstants.noDataMessage,
      icon: const Icon(Icons.subtitles_off_outlined),
      primary: primary,
      onPrimary: onPrimary,
      onPressed: onTryAgain,
    );
  }
}
