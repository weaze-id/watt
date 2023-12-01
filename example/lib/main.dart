import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

import 'app_router.dart';
import 'pages/home/home_route.dart';

void main() {
  runApp(
    WMultiProvider.builder(
      providers: [
        WProvider(create: (context) => ValueNotifier(LoaderState.none)),
        WProvider(create: (context) => ValueNotifier(ThemeMode.light)),
        WProvider(create: (context) => const FlutterSecureStorage()),
      ],
      builder: (context) {
        final themeMode = WProvider.of<ValueNotifier<ThemeMode>>(context);
        return WListener(
          notifiers: [themeMode],
          builder: (context) {
            final themeModeValue = themeMode.value;
            return Watt(
              builder: (context, theme, darkTheme) => MaterialApp(
                navigatorKey: AppRouter.navigatorKey,
                title: "Example",
                themeMode: themeModeValue,
                theme: theme,
                darkTheme: darkTheme,
                onGenerateRoute: (settings) => AppRouter.onGenerateRoute(
                  settings: settings,
                  pages: [...HomeRoute.route()],
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
