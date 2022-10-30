import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:witt/witt.dart';

import '../constants/string_constants.dart';
import '../utils/dialog_util.dart';
import 'http_client.dart';

class HttpTransaction {
  final bool handleUnauthorized;
  final String authenticationPath;

  HttpTransaction({
    required this.handleUnauthorized,
    required this.authenticationPath,
  });

  bool isUnauthorized = false;
  String? errorMessage;

  void handleError() {
    if (isUnauthorized && handleUnauthorized) {
      WRouter.pushNamedAndRemoveAll(authenticationPath);
      return;
    }

    if (errorMessage != null) {
      _showHttpError();
      return;
    }
  }

  void updateStatus(http.Response response) {
    final statusCode = response.statusCode;
    if (statusCode == 401) {
      isUnauthorized = true;
    }

    if (!HttpClient.isSuccess(response)) {
      errorMessage = response.body;
    }
  }

  void _showHttpError() {
    final dataMap = json.decode(errorMessage!);

    final errors = dataMap["errors"];
    if (errors != null) {
      if (errors is Map<String, List<String>>) {
        final errorKeys = errors.keys.toList();
        if (errorKeys.isNotEmpty) {
          final firstError = errors[errorKeys[0]]![0];
          if (firstError.isNotEmpty) {
            DialogUtil.showAlertDialog(title: "Error", message: firstError);
            return;
          }
        }
      }

      if (errors is String) {
        DialogUtil.showAlertDialog(title: "Error", message: errors);
        return;
      }
    }

    final message = dataMap["message"];
    if (message != null && message is String) {
      DialogUtil.showAlertDialog(title: "Error", message: message);
      return;
    }

    final error = dataMap["error"];
    if (error != null && error is String) {
      DialogUtil.showAlertDialog(title: "Error", message: error);
      return;
    }

    final data = dataMap["data"];
    if (data != null && data is String) {
      DialogUtil.showAlertDialog(title: "Error", message: data);
      return;
    }

    DialogUtil.showAlertDialog(
      title: "Error",
      message: StringConstants.unknownError,
    );
  }
}
