import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

import '../constants/string_constants.dart';

class DialogUtil {
  static Future<void> showLoadingDialog({Color? primaryColor}) {
    final context = WRouter.navigatorKey.currentContext!;
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (contex) => WillPopScope(
        onWillPop: () async => false,
        child: Center(child: CircularProgressIndicator(color: primaryColor)),
      ),
    );
  }

  static Future<void> showAlertDialog({
    required String title,
    required String message,
    String? confirmLabel,
    String? cancelLabel,
    void Function()? onConfirm,
    void Function()? onCancel,
  }) {
    final context = WRouter.navigatorKey.currentContext!;

    return showDialog(
      context: context,
      builder: (contex) => _AlertDialog(
        title: title,
        message: message,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
    );
  }

  static Future<void> showNoInternetDialog({
    String? confirmLabel,
    String? cancelLabel,
    void Function()? onConfirm,
    void Function()? onCancel,
  }) {
    final context = WRouter.navigatorKey.currentContext!;

    return showDialog(
      context: context,
      builder: (contex) => _AlertDialog(
        title: StringConstants.noInternetTitle,
        message: StringConstants.noInternetMessage,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
    );
  }
}

class _AlertDialog extends StatelessWidget {
  const _AlertDialog({
    Key? key,
    required this.title,
    required this.message,
    this.confirmLabel,
    this.cancelLabel,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  final String title;
  final String message;
  final String? confirmLabel;
  final String? cancelLabel;
  final void Function()? onConfirm;
  final void Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    void onCancelPressed() {
      WRouter.pop();
      onCancel?.call();
    }

    void onConfirmPressed() {
      WRouter.pop();
      onConfirm?.call();
    }

    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        if (cancelLabel != null)
          TextButton(
            onPressed: onCancelPressed,
            child: Text(cancelLabel!),
          ),
        TextButton(
          onPressed: onConfirmPressed,
          child: Text(confirmLabel ?? StringConstants.confirmLabel),
        ),
      ],
    );
  }
}
