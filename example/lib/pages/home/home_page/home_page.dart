import 'package:flutter/material.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

import '../../../app_router.dart';
import '../home_route.dart';
import 'widgets/home_button_section.dart';
import 'widgets/home_color_palette_section.dart';
import 'widgets/home_format_section.dart';
import 'widgets/home_inputs_section.dart';
import 'widgets/home_loader_section.dart';
import 'widgets/home_message_section.dart';
import 'widgets/home_notification_section.dart';
import 'widgets/home_select_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loaderState = WProvider.of<ValueNotifier<LoaderState>>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
        actions: [
          IconButton(
            onPressed: () => AppRouter.pushNamed(HomeRoute.infiniteScrollPath),
            icon: const Icon(Icons.list),
          ),
          const _ThemeModeChangebutton(),
        ],
      ),
      body: WListener(
        notifiers: [loaderState],
        builder: (context) {
          return LoaderNotifier(state: loaderState, child: const _Body());
        },
      ),
    );
  }
}

class _ThemeModeChangebutton extends StatelessWidget {
  const _ThemeModeChangebutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = WProvider.of<ValueNotifier<ThemeMode>>(context);
    return WListener(
      notifiers: [themeMode],
      builder: (context) {
        final themeModeValue = themeMode.value;
        return IconButton(
          onPressed: () {
            themeMode.value = themeModeValue == ThemeMode.light
                ? ThemeMode.dark
                : ThemeMode.light;
          },
          icon: Icon(
            themeModeValue == ThemeMode.light
                ? Icons.light_mode
                : Icons.dark_mode,
          ),
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeColorPalettesSection(),
          SizedBox(height: 32),
          HomeButtonsSection(),
          SizedBox(height: 32),
          HomeInputsSection(),
          SizedBox(height: 32),
          HomeSelectSection(),
          SizedBox(height: 32),
          HomeNotificationSection(),
          SizedBox(height: 32),
          HomeLoaderSection(),
          SizedBox(height: 32),
          HomeMessagesSection(),
          SizedBox(height: 32),
          HomeFormatSection(),
        ],
      ),
    );
  }
}
