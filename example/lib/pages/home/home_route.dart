import 'package:witt/witt.dart';

import 'home_page/home_page.dart';
import 'infinite_scroll_page/infinite_scroll_page.dart';

class HomeRoute {
  static const homePath = "/";
  static const infiniteScrollPath = "/infinite";

  static List<WPage> route() {
    return [
      WPage(
        path: homePath,
        builder: (context, args) => const HomePage(),
      ),
      WPage(
        path: infiniteScrollPath,
        builder: (context, args) => const InfiniteScrollPage(),
      )
    ];
  }
}
