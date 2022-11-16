import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

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
    return WListener(
      notifier: state,
      builder: (context) {
        return Loader(
          state: state.value,
          primary: primary,
          onPrimary: onPrimary,
          onTryAgain: onTryAgain,
          child: child,
        );
      },
    );
  }
}
