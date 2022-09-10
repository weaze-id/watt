import 'package:flutter/material.dart';

import '../message/no_internet_message.dart';
import '../message/unknown_error_message.dart';
import 'loader_state.dart';

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
    required this.state,
    this.primary,
    this.onPrimary,
    this.onTryAgain,
    required this.child,
  }) : super(key: key);

  final LoaderState state;
  final Color? primary;
  final Color? onPrimary;
  final void Function()? onTryAgain;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case LoaderState.loading:
        return Center(child: CircularProgressIndicator(color: primary));
      case LoaderState.noInternet:
        return NoInternetMessage(
          primary: primary,
          onPrimary: onPrimary,
          onTryAgain: onTryAgain,
        );
      case LoaderState.unknownError:
        return UnknownErrorMessage(
          primary: primary,
          onPrimary: onPrimary,
          onTryAgain: onTryAgain,
        );
      case LoaderState.none:
        return child;
      default:
        return const SizedBox();
    }
  }
}
