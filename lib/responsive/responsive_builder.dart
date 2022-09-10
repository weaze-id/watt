import 'package:flutter/material.dart';

import 'breakpoints.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    Key? key,
    required this.sm,
    this.md,
    this.lg,
    this.xl,
    this.doubleXl,
  }) : super(key: key);

  final Widget sm;
  final Widget? md;
  final Widget? lg;
  final Widget? xl;
  final Widget? doubleXl;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final deviceSize = mediaQuery.size.width;

    if (deviceSize >= Breakpoints.DOUBLE_XL) {
      return doubleXl ?? xl ?? lg ?? md ?? sm;
    }

    if (deviceSize >= Breakpoints.XL) {
      return xl ?? lg ?? md ?? sm;
    }

    if (deviceSize >= Breakpoints.LG) {
      return lg ?? md ?? sm;
    }

    if (deviceSize >= Breakpoints.MD) {
      return md ?? sm;
    }

    return sm;
  }
}
