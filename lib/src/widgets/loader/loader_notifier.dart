import 'package:flutter/material.dart';

import 'loader.dart';
import 'loader_state.dart';

class LoaderNotifier extends StatelessWidget {
  const LoaderNotifier({
    Key? key,
    required this.state,
    this.primary,
    this.onPrimary,
    this.onTryAgain,
    required this.child,
  }) : super(key: key);

  final ValueNotifier<LoaderState> state;
  final Color? primary;
  final Color? onPrimary;
  final void Function()? onTryAgain;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<LoaderState>(
      valueListenable: state,
      builder: (context, value, loaderState) {
        return Loader(
          state: value,
          primary: primary,
          onPrimary: onPrimary,
          onTryAgain: onTryAgain,
          child: child,
        );
      },
    );
  }
}
