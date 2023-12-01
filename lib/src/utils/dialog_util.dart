import 'package:flutter/material.dart';

import '../constants/string_constants.dart';

class DialogUtil {
  static Future<void> showLoadingDialog(
    BuildContext context, {
    Color? primaryColor,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (contex) => PopScope(
        canPop: false,
        child: Center(child: CircularProgressIndicator(color: primaryColor)),
      ),
    );
  }

  static Future<void> showAlertDialog(
    BuildContext context, {
    required String title,
    required String message,
    String? confirmLabel,
    String? cancelLabel,
    void Function()? onConfirm,
    void Function()? onCancel,
  }) {
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

  static Future<void> showNoInternetDialog(
    BuildContext context, {
    String? confirmLabel,
    String? cancelLabel,
    void Function()? onConfirm,
    void Function()? onCancel,
  }) {
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
      Navigator.of(context).pop();
      onCancel?.call();
    }

    void onConfirmPressed() {
      Navigator.of(context).pop();
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
