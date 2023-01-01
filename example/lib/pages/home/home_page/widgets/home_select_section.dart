import 'package:flutter/material.dart';
import 'package:watt/watt.dart';

class HomeSelectSection extends StatefulWidget {
  const HomeSelectSection({Key? key}) : super(key: key);

  @override
  State<HomeSelectSection> createState() => _HomeSelectSectionState();
}

class _HomeSelectSectionState extends State<HomeSelectSection> {
  int singleValue = 0;
  List<int> multiValue = [];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select", style: textTheme.headline6),
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
                  value: singleValue,
                  items: [
                    SelectItem(title: "Male"),
                    SelectItem(title: "Female")
                  ],
                  onChanged: (value) => setState(() => singleValue = value),
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
                MultiSelectList(
                  values: multiValue,
                  items: [
                    SelectItem(title: "Flutter"),
                    SelectItem(title: "ASP.NET Core"),
                    SelectItem(title: "PostgreSQL"),
                    SelectItem(title: "React.JS"),
                    SelectItem(title: "TailwindCSS"),
                  ],
                  onChanged: (value) => setState(() => multiValue = value),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
