import 'package:flutter/material.dart';

import 'theme_generator_settings.dart';

class ThemeGenerator extends InheritedWidget {
  final ThemeGeneratorSettings settings;
  final Widget child;

  const ThemeGenerator({
    Key? key,
    required this.settings,
    required this.child,
  }) : super(key: key, child: child);

  static ThemeGeneratorSettings? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ThemeGenerator>()
        ?.settings;
  }

  @override
  bool updateShouldNotify(ThemeGenerator oldWidget) {
    return settings != oldWidget.settings;
  }
}
