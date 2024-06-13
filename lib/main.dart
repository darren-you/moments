import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'routes/app_routes.dart';
import 'routes/routing_callback_listener.dart';
import 'utils/routes_util.dart';

/// Web 打包指令
///flutter build web --web-renderer canvaskit --release --base-href "/darren-you/"
///若是主站不需要 base-href
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      primaryColor: Colors.white, // 设置主颜色
      platform: TargetPlatform.iOS,
    );

    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          // navigatorKey: Toast.navigatorKey, //加上此配置
          //navigatorObservers: [FlutterSmartDialog.observer],
          // Dialog 初始化
          builder: FlutterSmartDialog.init(),
          initialRoute: RoutesPath.navPage,
          getPages: AppPages.appRoutes,
          defaultTransition: Transition.native, // 页面跳转默认动画
          routingCallback: RoutingCallbackListener.routingListner,
          theme: themeData,
          debugShowCheckedModeBanner: false,
          scrollBehavior: MyBehavior(),
        );
      },
    );
  }
}

class MyBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
