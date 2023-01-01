import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

import 'pages/home/home_route.dart';

void main() {
  runApp(
    WMultiProvider.builder(
      providers: [
        WProvider(service: () => ValueNotifier(LoaderState.none)),
        WProvider(service: () => ValueNotifier(ThemeMode.light)),
        WProvider(service: () => const FlutterSecureStorage()),
        WProvider(
          service: () => HttpClient(
            authenticationPath: "/",
            userAgent: "Example",
          ),
        ),
      ],
      builder: (context) {
        final themeMode = WProvider.of<ValueNotifier<ThemeMode>>(context);
        return WListener(
          notifier: themeMode,
          builder: (context) {
            final themeModeValue = themeMode.value;
            return Watt(
              builder: (context, theme, darkTheme) => MaterialApp(
                navigatorKey: WRouter.navigatorKey,
                title: "Example",
                themeMode: themeModeValue,
                theme: theme,
                darkTheme: darkTheme,
                onGenerateRoute: (settings) => WRouter.onGenerateRoute(
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
