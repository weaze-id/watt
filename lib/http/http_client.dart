import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:witt/witt.dart';

import '../utils/dialog_util.dart';
import '../utils/snackbar_util.dart';
import '../widgets/loader/loader_state.dart';
import 'http_transaction.dart';

class HttpClient {
  final String authenticationPath;
  final String userAgent;

  HttpClient({
    required this.authenticationPath,
    required this.userAgent,
  });

  String? bearerToken;

  Future<http.Response> get(String url, {HttpTransaction? transaction}) async {
    final response = await http.get(Uri.parse(url), headers: _createHeaders());
    transaction?.updateStatus(response);
    return response;
  }

  Future<http.Response> post(
    String url,
    String? data, {
    HttpTransaction? transaction,
  }) async {
    final response = await http.post(
      Uri.parse(url),
      body: data,
      headers: _createHeaders(),
    );

    transaction?.updateStatus(response);
    return response;
  }

  Future<http.Response> put(
    String url,
    String? data, {
    HttpTransaction? transaction,
  }) async {
    final response = await http.put(
      Uri.parse(url),
      body: data,
      headers: _createHeaders(),
    );

    transaction?.updateStatus(response);
    return response;
  }

  Future<http.Response> delete(
    String url, {
    HttpTransaction? transaction,
  }) async {
    final response =
        await http.delete(Uri.parse(url), headers: _createHeaders());
    transaction?.updateStatus(response);
    return response;
  }

  Future<http.Response> multiPartPost(
    String url, {
    Map<String, String>? fields,
    List<String>? filePaths,
    String fileFieldName = "file",
    HttpTransaction? transaction,
  }) async {
    final request = http.MultipartRequest("POST", Uri.parse(url));
    request.headers.addAll(_createHeaders());

    if (filePaths != null) {
      for (final path in filePaths) {
        final file = await http.MultipartFile.fromPath(fileFieldName, path);
        request.files.add(file);
      }
    }

    if (fields != null) {
      request.fields.addAll(fields);
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    transaction?.updateStatus(response);
    return response;
  }

  Future<void> httpTransactionLoaderState({
    required ValueNotifier<LoaderState> loaderState,
    FutureOr<void> Function()? onTransactionStart,
    FutureOr<void> Function()? onTransactionEnd,
    FutureOr<void> Function()? onNetworkError,
    FutureOr<void> Function(Object, StackTrace)? onTransactionFailed,
    required FutureOr<void> Function(HttpTransaction transaction) transaction,
  }) async {
    return httpTransaction(
      showLoadingDialog: false,
      onTransactionStart: () {
        loaderState.value = LoaderState.loading;
        onTransactionStart?.call();
      },
      onTransactionEnd: () {
        loaderState.value = LoaderState.none;
        onTransactionEnd?.call();
      },
      onNetworkError: () {
        loaderState.value = LoaderState.noInternet;
        onNetworkError?.call();
      },
      onTransactionFailed: (e, stackTrace) {
        loaderState.value = LoaderState.unknownError;
        onTransactionFailed?.call(e, stackTrace);
      },
      transaction: transaction,
    );
  }

  Future<void> httpTransaction({
    bool handleUnauthorized = true,
    bool showLoadingDialog = true,
    FutureOr<void> Function()? onTransactionStart,
    FutureOr<void> Function()? onTransactionEnd,
    FutureOr<void> Function()? onNetworkError,
    FutureOr<void> Function(Object, StackTrace)? onTransactionFailed,
    required FutureOr<void> Function(HttpTransaction transaction) transaction,
  }) async {
    try {
      if (showLoadingDialog) {
        DialogUtil.showLoadingDialog();
      }

      final httpTransaction = HttpTransaction(
        authenticationPath: authenticationPath,
        handleUnauthorized: handleUnauthorized,
      );

      await onTransactionStart?.call();
      await transaction(httpTransaction);

      if (showLoadingDialog) {
        WRouter.pop();
      }

      httpTransaction.handleError();
    } on SocketException {
      if (showLoadingDialog) {
        WRouter.pop();
      }

      DialogUtil.showNoInternetDialog();
      await onNetworkError?.call();
      return;
    } catch (e, stackTrace) {
      if (showLoadingDialog) {
        WRouter.pop();
      }

      SnackbarUtil.showUnknownErrorSnackbar(e, stackTrace: stackTrace);
      await onTransactionFailed?.call(e, stackTrace);
      return;
    }

    await onTransactionEnd?.call();
  }

  Map<String, String> _createHeaders() {
    final headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "User-Agent": userAgent,
    };

    if (bearerToken != null) {
      headers.addAll({"Authorization": "Bearer $bearerToken"});
    }

    return headers;
  }

  static bool isSuccess(http.Response response) {
    return response.statusCode >= 200 && response.statusCode <= 299;
  }
}
