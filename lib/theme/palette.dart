import 'package:flutter/material.dart';

import 'palette_data.dart';

class Palette extends InheritedWidget {
  final PaletteData lightPalette;
  final PaletteData darkPalette;
  final Widget child;

  const Palette({
    Key? key,
    required this.lightPalette,
    required this.darkPalette,
    required this.child,
  }) : super(key: key, child: child);

  static Palette paletteOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Palette>()!;
  }

  static PaletteData of(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final value = context.dependOnInheritedWidgetOfExactType<Palette>()!;
    return brightness == Brightness.light
        ? value.lightPalette
        : value.darkPalette;
  }

  @override
  bool updateShouldNotify(Palette oldWidget) {
    return lightPalette != oldWidget.lightPalette ||
        darkPalette != oldWidget.darkPalette;
  }
}
