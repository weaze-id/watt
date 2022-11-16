import 'package:flutter/material.dart';

import '../../constants/string_constants.dart';
import 'error_message.dart';

class UnknownErrorMessage extends StatelessWidget {
  const UnknownErrorMessage({
    Key? key,
    this.primary,
    this.onPrimary,
    this.onTryAgain,
  }) : super(key: key);

  final Color? primary;
  final Color? onPrimary;
  final void Function()? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return ErrorMessage(
      title: StringConstants.unknownErrorTitle,
      message: StringConstants.unknownErrorMessage,
      icon: const Icon(Icons.bug_report_outlined),
      primary: primary,
      onPrimary: onPrimary,
      onPressed: onTryAgain,
    );
  }
}
