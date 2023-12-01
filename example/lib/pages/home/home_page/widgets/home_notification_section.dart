import 'package:flutter/material.dart';
import 'package:watt/watt.dart';

class HomeNotificationSection extends StatelessWidget {
  const HomeNotificationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Notification", style: textTheme.titleLarge),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            DialogUtil.showAlertDialog(
              context,
              title: "Alert",
              message: "This is alert dialog",
            );
          },
          child: const Text("Alert Dialog"),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            DialogUtil.showNoInternetDialog(context);
          },
          child: const Text("No Internet Dialog"),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            SnackbarUtil.showSnackbar(context, "This is snackbar");
          },
          child: const Text("Snackbar"),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            SnackbarUtil.showErrorSnackbar(context, "This is error snackbar");
          },
          child: const Text("Error Snackbar"),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            SnackbarUtil.showNoInternetSnackbar(context);
          },
          child: const Text("No Internet Snackbar"),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            SnackbarUtil.showUnknownErrorSnackbar(context);
          },
          child: const Text("Unknown Error Snackbar"),
        ),
      ],
    );
  }
}
