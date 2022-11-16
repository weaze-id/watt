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
        return _Child(child: child);
      default:
        return const SizedBox();
    }
  }
}

class _Child extends StatefulWidget {
  const _Child({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<_Child> createState() => _ChildState();
}

class _ChildState extends State<_Child> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  )..forward();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: standardEasing,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.child);
  }
}
