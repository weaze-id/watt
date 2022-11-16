import 'package:flutter/material.dart';
import 'package:watt/watt.dart';

class HomeFormatSection extends StatelessWidget {
  const HomeFormatSection({Key? key}) : super(key: key);

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
          subtitle: Text(DateFormatUtil.standard(DateTime.now())),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("DateTime standard with hour"),
          subtitle: Text(DateFormatUtil.standardWithHour(DateTime.now())),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("DateTime full"),
          subtitle: Text(DateFormatUtil.full(DateTime.now())),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("DateTime full with hour"),
          subtitle: Text(DateFormatUtil.fullWithHour(DateTime.now())),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("DateTime compact"),
          subtitle: Text(DateFormatUtil.compact(DateTime.now())),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("DateTime compact with hour"),
          subtitle: Text(DateFormatUtil.compactWithHour(DateTime.now())),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("Number integer"),
          subtitle: Text(NumberFormatUtil.integer(10000.123)),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("Number currency"),
          subtitle: Text(NumberFormatUtil.currency(10000.123)),
        ),
      ],
    );
  }
}
