import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

import '../palette/ipalette.dart';
import '../palette/palette.dart';
import 'theme_generator_settings.dart';

class ThemeGenerator {
  final ThemeGeneratorSettings settings;

  ThemeGenerator({required this.settings}) {
    WService.addSingleton(() => settings);
  }

  ThemeData generate() {
    return _generate(palette: Palette.light);
  }

  ThemeData generateDark() {
    return _generate(palette: Palette.dark);
  }

  ThemeData _generate({required IPalette palette}) {
    final textTheme = _textTheme(settings.fontFamily).apply(
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

  TooltipThemeData _tooltipThemeData(IPalette palette) {
    return TooltipThemeData(
      decoration: BoxDecoration(
        color: palette.gray,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  AppBarTheme _appBarTheme(IPalette palette) {
    return AppBarTheme(
      foregroundColor: palette.onSurface,
      backgroundColor: palette.surface,
      centerTitle: settings.appBarCenterTitle,
      elevation: settings.appBarElevation,
    );
  }

  TabBarTheme _tabBarTheme(IPalette palette) {
    return TabBarTheme(
      labelColor: palette.primary,
      unselectedLabelColor: palette.gray,
    );
  }

  BottomNavigationBarThemeData _bottomNavBarThemeData(
    IPalette palette,
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

  ButtonStyle _buttonStyle(IPalette palette) {
    return ButtonStyle(
      visualDensity: VisualDensity.standard,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: MaterialStateProperty.resolveWith(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(settings.buttonBorderRadius),
        ),
      ),
      elevation: MaterialStateProperty.resolveWith((states) => 0),
    );
  }

  FloatingActionButtonThemeData _fabThemeData(
    IPalette palette,
  ) {
    return FloatingActionButtonThemeData(
      backgroundColor: palette.primary,
      foregroundColor: palette.onPrimary,
      splashColor: Colors.black.withOpacity(.25),
    );
  }
}
