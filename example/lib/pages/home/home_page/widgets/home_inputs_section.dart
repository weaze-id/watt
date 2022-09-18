import 'package:flutter/material.dart';
import 'package:watt/watt.dart';
import 'package:watt/widgets/input/filled_input.dart';

class HomeInputsSection extends StatelessWidget {
  const HomeInputsSection({Key? key}) : super(key: key);

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
            UnderlinedInput(label: "Underlined field"),
            OutlinedInput(label: "Outlined field"),
            FilledInput(label: "Filled field"),
          ],
        ),
      ],
    );
  }
}
