import 'package:flutter/material.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

import 'widgets/home_button_section.dart';
import 'widgets/home_color_palette_section.dart';
import 'widgets/home_format_section.dart';
import 'widgets/home_inputs_section.dart';
import 'widgets/home_loader_section.dart';
import 'widgets/home_message_section.dart';
import 'widgets/home_select_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loaderState = WService.get<ValueNotifier<LoaderState>>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
        actions: const [_ThemeModeChangebutton()],
      ),
      body: WListener(
        notifier: loaderState,
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
    final themeMode = WService.get<ValueNotifier<ThemeMode>>();
    return WListener(
      notifier: themeMode,
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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          HomeColorPalettesSection(),
          SizedBox(height: 32),
          HomeButtonsSection(),
          SizedBox(height: 32),
          HomeInputsSection(),
          SizedBox(height: 32),
          HomeSelectSection(),
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
