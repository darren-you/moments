import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../services/app_init_service.dart';
import '../utils/routes_util.dart';

class RoutingCallbackListener {
  // 路由监听
  static Function(Routing?)? routingListner = (routing) {
    logger.i('上级页面: ${routing?.previous}');
    logger.i('当前页面: ${routing?.current}');
    logger.i('路由传参: ${routing?.args}');

    // 跳转到其他页面时，初始化状态栏、导航栏
    if (routing?.previous == RoutesPath.navPage) {
      if (Platform.isAndroid) {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ));
      } else if (Platform.isIOS) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
          statusBarIconBrightness: Brightness.dark,
        ));
      }
    }

    switch (routing?.current) {
      case RoutesPath.navPage:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          logger.i('UI更新后执行 >');
        });
        break;
    }
  };
}
