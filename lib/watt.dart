library watt;

import 'package:flutter/material.dart';

import 'theme/index.dart';

export 'package:file_picker/file_picker.dart' show PlatformFile;

export './http/index.dart';
export './responsive/index.dart';
export './theme/index.dart';
export './utils/index.dart';
export './widgets/index.dart';

class Watt extends StatelessWidget {
  const Watt({
    Key? key,
    this.lightPalette,
    this.darkPalette,
    this.settings,
    required this.builder,
  }) : super(key: key);

  final PaletteData? lightPalette;
  final PaletteData? darkPalette;
  final ThemeGeneratorSettings? settings;
  final Widget Function(BuildContext context, ThemeGeneratorSettings settings)
      builder;

  @override
  Widget build(BuildContext context) {
    final settings = this.settings ?? ThemeGeneratorSettings();
    return Palette(
      lightPalette: lightPalette ?? PaletteData.kLightPalette,
      darkPalette: darkPalette ?? PaletteData.kDarkPalette,
      child: ThemeGenerator(
        settings: settings,
        child: Builder(builder: (context) => builder(context, settings)),
      ),
    );
  }
}
