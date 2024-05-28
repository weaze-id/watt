import 'package:flutter/material.dart';

import '../../watt.dart';
import 'index.dart';

class WattThemeData {
  final String fontFamily;
  final double bigButtonHeight;
  final double buttonBorderRadius;
  final double inputBorderRadius;
  final bool appBarCenterTitle;
  final double appBarElevation;
  final NotificationMessageData notificationMessageData;

  WattThemeData({
    this.fontFamily = "Poppins",
    this.bigButtonHeight = 55,
    this.buttonBorderRadius = 8,
    this.inputBorderRadius = 8,
    this.appBarCenterTitle = false,
    this.appBarElevation = 0,
    this.notificationMessageData = const NotificationMessageData(),
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

    return ThemeData(
      useMaterial3: false,
      fontFamily: fontFamily,
      colorScheme: palette.toColorScheme(),
      textTheme: textTheme,
      indicatorColor: palette.primary,
      highlightColor: Colors.black.withOpacity(.25),
      scaffoldBackgroundColor: palette.background,
      popupMenuTheme: PopupMenuThemeData(color: palette.surface),
      dialogBackgroundColor: palette.surface,
      dividerColor: palette.gray,
      tooltipTheme: _tooltipThemeData(palette),
      appBarTheme: _appBarTheme(palette, textTheme),
      drawerTheme: DrawerThemeData(backgroundColor: palette.surface),
      tabBarTheme: _tabBarTheme(palette),
      bottomAppBarTheme: BottomAppBarTheme(color: palette.surface),
      bottomNavigationBarTheme: _bottomNavBarThemeData(palette, textTheme),
      navigationBarTheme: _navigationBarTheme(palette, textTheme),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: palette.surface),
      elevatedButtonTheme: _elevatedbuttonStyle(palette),
      filledButtonTheme: FilledButtonThemeData(style: _buttonStyle(palette)),
      textButtonTheme: TextButtonThemeData(style: _buttonStyle(palette)),
      outlinedButtonTheme:
          OutlinedButtonThemeData(style: _buttonStyle(palette)),
      floatingActionButtonTheme: _fabThemeData(palette),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return palette.primary;
          }
          return null;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return palette.primary;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return palette.primary;
          }
          return null;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return palette.primary;
          }
          return null;
        }),
      ),
    );
  }

  TextTheme _textTheme(String fontFamily) {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      displayMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      ),
      displaySmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 48,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      headlineSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      ),
      titleSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      bodySmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      labelLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
      ),
      labelSmall: TextStyle(
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
        color: palette.gray.withOpacity(.75),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  AppBarTheme _appBarTheme(PaletteData palette, TextTheme textTheme) {
    return AppBarTheme(
      foregroundColor: palette.onSurface,
      backgroundColor: palette.surface,
      centerTitle: appBarCenterTitle,
      elevation: appBarElevation,
      iconTheme: IconThemeData(color: palette.onSurface),
      shadowColor: palette.brightness == Brightness.light
          ? Colors.white70
          : Colors.black45,
    );
  }

  TabBarTheme _tabBarTheme(PaletteData palette) {
    return TabBarTheme(
      labelColor: palette.primary,
      unselectedLabelColor: palette.gray.withOpacity(.75),
    );
  }

  BottomNavigationBarThemeData _bottomNavBarThemeData(
    PaletteData palette,
    TextTheme textTheme,
  ) {
    return BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: palette.surface,
      selectedItemColor: palette.primary,
      unselectedItemColor: palette.onSurface,
      selectedLabelStyle: textTheme.bodySmall,
      unselectedLabelStyle: textTheme.bodySmall,
    );
  }

  NavigationBarThemeData _navigationBarTheme(
    PaletteData palette,
    TextTheme textTheme,
  ) {
    return NavigationBarThemeData(
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>((states) {
        return textTheme.labelMedium?.copyWith(color: palette.onSurface);
      }),
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>((states) {
        return IconThemeData(color: palette.onSurface);
      }),
    );
  }

  ElevatedButtonThemeData _elevatedbuttonStyle(PaletteData palette) {
    return ElevatedButtonThemeData(
      style: _buttonStyle(palette).copyWith(
        overlayColor: WidgetStateColor.resolveWith(
          (states) => Colors.black.withOpacity(.25),
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle(PaletteData palette) {
    return ButtonStyle(
      visualDensity: VisualDensity.standard,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: WidgetStateProperty.resolveWith(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonBorderRadius),
        ),
      ),
      elevation: WidgetStateProperty.resolveWith((states) => 0),
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

class NotificationMessageData {
  final String Function(BuildContext context)? noInternetTitle;
  final String Function(BuildContext context)? noInternetMessage;
  final String Function(BuildContext context)? noDataTitle;
  final String Function(BuildContext context)? noDataMessage;
  final String Function(BuildContext context)? unknownErrorTitle;
  final String Function(BuildContext context)? unknownErrorMessage;
  final String Function(BuildContext context)? confirmLabel;
  final String Function(BuildContext context)? tryAgainLabel;

  const NotificationMessageData({
    this.noInternetTitle,
    this.noInternetMessage,
    this.noDataTitle,
    this.noDataMessage,
    this.unknownErrorTitle,
    this.unknownErrorMessage,
    this.confirmLabel,
    this.tryAgainLabel,
  });

  String getNoInternetTitle(BuildContext context, String? value) {
    return value ?? noInternetTitle?.call(context) ?? "No internet";
  }

  String getNoInternetMessage(BuildContext context, String? value) {
    return value ??
        noInternetMessage?.call(context) ??
        "Please check your internet connection";
  }

  String getNoDataTitle(BuildContext context, String? value) {
    return value ?? noDataTitle?.call(context) ?? "No data";
  }

  String getNoDataMessage(BuildContext context, String? value) {
    return value ??
        noDataMessage?.call(context) ??
        "There is currently no data available to show";
  }

  String getUnknownErrorTitle(BuildContext context, String? value) {
    return value ?? unknownErrorTitle?.call(context) ?? "Unknown error";
  }

  String getUnknownErrorMessage(BuildContext context, String? value) {
    return value ??
        unknownErrorMessage?.call(context) ??
        "Something went wrong, please try again later";
  }

  String getConfirmLabel(BuildContext context, String? value) {
    return value ?? confirmLabel?.call(context) ?? "Ok";
  }

  String getTryAgainLabel(BuildContext context, String? value) {
    return value ?? tryAgainLabel?.call(context) ?? "Try again";
  }
}
