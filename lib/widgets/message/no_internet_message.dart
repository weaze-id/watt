import 'package:flutter/material.dart';

import '../../constants/string_constants.dart';
import 'error_message.dart';

class NoInternetMessage extends StatelessWidget {
  const NoInternetMessage({
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
      title: StringConstants.noInternetTitle,
      message: StringConstants.noInternetMessage,
      icon: const Icon(Icons.wifi_off_outlined),
      primary: primary,
      onPrimary: onPrimary,
      onPressed: onTryAgain,
    );
  }
}
