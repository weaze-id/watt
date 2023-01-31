import 'package:flutter/material.dart';
import 'package:watt/watt.dart';

class HomeInputsSection extends StatelessWidget {
  const HomeInputsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Inputs", style: textTheme.titleLarge),
        const SizedBox(height: 16),
        StaticGrid(
          columnCount: Breakpoints.value(context, sm: 1, md: 2, lg: 3),
          gap: 16,
          children: const [
            UnderlinedInput(label: "Underlined field"),
            OutlinedInput(label: "Outlined field"),
            FilledInput(label: "Filled field"),
            _FileInput()
          ],
        ),
      ],
    );
  }
}

class _FileInput extends StatefulWidget {
  const _FileInput({Key? key}) : super(key: key);

  @override
  State<_FileInput> createState() => _FileInputState();
}

class _FileInputState extends State<_FileInput> {
  final files = <PlatformFile>[];

  @override
  Widget build(BuildContext context) {
    return FileInput(
      values: files,
      allowMultiple: true,
      onChanged: (values) {
        setState(() => files.clear());
        setState(() => files.addAll(values));
      },
    );
  }
}
