import 'package:flutter/material.dart';

import '../utils/color_util.dart';

class PaletteData {
  final MaterialColor primary;
  final MaterialColor secondary;
  final MaterialColor tertiary;
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
  final MaterialColor brown;
  final MaterialColor onGray;
  final MaterialColor onRed;
  final MaterialColor onOrange;
  final MaterialColor onYellow;
  final MaterialColor onGreen;
  final MaterialColor onBlue;
  final MaterialColor onIndigo;
  final MaterialColor onPink;
  final MaterialColor onBrown;
  final MaterialColor black;
  final MaterialColor white;
  final Brightness brightness;

  const PaletteData({
    required this.primary,
    required this.secondary,
    required this.tertiary,
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
    required this.brown,
    required this.onGray,
    required this.onRed,
    required this.onOrange,
    required this.onYellow,
    required this.onGreen,
    required this.onBlue,
    required this.onIndigo,
    required this.onPink,
    required this.onBrown,
    required this.black,
    required this.white,
    required this.brightness,
  });

  PaletteData copyWith({
    MaterialColor? primary,
    MaterialColor? secondary,
    MaterialColor? tertiary,
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
    MaterialColor? brown,
    MaterialColor? onGray,
    MaterialColor? onRed,
    MaterialColor? onOrange,
    MaterialColor? onYellow,
    MaterialColor? onGreen,
    MaterialColor? onBlue,
    MaterialColor? onIndigo,
    MaterialColor? onPink,
    MaterialColor? onBrown,
    MaterialColor? black,
    MaterialColor? white,
    Brightness? brightness,
  }) {
    return PaletteData(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
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
      brown: brown ?? this.brown,
      onGray: onGray ?? this.onGray,
      onRed: onRed ?? this.onRed,
      onOrange: onOrange ?? this.onOrange,
      onYellow: onYellow ?? this.onYellow,
      onGreen: onGreen ?? this.onGreen,
      onBlue: onBlue ?? this.onBlue,
      onIndigo: onIndigo ?? this.onIndigo,
      onPink: onPink ?? this.onPink,
      onBrown: onBrown ?? this.onBrown,
      black: black ?? this.black,
      white: white ?? this.white,
      brightness: brightness ?? this.brightness,
    );
  }

  ColorScheme toColorScheme() {
    return ColorScheme(
      primary: primary,
      primaryContainer: primary.withOpacity(.25),
      secondary: primary,
      secondaryContainer: primary.withOpacity(.25),
      tertiary: primary,
      tertiaryContainer: primary.withOpacity(.25),
      surface: surface,
      background: background,
      error: error,
      onPrimary: onPrimary,
      onPrimaryContainer: primary[800],
      onSecondary: onPrimary,
      onSecondaryContainer: primary[800],
      onTertiary: onPrimary,
      onTertiaryContainer: primary[800],
      onSurface: onSurface,
      onBackground: onBackground,
      onError: onError,
      brightness: brightness,
    );
  }

  static final kLightPalette = PaletteData(
    primary: ColorUtil.createMaterialColor(const Color(0xFF0078d7)),
    secondary: ColorUtil.createMaterialColor(const Color(0xFF0078d7)),
    tertiary: ColorUtil.createMaterialColor(const Color(0xFF0078d7)),
    error: ColorUtil.createMaterialColor(const Color(0xFFc62828)),
    surface: ColorUtil.createMaterialColor(Colors.white),
    background: ColorUtil.createMaterialColor(Colors.white),
    onPrimary: ColorUtil.createMaterialColor(Colors.white),
    onSecondary: ColorUtil.createMaterialColor(Colors.white),
    onTersiary: ColorUtil.createMaterialColor(Colors.white),
    onError: ColorUtil.createMaterialColor(Colors.white),
    onSurface: ColorUtil.createMaterialColor(const Color(0xFF323130)),
    onBackground: ColorUtil.createMaterialColor(const Color(0xFF323130)),
    gray: ColorUtil.createMaterialColor(const Color(0XFF9E9E9E)),
    red: ColorUtil.createMaterialColor(const Color(0XFFF44336)),
    orange: ColorUtil.createMaterialColor(const Color(0XFFFF9800)),
    yellow: ColorUtil.createMaterialColor(const Color(0XFFFFEB3B)),
    green: ColorUtil.createMaterialColor(const Color(0XFF4CAF50)),
    blue: ColorUtil.createMaterialColor(const Color(0XFF2196F3)),
    indigo: ColorUtil.createMaterialColor(const Color(0XFF3F51B5)),
    pink: ColorUtil.createMaterialColor(const Color(0XFFE91E63)),
    brown: ColorUtil.createMaterialColor(const Color(0xFF795548)),
    onGray: ColorUtil.createMaterialColor(const Color(0xFF323130)),
    onRed: ColorUtil.createMaterialColor(Colors.white),
    onOrange: ColorUtil.createMaterialColor(const Color(0xFF323130)),
    onYellow: ColorUtil.createMaterialColor(const Color(0xFF323130)),
    onGreen: ColorUtil.createMaterialColor(Colors.white),
    onBlue: ColorUtil.createMaterialColor(Colors.white),
    onIndigo: ColorUtil.createMaterialColor(Colors.white),
    onPink: ColorUtil.createMaterialColor(Colors.white),
    onBrown: ColorUtil.createMaterialColor(Colors.white),
    black: ColorUtil.createMaterialColor(Colors.black),
    white: ColorUtil.createMaterialColor(Colors.white),
    brightness: Brightness.light,
  );

  static final kDarkPalette = PaletteData(
    primary: ColorUtil.createMaterialColor(const Color(0xFF80BCEB)),
    secondary: ColorUtil.createMaterialColor(const Color(0xFF80BCEB)),
    tertiary: ColorUtil.createMaterialColor(const Color(0xFF80BCEB)),
    error: ColorUtil.createMaterialColor(const Color(0XFFEF9A9A)),
    surface: ColorUtil.createMaterialColor(const Color(0XFF1C1D22)),
    background: ColorUtil.createMaterialColor(const Color(0XFF1C1D22)),
    onPrimary: ColorUtil.createMaterialColor(const Color(0XFF323130)),
    onSecondary: ColorUtil.createMaterialColor(const Color(0XFF323130)),
    onTersiary: ColorUtil.createMaterialColor(const Color(0XFF323130)),
    onError: ColorUtil.createMaterialColor(const Color(0XFF323130)),
    onSurface: ColorUtil.createMaterialColor(Colors.white),
    onBackground: ColorUtil.createMaterialColor(Colors.white),
    gray: ColorUtil.createMaterialColor(const Color(0XFFEEEEEE)),
    red: ColorUtil.createMaterialColor(const Color(0XFFEF9A9A)),
    orange: ColorUtil.createMaterialColor(const Color(0XFFFFE0B2)),
    yellow: ColorUtil.createMaterialColor(const Color(0XFFFFF9C4)),
    green: ColorUtil.createMaterialColor(const Color(0XFFC8E6C9)),
    blue: ColorUtil.createMaterialColor(const Color(0XFFBBDEFB)),
    indigo: ColorUtil.createMaterialColor(const Color(0XFFC5CAE9)),
    pink: ColorUtil.createMaterialColor(const Color(0XFFF8BBD0)),
    brown: ColorUtil.createMaterialColor(const Color(0xFFBA988C)),
    onGray: ColorUtil.createMaterialColor(const Color(0xFF323130)),
    onRed: ColorUtil.createMaterialColor(const Color(0xFF323130)),
    onOrange: ColorUtil.createMaterialColor(const Color(0xFF323130)),
    onYellow: ColorUtil.createMaterialColor(const Color(0xFF323130)),
    onGreen: ColorUtil.createMaterialColor(const Color(0xFF323130)),
    onBlue: ColorUtil.createMaterialColor(const Color(0xFF323130)),
    onIndigo: ColorUtil.createMaterialColor(const Color(0xFF323130)),
    onPink: ColorUtil.createMaterialColor(const Color(0xFF323130)),
    onBrown: ColorUtil.createMaterialColor(const Color(0xFF323130)),
    black: ColorUtil.createMaterialColor(Colors.black),
    white: ColorUtil.createMaterialColor(Colors.white),
    brightness: Brightness.dark,
  );
}
