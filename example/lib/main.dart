import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

import 'pages/home/home_route.dart';

void main() {
  WService.enableLog = true;

  WService.addSingleton(() => ValueNotifier(ThemeMode.light));
  WService.addSingleton(() => const FlutterSecureStorage());
  WService.addSingleton(
    () => HttpClient(authenticationPath: "/", userAgent: "Example"),
  );

  final themeMode = WService.get<ValueNotifier<ThemeMode>>();

  runApp(
    WListener(
      notifier: themeMode,
      builder: (context) {
        final themeModeValue = themeMode.value;
        return Watt(
          builder: (context, settings) => MaterialApp(
            navigatorKey: WRouter.navigatorKey,
            title: "Example",
            themeMode: themeModeValue,
            theme: settings.generate(context),
            darkTheme: settings.generateDark(context),
            onGenerateRoute: (settings) => WRouter.onGenerateMaterialRoute(
              settings: settings,
              pages: [...HomeRoute.route()],
            ),
          ),
        );
      },
    ),
  );
}
