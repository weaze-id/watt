import 'package:flutter/material.dart';
import 'package:watt/watt.dart';

class HomeColorPalettesSection extends StatelessWidget {
  const HomeColorPalettesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Palette", style: textTheme.titleLarge),
        const SizedBox(height: 16),
        StaticGrid(
          columnCount: Breakpoints.value(context, sm: 1, md: 2, lg: 3),
          gap: 16,
          children: [
            _ColorPalette(
              name: "Primary",
              backgroundColor: palette.primary,
              foregroundColor: palette.onPrimary,
            ),
            _ColorPalette(
              name: "Error",
              backgroundColor: palette.error,
              foregroundColor: palette.onError,
            ),
            _ColorPalette(
              name: "Gray",
              backgroundColor: palette.gray,
              foregroundColor: palette.onGray,
            ),
            _ColorPalette(
              name: "Red",
              backgroundColor: palette.red,
              foregroundColor: palette.onRed,
            ),
            _ColorPalette(
              name: "Orange",
              backgroundColor: palette.orange,
              foregroundColor: palette.onOrange,
            ),
            _ColorPalette(
              name: "Yellow",
              backgroundColor: palette.yellow,
              foregroundColor: palette.onYellow,
            ),
            _ColorPalette(
              name: "Green",
              backgroundColor: palette.green,
              foregroundColor: palette.onGreen,
            ),
            _ColorPalette(
              name: "Blue",
              backgroundColor: palette.blue,
              foregroundColor: palette.onBlue,
            ),
            _ColorPalette(
              name: "Indigo",
              backgroundColor: palette.indigo,
              foregroundColor: palette.onIndigo,
            ),
            _ColorPalette(
              name: "Pink",
              backgroundColor: palette.pink,
              foregroundColor: palette.onPink,
            ),
            _ColorPalette(
              name: "Brown",
              backgroundColor: palette.brown,
              foregroundColor: palette.onBrown,
            ),
          ],
        ),
      ],
    );
  }
}

class _ColorPalette extends StatelessWidget {
  const _ColorPalette({
    Key? key,
    required this.name,
    required this.backgroundColor,
    required this.foregroundColor,
  }) : super(key: key);

  final String name;
  final MaterialColor backgroundColor;
  final MaterialColor foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _PaletteContainer("50", backgroundColor[50]!, foregroundColor),
            _PaletteContainer("100", backgroundColor[100]!, foregroundColor),
            _PaletteContainer("200", backgroundColor[200]!, foregroundColor),
            _PaletteContainer("300", backgroundColor[300]!, foregroundColor),
            _PaletteContainer("400", backgroundColor[400]!, foregroundColor),
            _PaletteContainer("500", backgroundColor, foregroundColor),
            _PaletteContainer("600", backgroundColor[600]!, foregroundColor),
            _PaletteContainer("700", backgroundColor[700]!, foregroundColor),
            _PaletteContainer("800", backgroundColor[800]!, foregroundColor),
            _PaletteContainer("900", backgroundColor[900]!, foregroundColor),
          ],
        ),
        Text(name),
        const SizedBox(height: 16),
      ],
    );
  }

  Expanded _PaletteContainer(
    String shade,
    Color backgroundColor,
    Color foregroundColor,
  ) {
    return Expanded(
      child: Container(
        color: backgroundColor,
        height: 50,
        child: Center(
          child: Text(shade, style: TextStyle(color: foregroundColor)),
        ),
      ),
    );
  }
}
