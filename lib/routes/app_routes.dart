import 'package:get/get.dart';
import 'package:moments/business/nav/nav_page.dart';

import '../business/nav/nav_page_controller.dart';
import '../utils/routes_util.dart';

class AppPages {
  static List<GetPage<dynamic>>? appRoutes = [
    /// 主页导航页
    GetPage(
      name: RoutesPath.navPage,
      page: () => const NavPage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => NavPageController());
        },
      ),
    ),
  ];
}
