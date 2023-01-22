import 'package:flutter/material.dart';
import 'package:watt/watt.dart';

class HomeButtonsSection extends StatelessWidget {
  const HomeButtonsSection({Key? key}) : super(key: key);

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
            BigButton(
              icon: const Icon(Icons.add),
              label: "Press me",
              onPressed: () {},
            ),
            TextBigButton(
              icon: const Icon(Icons.add),
              label: "Press me",
              onPressed: () {},
            ),
            OutlinedBigButton(
              icon: const Icon(Icons.add),
              label: "Press me",
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
