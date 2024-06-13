import 'dart:ui';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moments/business/nav/nav_page_controller.dart';
import 'package:moments/business/note/note_page.dart';
import 'package:moments/business/products/products_page.dart';
import 'package:moments/components/keep_alive_wrapper.dart';
import 'package:moments/enumm/color_enum.dart';

import '../../utils/assert_util.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class NavPage extends GetView<NavPageController> {
  const NavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MyColors.background.color,
      drawer: _drawerWidget(context, controller),
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Stack(
          children: [
            /// 背景部分
            _bgWidget(context, controller),

            /// 导航条
            _topNavWidget(context, controller),

            /// 地步导航条
            //_bottomNavWidget(context, controller),
          ],
        ),
      ),
    );
  }
}

Widget _drawerWidget(BuildContext context, NavPageController controller) {
  return Drawer(
    backgroundColor: Colors.white,
    shape: CustomDrawerShape(),
    child: Stack(
      children: [
        _userBg(context, controller),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView(
              controller: controller.scrollController,
              physics: const AlwaysScrollableScrollPhysics(), // 这里设置滚动物理属性
              children: [
                // 用户信息
                _userLogined(context, controller),

                // 功能Item部分
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _bgWidget(BuildContext context, NavPageController controller) {
  return SizedBox.expand(
    child: PageView(
      controller: controller.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        KeepAliveWrapper(
          child: NotePage(),
        ),
        KeepAliveWrapper(
          child: ProductsPage(),
        ),
      ],
    ),
  );
}

Widget _topNavWidget(BuildContext context, NavPageController controller) {
  return Align(
    alignment: Alignment.topCenter,
    child: SizedBox(
      width: context.width,
      height: 50,
      child: Stack(
        children: [
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  width: context.width,
                  height: 50,
                  decoration: BoxDecoration(
                      //color: Colors.grey,
                      color: const Color(0xFFF3F3F6).withOpacity(0.5)),
                ),
              ),
            ),
          ),
          // Container(
          //   width: context.width,
          //   height: 50,
          //   decoration: const BoxDecoration(
          //       //color: Colors.grey,
          //       color: Color(0xFFFFFFFF)),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  scaffoldKey.currentState?.openDrawer();
                  //Scaffold.of(scaffoldKey.currentContext!).openDrawer();
                },
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Container(
                        width: 38,
                        height: 50,
                        margin: const EdgeInsets.only(left: 16),
                        padding: const EdgeInsets.only(top: 6, bottom: 6),
                        child: ClipOval(
                          child: ExtendedImage.network(
                            "https://darrenyou.cn/onestep/file/me.jpeg",
                            width: 38,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'DarrenYou',
                        style: TextStyle(
                          color: MyColors.textNavColor.color,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(child: SizedBox()),
              Row(
                children: [
                  _navMenuItem(0, controller),
                  _navMenuItem(1, controller),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _bottomNavWidget(BuildContext context, NavPageController controller) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: context.width,
      height: 50,
      color: Colors.white,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text('版权所有©️2022-2024 网站备案号：蜀ICP备12332121号')],
      ),
    ),
  );
}

Color _navTextColor(int index, NavPageController controller) {
  if (controller.hoverMenuIndex.value == index &&
      controller.selectMenuIndex.value != index) {
    return Colors.blue;
  } else if (controller.selectMenuIndex.value == index) {
    return Colors.white;
  } else {
    return MyColors.textNavColor.color;
  }
}

Widget _navMenuItem(int index, NavPageController controller) {
  return Obx(
    () => GestureDetector(
      onTap: () => controller.selectMenu(index),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
        decoration: BoxDecoration(
          color: controller.selectMenuIndex.value == index
              ? Colors.blue
              : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: MouseRegion(
          onEnter: (event) => controller.hoverMenu(index),
          onExit: (event) => controller.hoverMenu(-1),
          child: Text(
            controller.menuTitle[index],
            style: TextStyle(
              fontSize: 14,
              color: _navTextColor(index, controller),
            ),
          ),
        ),
      ),
    ),
  );
}

/// 用户背景图片
Widget _userBg(BuildContext context, NavPageController controller) {
  debugPrint("用户背景图片 ----------------重新绘制");
  return Obx(
    // Transform.translate offset实现背景图部分，与ListView同时发生移动
    () => Transform.translate(
      offset: Offset(
          0, controller.offset.value < 0 ? 0 : -(controller.offset.value)),
      child: Container(
        color: Colors.transparent,
        height: 200,
        width: context.width,
        child: Transform.scale(
          scale: controller.userBgPicScale.value,
          child: Stack(
            children: [
              Container(
                height: 199,
                width: context.width,
                child: ExtendedImage.network(
                  "https://darrenyou.cn/onestep/file/me.jpeg",
                  fit: BoxFit.cover,
                  cache: true,
                  //cancelToken: cancellationToken,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0, 1),
                    end: const Alignment(0, -0.2),
                    colors: [
                      //Colors.blue,
                      MyColors.background.color,
                      MyColors.background.color.withOpacity(0.6),
                      MyColors.background.color.withOpacity(0.0),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _userLogined(BuildContext context, NavPageController controller) {
  return SizedBox(
    height: 200,
    child: Column(
      children: [
        // 头像、性别、专业
        Container(
          margin: const EdgeInsets.only(top: 60),
          height: 60,
          child: Row(
            children: [
              // 头像
              SizedBox(
                width: 60,
                height: 60,
                child: ClipOval(
                  child: ExtendedImage.network(
                    "https://darrenyou.cn/onestep/file/me.jpeg",
                    fit: BoxFit.contain,
                    //mode: ExtendedImageMode.editor,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // 信息部分
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "DarrenYou",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //const SizedBox(height: 12),
                      Row(
                        children: [
                          // 性别
                          SvgPicture.asset(
                            AssertUtil.manSvg,
                            width: 26,
                            height: 26,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          // 专业
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                color: MyColors.cardGreen.color,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Text(
                              "Flutter",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            //color: Colors.amber,
            child: const Text(
              '向往着做一个科技爱好者\n🚴骑行、🏸羽毛球、📷摄影、🎨美术展',
              maxLines: 2,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class CustomDrawerShape extends RoundedRectangleBorder {
  CustomDrawerShape()
      : super(
          side: BorderSide.none, // 可以设置边框样式
          borderRadius: BorderRadius.circular(0.0),
        );
}
