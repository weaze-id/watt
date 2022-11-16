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
    this.data,
    required this.builder,
  }) : super(key: key);

  final PaletteData? lightPalette;
  final PaletteData? darkPalette;
  final WattThemeData? data;
  final Widget Function(
      BuildContext context, ThemeData theme, ThemeData darkTheme) builder;

  @override
  Widget build(BuildContext context) {
    final data = this.data ?? WattThemeData();
    return Palette(
      lightPalette: lightPalette ?? PaletteData.kLightPalette,
      darkPalette: darkPalette ?? PaletteData.kDarkPalette,
      child: WattTheme(
        data: data,
        child: Builder(
          builder: (context) => builder(
            context,
            data.generate(context),
            data.generateDark(context),
          ),
        ),
      ),
    );
  }
}
