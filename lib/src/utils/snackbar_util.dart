import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/string_constants.dart';
import '../theme/palette.dart';

class SnackbarUtil {
  static void showSnackbar(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
  }

  static void showErrorSnackbar(BuildContext context, String title) {
    final palette = Palette.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: palette.error,
        content: Text(title, style: TextStyle(color: palette.onError)),
      ),
    );
  }

  static void showNoInternetSnackbar(BuildContext context) {
    showErrorSnackbar(context, StringConstants.noInternetMessage);
  }

  static void showUnknownErrorSnackbar(
    BuildContext context, {
    Object? e,
    StackTrace? stackTrace,
  }) {
    if (e != null && !kReleaseMode) {
      log(e.toString(), stackTrace: stackTrace, level: 4);
    }

    showErrorSnackbar(context, StringConstants.unknownError);
  }
}
