import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:witt/witt.dart';

import 'http_client.dart';

class HttpTransaction {
  final bool handleUnauthorized;
  final String authenticationPath;
  final FutureOr<void> Function(String errorResponse)? httpErrorHandler;

  HttpTransaction({
    required this.handleUnauthorized,
    required this.authenticationPath,
    this.httpErrorHandler,
  });

  bool isUnauthorized = false;
  String? errorResponse;

  Future<void> handleError() async {
    if (isUnauthorized && handleUnauthorized) {
      WRouter.pushNamedAndRemoveAll(authenticationPath);
      return;
    }

    if (errorResponse != null) {
      return httpErrorHandler?.call(errorResponse!);
    }

    return;
  }

  void updateStatus(http.Response response, {bool ignoreNotFound = false}) {
    final statusCode = response.statusCode;
    if (statusCode == 401) {
      isUnauthorized = true;
      return;
    }

    if (ignoreNotFound && statusCode == 404) {
      return;
    }

    if (!HttpClient.isSuccess(response)) {
      errorResponse = response.body;
    }
  }
}
