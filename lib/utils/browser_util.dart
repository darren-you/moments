import 'dart:html';
import 'package:flutter/material.dart';
import 'package:moments/enumm/color_enum.dart';

import '../services/app_init_service.dart';

class BrowserUtil {
  BrowserUtil._();

  static final data = window.navigator;

  static Map<String, dynamic> getBrowserInfo() {
    final deviceData = {
      "appCodeName": data.appCodeName,
      "appName": data.appName,
      "appVersion": data.appVersion,
      "deviceMemory": data.deviceMemory,
      "language": data.language,
      "languages": data.languages,
      "platform": data.platform,
      "product": data.product,
      "productSub": data.productSub,
      "userAgent": data.userAgent,
      "vendor": data.vendor,
      "vendorSub": data.vendorSub,
      "hardwareConcurrency": data.hardwareConcurrency,
      "maxTouchPoints": data.maxTouchPoints,
    };

    logger.d('WebBrowserInfo: $deviceData');

    return deviceData;
  }

  // Mac

  /// Mac中Chrome
  static bool isMacChromeBrowser() {
    return data.platform.toString().contains('Mac') &&
        data.vendor.toString().contains("Google");
  }

  /// Mac中Safari
  static bool isMacSafariBrowser() {
    return data.platform.toString().contains('Mac') &&
        data.vendor.toString().contains("Apple Computer") &&
        data.userAgent.toString().contains("Safari");
  }

  // iPhone

  /// iPhone中微信内置浏览器
  static bool isiPhoneWeChatBrowser() {
    return data.platform.toString().contains('iPhone') &&
        data.userAgent.toString().contains("MicroMessenger");
  }

  /// iPhone中Safari浏览器
  static bool isiPhoneSafariBrowser() {
    return data.platform.toString().contains('iPhone') &&
        data.userAgent.toString().contains("Safari");
  }

  // Android

  /// Android中微信内置浏览器

  /// 浏览器顶部导航栏颜色
  static Color browerTopNavColor() {
    Color color = Colors.white;

    if (isMacChromeBrowser()) color = Colors.white;
    if (isMacSafariBrowser()) color = MyColors.macSafariTopNavColor.color;
    if (isiPhoneWeChatBrowser()) color = MyColors.iphoneWeChatTopNavColor.color;
    if (isiPhoneSafariBrowser()) color = MyColors.iphoneSafariTopNavColor.color;

    return color;
  }
}
