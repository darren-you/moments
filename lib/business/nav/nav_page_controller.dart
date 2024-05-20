import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavPageController extends GetxController {
  var hoverMenuIndex = (-1).obs;
  var selectMenuIndex = 0.obs;

  final PageController pageController = PageController(initialPage: 0);

  final menuTitle = [
    '简记',
    '作品',
  ];

  // Deawer
  ScrollController scrollController = ScrollController();
  var offset = 0.0.obs;
  var userBgPicScale = 1.0.obs; // 图片放大倍数

  void hoverMenu(int index) {
    hoverMenuIndex.value = index;
  }

  void selectMenu(int index) {
    selectMenuIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 1500),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  /// 设置背景图片随，滚动的的放大倍数
  void _setScale(double offset) {
    if (offset < 0) {
      final scale = 1 + offset.abs() / 300;
      userBgPicScale.value = scale.clamp(1, 3).toDouble();
    }
  }

  @override
  void onReady() {
    super.onReady();
    scrollController.addListener(() {
      offset.value = scrollController.offset;
      // debugPrint('offset: > > > ${offset.value}}');
      _setScale(offset.value);
      // debugPrint('滑动偏差: ${offset.value}');
    });
  }
}
