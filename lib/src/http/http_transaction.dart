import 'dart:async';

import 'package:http/http.dart' as http;

import 'http_client.dart';

class HttpTransaction {
  final bool handleUnauthenticated;
  final FutureOr<void> Function(
    bool handleUnauthenticated,
    http.Response response,
  ) httpErrorHandler;

  HttpTransaction({
    required this.handleUnauthenticated,
    required this.httpErrorHandler,
  });

  bool isFailure = false;
  http.Response? response;

  Future<void> handleError() async {
    if (response == null) {
      return;
    }

    return httpErrorHandler.call(handleUnauthenticated, response!);
  }

  void updateStatus(
    http.Response response, {
    required bool ignoreNotFound,
    required bool stopOnFailure,
  }) {
    if (HttpClient.isSuccess(response)) {
      return;
    }

    if (ignoreNotFound && response.statusCode == 404) {
      return;
    }

    if (stopOnFailure) {
      isFailure = true;
    }

    response = response;
  }
}
