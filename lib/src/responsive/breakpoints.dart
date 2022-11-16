import 'package:flutter/cupertino.dart';

class Breakpoints {
  static const SM = 640;
  static const MD = 768;
  static const LG = 1024;
  static const XL = 1280;
  static const DOUBLE_XL = 1536;

  static T value<T>(
    BuildContext context, {
    required T sm,
    T? md,
    T? lg,
    T? xl,
    T? doubleXl,
  }) {
    final mediaQuery = MediaQuery.of(context);
    final deviceSize = mediaQuery.size.width;

    if (deviceSize >= DOUBLE_XL) {
      return doubleXl ?? xl ?? lg ?? md ?? sm;
    }

    if (deviceSize >= XL) {
      return xl ?? lg ?? md ?? sm;
    }

    if (deviceSize >= LG) {
      return lg ?? md ?? sm;
    }

    if (deviceSize >= MD) {
      return md ?? sm;
    }

    return sm;
  }
}
