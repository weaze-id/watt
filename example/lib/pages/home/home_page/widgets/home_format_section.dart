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
