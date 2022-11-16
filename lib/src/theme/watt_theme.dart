import 'package:flutter/material.dart';

import 'watt_theme_data.dart';

class WattTheme extends InheritedWidget {
  final WattThemeData data;
  final Widget child;

  const WattTheme({
    Key? key,
    required this.data,
    required this.child,
  }) : super(key: key, child: child);

  static WattThemeData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<WattTheme>()?.data;
  }

  @override
  bool updateShouldNotify(WattTheme oldWidget) {
    return data != oldWidget.data;
  }
}
