import '../../app_router.dart';
import 'home_page/home_page.dart';
import 'infinite_scroll_page/infinite_scroll_page.dart';

class HomeRoute {
  static const homePath = "/";
  static const infiniteScrollPath = "/infinite";

  static List<AppPage> route() {
    return [
      AppPage(
        path: homePath,
        builder: (context, args) => const HomePage(),
      ),
      AppPage(
        path: infiniteScrollPath,
        builder: (context, args) => const InfiniteScrollPage(),
      )
    ];
  }
}
