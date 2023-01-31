import 'package:flutter/material.dart';
import 'package:watt/watt.dart';

class HomeSelectSection extends StatefulWidget {
  const HomeSelectSection({Key? key}) : super(key: key);

  @override
  State<HomeSelectSection> createState() => _HomeSelectSectionState();
}

class _HomeSelectSectionState extends State<HomeSelectSection> {
  Set<String> singleValue = <String>{"Male"};
  Set<String> multiValue = <String>{"Flutter"};

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select", style: textTheme.titleLarge),
        const SizedBox(height: 16),
        StaticGrid(
          columnCount: Breakpoints.value(context, sm: 1, md: 2),
          rowCrossAxisAlignment: CrossAxisAlignment.start,
          gap: 16,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Single Select",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SelectList(
                  selected: singleValue,
                  selections: [
                    SelectItem(title: "Male", value: "Male"),
                    SelectItem(title: "Female", value: "Female")
                  ],
                  onSelectionChanged: (Set<String> value) =>
                      setState(() => singleValue = value),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Multi Select",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SelectList(
                  selected: multiValue,
                  selections: [
                    SelectItem(title: "Flutter", value: "Flutter"),
                    SelectItem(title: "ASP.NET Core", value: "ASP.NET Core"),
                    SelectItem(title: "PostgreSQL", value: "PostgreSQL"),
                    SelectItem(title: "React.JS", value: "React.JS"),
                    SelectItem(title: "TailwindCSS", value: "TailwindCSS"),
                  ],
                  onSelectionChanged: (Set<String> value) =>
                      setState(() => multiValue = value),
                  multiSelectionEnabled: true,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
