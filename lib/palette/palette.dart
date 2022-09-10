import 'package:flutter/material.dart';

import '../utils/color_util.dart';
import 'ipalette.dart';

class Palette {
  static IPalette light = IPalette(
    primary: ColorUtil.createMaterialColor(const Color(0xFF0078d7)),
    secondary: ColorUtil.createMaterialColor(const Color(0xFF0078d7)),
    tersiary: ColorUtil.createMaterialColor(const Color(0xFF0078d7)),
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
    brightness: Brightness.light,
  );

  static IPalette dark = IPalette(
    primary: ColorUtil.createMaterialColor(const Color(0xFF80BCEB)),
    secondary: ColorUtil.createMaterialColor(const Color(0xFF80BCEB)),
    tersiary: ColorUtil.createMaterialColor(const Color(0xFF80BCEB)),
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
    brightness: Brightness.dark,
  );

  static IPalette of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? light : dark;
  }
}
