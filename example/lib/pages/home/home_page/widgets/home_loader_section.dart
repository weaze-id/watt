import 'dart:async';

import 'package:flutter/material.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

class HomeLoaderSection extends StatelessWidget {
  const HomeLoaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final loaderState = WProvider.of<ValueNotifier<LoaderState>>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Loader", style: textTheme.titleLarge),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            loaderState.value = LoaderState.loading;
            Future.delayed(const Duration(seconds: 3), () {
              loaderState.value = LoaderState.none;
            });
          },
          child: const Text("Start loader"),
        ),
      ],
    );
  }
}
