import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../watt.dart';

class SnackbarUtil {
  static void showSnackbar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(content)),
    );
  }

  static void showErrorSnackbar(BuildContext context, String content) {
    final palette = Palette.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: palette.error,
        content: Text(content, style: TextStyle(color: palette.onError)),
      ),
    );
  }

  static void showNoInternetSnackbar(BuildContext context, {String? content}) {
    final wattTheme = WattTheme.of(context)!;
    showErrorSnackbar(
      context,
      wattTheme.notificationMessageData.getNoInternetMessage(context, content),
    );
  }

  static void showUnknownErrorSnackbar(
    BuildContext context, {
    String? content,
    Object? e,
    StackTrace? stackTrace,
  }) {
    if (e != null && !kReleaseMode) {
      log(e.toString(), stackTrace: stackTrace, level: 4);
    }

    final wattTheme = WattTheme.of(context)!;
    showErrorSnackbar(
      context,
      wattTheme.notificationMessageData.getUnknownErrorMessage(
        context,
        content,
      ),
    );
  }
}
