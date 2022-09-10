import 'package:flutter/material.dart';

class IPalette {
  final MaterialColor primary;
  final MaterialColor secondary;
  final MaterialColor tersiary;
  final MaterialColor error;
  final MaterialColor surface;
  final MaterialColor background;
  final MaterialColor onPrimary;
  final MaterialColor onSecondary;
  final MaterialColor onTersiary;
  final MaterialColor onError;
  final MaterialColor onSurface;
  final MaterialColor onBackground;
  final MaterialColor gray;
  final MaterialColor red;
  final MaterialColor orange;
  final MaterialColor yellow;
  final MaterialColor green;
  final MaterialColor blue;
  final MaterialColor indigo;
  final MaterialColor pink;
  final Brightness brightness;

  const IPalette({
    required this.primary,
    required this.secondary,
    required this.tersiary,
    required this.error,
    required this.surface,
    required this.background,
    required this.onPrimary,
    required this.onSecondary,
    required this.onTersiary,
    required this.onError,
    required this.onSurface,
    required this.onBackground,
    required this.gray,
    required this.red,
    required this.orange,
    required this.yellow,
    required this.green,
    required this.blue,
    required this.indigo,
    required this.pink,
    required this.brightness,
  });

  IPalette copyWith({
    MaterialColor? primary,
    MaterialColor? secondary,
    MaterialColor? tersiary,
    MaterialColor? error,
    MaterialColor? surface,
    MaterialColor? background,
    MaterialColor? onPrimary,
    MaterialColor? onSecondary,
    MaterialColor? onTersiary,
    MaterialColor? onError,
    MaterialColor? onSurface,
    MaterialColor? onBackground,
    MaterialColor? gray,
    MaterialColor? red,
    MaterialColor? orange,
    MaterialColor? yellow,
    MaterialColor? green,
    MaterialColor? blue,
    MaterialColor? indigo,
    MaterialColor? pink,
    Brightness? brightness,
  }) {
    return IPalette(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tersiary: tersiary ?? this.tersiary,
      error: error ?? this.error,
      surface: surface ?? this.surface,
      background: background ?? this.background,
      onPrimary: onPrimary ?? this.onPrimary,
      onSecondary: onSecondary ?? this.onSecondary,
      onTersiary: onTersiary ?? this.onTersiary,
      onError: onError ?? this.onError,
      onSurface: onSurface ?? this.onSurface,
      onBackground: onBackground ?? this.onBackground,
      gray: gray ?? this.gray,
      red: red ?? this.red,
      orange: orange ?? this.orange,
      yellow: yellow ?? this.yellow,
      green: green ?? this.green,
      blue: blue ?? this.blue,
      indigo: indigo ?? this.indigo,
      pink: pink ?? this.pink,
      brightness: brightness ?? this.brightness,
    );
  }

  ColorScheme toColorScheme() {
    return ColorScheme(
      primary: primary,
      primaryContainer: primary,
      secondary: primary,
      secondaryContainer: primary,
      surface: surface,
      background: background,
      error: error,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onSurface: onSurface,
      onBackground: onBackground,
      onError: onError,
      brightness: brightness,
    );
  }
}
