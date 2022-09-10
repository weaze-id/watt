import 'package:flutter/material.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = WService.get<ValueNotifier<ThemeMode>>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
        actions: [
          WListener(
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
          )
        ],
      ),
      body: const _Body(),
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
          _ColorPalettesSection(),
          SizedBox(height: 32),
          _ButtonsSection(),
          SizedBox(height: 32),
          _InputsSection(),
          SizedBox(height: 32),
          _MessagesSection(),
          SizedBox(height: 32),
          _FormatSection(),
        ],
      ),
    );
  }
}

class _ColorPalettesSection extends StatelessWidget {
  const _ColorPalettesSection({Key? key}) : super(key: key);

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

class _ButtonsSection extends StatelessWidget {
  const _ButtonsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Button", style: textTheme.headline6),
        const SizedBox(height: 16),
        StaticGrid(
          columnCount: Breakpoints.value(context, sm: 1, md: 2, lg: 3),
          gap: 16,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Press me")),
            TextButton(onPressed: () {}, child: const Text("Press me")),
            OutlinedButton(onPressed: () {}, child: const Text("Press me")),
            BigButton(label: "Press me", onPressed: () {}),
            TextBigButton(label: "Press me", onPressed: () {}),
            OutlinedBigButton(label: "Press me", onPressed: () {}),
          ],
        )
      ],
    );
  }
}

class _InputsSection extends StatelessWidget {
  const _InputsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Inputs", style: textTheme.headline6),
        const SizedBox(height: 16),
        StaticGrid(
          columnCount: Breakpoints.value(context, sm: 1, md: 2, lg: 3),
          gap: 16,
          children: const [
            FilledInput(label: "Input field"),
            OutlinedInput(label: "Input field"),
          ],
        ),
      ],
    );
  }
}

class _MessagesSection extends StatelessWidget {
  const _MessagesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Messages", style: textTheme.headline6),
        const SizedBox(height: 16),
        StaticGrid(
          columnCount: Breakpoints.value(context, sm: 1, md: 2, lg: 3),
          gap: 16,
          children: [
            NoDataMessage(onTryAgain: () {}),
            NoInternetMessage(onTryAgain: () {}),
            UnknownErrorMessage(onTryAgain: () {}),
          ],
        ),
      ],
    );
  }
}

class _FormatSection extends StatelessWidget {
  const _FormatSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Formats", style: textTheme.headline6),
        const SizedBox(height: 16),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("DateTime standard"),
          subtitle: Text(DateUtil.standard(DateTime.now())),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("DateTime standard with hour"),
          subtitle: Text(DateUtil.standardWithHour(DateTime.now())),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("DateTime full"),
          subtitle: Text(DateUtil.full(DateTime.now())),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("DateTime full with hour"),
          subtitle: Text(DateUtil.fullWithHour(DateTime.now())),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("DateTime compact"),
          subtitle: Text(DateUtil.compact(DateTime.now())),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("DateTime compact with hour"),
          subtitle: Text(DateUtil.compactWithHour(DateTime.now())),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("Number integer"),
          subtitle: Text(NumberUtil.integer(10000.123)),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("Number currency"),
          subtitle: Text(NumberUtil.currency(10000.123)),
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
