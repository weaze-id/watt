import 'package:flutter/material.dart';
import 'package:watt/watt.dart';

class HomeMessagesSection extends StatelessWidget {
  const HomeMessagesSection({Key? key}) : super(key: key);

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
