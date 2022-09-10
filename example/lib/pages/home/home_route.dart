import 'package:witt/witt.dart';

import 'home_page/home_page.dart';

class HomeRoute {
  static const homePath = "/";

  static List<WPage> route() {
    return [
      WPage(
        path: homePath,
        builder: (context, args) => const HomePage(),
      )
    ];
  }
}
