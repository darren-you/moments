import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:moments/enumm/color_enum.dart';

import 'view/painter.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          const SizedBox(height: 50),
          _noteItemWidget(1),
          _noteItemWidget(2),
          _noteItemWidget(3),
          _noteItemWidget(4),
          _noteItemWidget(5),
          _noteItemWidget(6),
          _noteItemWidget(7),
          _noteItemWidget(8),
          _noteItemWidget(9),
          _noteItemWidget(10),
          _noteItemWidget(11),
          _noteItemWidget(12),
          Container(
            // width: context.width,
            height: 50,
            color: Colors.white,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text('版权所有©️2022-2024 网站备案号：蜀ICP备12332121号')],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _noteItemWidget(int month) {
  return Container(
    height: 300,
    //color: color,
    child: Row(
      children: [
        Container(
          width: 155,
          //color: Colors.amber,
          color: MyColors.background.color,
          child: Stack(
            children: [
              /// 竖直细线
              Positioned(
                left: 34.5,
                child: Container(
                  alignment: Alignment.center,
                  width: 1,
                  height: 400,
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),

              Positioned(
                left: 16,
                top: 125,
                child: Container(
                  width: 139,
                  height: 38,
                  //color: Colors.red,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 19,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: 120,
                          height: 38,
                          //color: Colors.white,
                          child: Row(
                            children: [
                              Container(
                                width: 35,
                                height: 1,
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 38,
                                //color: Colors.amber,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 50,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Text(
                                    '$month月',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                width: 35,
                                height: 1,
                                color: Colors.grey.withOpacity(0.3),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (DateTime.now().month == month)
                        Container(
                          width: 38,
                          height: 38,
                          padding: const EdgeInsets.all(8),
                          color: Colors.transparent,
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: MyColors.background.color,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: CustomPaint(
                              painter: RingPainter(
                                strokeWidth: 6.0, // 圆环的宽度
                                insideColor: const Color(0xFFF6C543), // 内部圆环的颜色
                              ),
                              size: const Size(50.0, 50.0), // 设置绘制区域的大小
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 20, right: 34.5, bottom: 20),
            child: Container(
              height: 320,
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 320,
                    height: 320,
                    margin: EdgeInsets.only(right: 20),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 160,
                          width: 320,
                          color: Colors.blue,
                          child: ExtendedImage.network(
                            "https://darrenyou.cn/wejinda/res/img/swiper_${index + 1}.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: 320,
                          //color: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 8),
                          child: const Text(
                            ' Flutter中使用canvas绘制贝塞尔曲线',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, bottom: 8),
                          child: const Text(
                            '贝塞尔曲线（Bézier curve）是一种通过给定的控制点来定义的数学曲线，广泛应用于计算机图形学、动画、几何建模等领域。贝塞尔曲线由法国工程师皮埃尔·贝塞尔（Pierre Bézier）在20世纪60年代为汽车设计而开发，后来被广泛应用于计算机图形学中。',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
