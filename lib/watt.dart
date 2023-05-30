library watt;

import 'package:flutter/material.dart';

import 'watt.dart';

export 'package:file_picker/file_picker.dart' show PlatformFile;

export 'src/constants/index.dart';
export 'src/responsive/index.dart';
export 'src/theme/index.dart';
export 'src/utils/index.dart';
export 'src/widgets/index.dart';

class Watt extends StatelessWidget {
  const Watt({
    Key? key,
    this.lightPalette,
    this.darkPalette,
    this.theme,
    required this.builder,
  }) : super(key: key);

  final PaletteData? lightPalette;
  final PaletteData? darkPalette;
  final WattThemeData? theme;
  final Widget Function(
      BuildContext context, ThemeData theme, ThemeData darkTheme) builder;

  @override
  Widget build(BuildContext context) {
    final theme = this.theme ?? WattThemeData();

    DialogUtil.context = context;
    SnackbarUtil.context = context;

    return Palette(
      lightPalette: lightPalette ?? PaletteData.kLightPalette,
      darkPalette: darkPalette ?? PaletteData.kDarkPalette,
      child: WattTheme(
        data: theme,
        child: Builder(
          builder: (context) => builder(
            context,
            theme.generate(context),
            theme.generateDark(context),
          ),
        ),
      ),
    );
  }
}
