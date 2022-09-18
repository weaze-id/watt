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
        Text("Palette", style: textTheme.headline6),
        const SizedBox(height: 16),
        StaticGrid(
          columnCount: Breakpoints.value(context, sm: 1, md: 2, lg: 3),
          gap: 16,
          children: [
            _ColorPalette(name: "Primary", color: palette.primary),
            _ColorPalette(name: "Error", color: palette.error),
            _ColorPalette(name: "Gray", color: palette.gray),
            _ColorPalette(name: "Red", color: palette.red),
            _ColorPalette(name: "Orange", color: palette.orange),
            _ColorPalette(name: "Yellow", color: palette.yellow),
            _ColorPalette(name: "Green", color: palette.green),
            _ColorPalette(name: "Blue", color: palette.blue),
            _ColorPalette(name: "Indigo", color: palette.indigo),
            _ColorPalette(name: "Pink", color: palette.pink),
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
    required this.color,
  }) : super(key: key);

  final String name;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _PaletteContainer(color[50]!),
            _PaletteContainer(color[100]!),
            _PaletteContainer(color[200]!),
            _PaletteContainer(color[300]!),
            _PaletteContainer(color[400]!),
            _PaletteContainer(color),
            _PaletteContainer(color[600]!),
            _PaletteContainer(color[700]!),
            _PaletteContainer(color[800]!),
            _PaletteContainer(color[900]!),
          ],
        ),
        Text(name),
        const SizedBox(height: 16),
      ],
    );
  }

  Expanded _PaletteContainer(Color color) {
    return Expanded(child: Container(color: color, height: 50));
  }
}
