library watt;

import 'package:flutter/material.dart';

import 'theme/palette.dart';
import 'theme/palette_data.dart';
import 'theme/theme_generator.dart';
import 'theme/theme_generator_settings.dart';

export 'package:file_picker/file_picker.dart' show PlatformFile;

export './http/http_client.dart';
export './http/http_transaction.dart';
export './responsive/breakpoints.dart';
export './responsive/responsive_builder.dart';
export './theme/palette.dart';
export './theme/palette_data.dart';
export './theme/theme_generator.dart';
export './theme/theme_generator_settings.dart';
export './utils/color_util.dart';
export './utils/date_util.dart';
export './utils/dialog_util.dart';
export './utils/number_util.dart';
export './utils/snackbar_util.dart';
export './widgets/button/big_button.dart';
export './widgets/button/outlined_big_button.dart';
export './widgets/button/text_big_button.dart';
export './widgets/input/file_input.dart';
export './widgets/input/input_base.dart';
export './widgets/input/outlined_input.dart';
export './widgets/loader/loader.dart';
export './widgets/loader/loader_notifier.dart';
export './widgets/loader/loader_state.dart';
export './widgets/message/error_message.dart';
export './widgets/message/no_data_message.dart';
export './widgets/message/no_internet_message.dart';
export './widgets/message/unknown_error_message.dart';
export './widgets/scrollable_column.dart';
export './widgets/select/multi_select_list.dart';
export './widgets/select/select_item.dart';
export './widgets/select/select_list.dart';
export './widgets/static_grid.dart';
export 'theme/theme_generator.dart';
export 'widgets/input/underlined_input.dart';

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
