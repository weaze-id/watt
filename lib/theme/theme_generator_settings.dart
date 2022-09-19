import 'package:flutter/material.dart';

import 'palette.dart';
import 'palette_data.dart';

class ThemeGeneratorSettings {
  final String fontFamily;
  final double buttonBorderRadius;
  final double inputBorderRadius;
  final bool appBarCenterTitle;
  final double appBarElevation;

  ThemeGeneratorSettings({
    this.fontFamily = "Poppins",
    this.buttonBorderRadius = 8,
    this.inputBorderRadius = 8,
    this.appBarCenterTitle = false,
    this.appBarElevation = 0,
  });

  ThemeData generate(BuildContext context) {
    final palette = Palette.paletteOf(context);
    return _generate(palette: palette.lightPalette);
  }

  ThemeData generateDark(BuildContext context) {
    final palette = Palette.paletteOf(context);
    return _generate(palette: palette.darkPalette);
  }

  ThemeData _generate({required PaletteData palette}) {
    final textTheme = _textTheme(fontFamily).apply(
      displayColor: palette.onBackground,
      bodyColor: palette.onBackground,
      decorationColor: palette.onBackground,
    );

    final elevatedButtonThemeData = ElevatedButtonThemeData(
      style: _buttonStyle(palette).copyWith(
        overlayColor: MaterialStateColor.resolveWith(
          (states) => Colors.black.withOpacity(.25),
        ),
      ),
    );

    final textButtonThemeData =
        TextButtonThemeData(style: _buttonStyle(palette));
    final outlinedButtonThemeData =
        OutlinedButtonThemeData(style: _buttonStyle(palette));

    return ThemeData(
      colorScheme: palette.toColorScheme(),
      textTheme: textTheme,
      primaryColor: palette.primary,
      indicatorColor: palette.primary,
      highlightColor: Colors.black.withOpacity(.25),
      toggleableActiveColor: palette.primary,
      scaffoldBackgroundColor: palette.background,
      popupMenuTheme: PopupMenuThemeData(color: palette.surface),
      dialogBackgroundColor: palette.surface,
      dividerColor: palette.gray,
      tooltipTheme: _tooltipThemeData(palette),
      appBarTheme: _appBarTheme(palette),
      tabBarTheme: _tabBarTheme(palette),
      bottomNavigationBarTheme: _bottomNavBarThemeData(palette, textTheme),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: palette.surface),
      elevatedButtonTheme: elevatedButtonThemeData,
      textButtonTheme: textButtonThemeData,
      outlinedButtonTheme: outlinedButtonThemeData,
      floatingActionButtonTheme: _fabThemeData(palette),
    );
  }

  TextTheme _textTheme(String fontFamily) {
    return TextTheme(
      headline1: TextStyle(
        fontFamily: fontFamily,
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      headline2: TextStyle(
        fontFamily: fontFamily,
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      ),
      headline3: TextStyle(
        fontFamily: fontFamily,
        fontSize: 48,
        fontWeight: FontWeight.w400,
      ),
      headline4: TextStyle(
        fontFamily: fontFamily,
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      headline5: TextStyle(
        fontFamily: fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      headline6: TextStyle(
        fontFamily: fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      subtitle1: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      ),
      subtitle2: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyText1: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyText2: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      button: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
      ),
      caption: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      overline: TextStyle(
        fontFamily: fontFamily,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
      ),
    );
  }

  TooltipThemeData _tooltipThemeData(PaletteData palette) {
    return TooltipThemeData(
      decoration: BoxDecoration(
        color: palette.gray,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  AppBarTheme _appBarTheme(PaletteData palette) {
    return AppBarTheme(
      foregroundColor: palette.onSurface,
      backgroundColor: palette.surface,
      centerTitle: appBarCenterTitle,
      elevation: appBarElevation,
    );
  }

  TabBarTheme _tabBarTheme(PaletteData palette) {
    return TabBarTheme(
      labelColor: palette.primary,
      unselectedLabelColor: palette.gray,
    );
  }

  BottomNavigationBarThemeData _bottomNavBarThemeData(
    PaletteData palette,
    TextTheme textTheme,
  ) {
    return BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: palette.surface,
      selectedItemColor: palette.onSurface,
      unselectedItemColor: palette.onSurface,
      selectedLabelStyle: textTheme.caption,
      unselectedLabelStyle: textTheme.caption,
    );
  }

  ButtonStyle _buttonStyle(PaletteData palette) {
    return ButtonStyle(
      visualDensity: VisualDensity.standard,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: MaterialStateProperty.resolveWith(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonBorderRadius),
        ),
      ),
      elevation: MaterialStateProperty.resolveWith((states) => 0),
    );
  }

  FloatingActionButtonThemeData _fabThemeData(
    PaletteData palette,
  ) {
    return FloatingActionButtonThemeData(
      backgroundColor: palette.primary,
      foregroundColor: palette.onPrimary,
      splashColor: Colors.black.withOpacity(.25),
    );
  }
}
