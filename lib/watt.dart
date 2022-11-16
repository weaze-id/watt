library watt;

import 'package:flutter/material.dart';

import 'src/theme/index.dart';

export 'package:file_picker/file_picker.dart' show PlatformFile;

export 'src/http/index.dart';
export 'src/responsive/index.dart';
export 'src/theme/index.dart';
export 'src/utils/index.dart';
export 'src/widgets/index.dart';

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
