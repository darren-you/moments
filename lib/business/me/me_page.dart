import 'dart:ui';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.only(left: 16, top: 66, right: 16, bottom: 16),
      //color: Colors.amber,
      child: ListView(
        children: [
          _bgWidget(),
          //_bgPureWidget(),
          _contentWidget(),
        ],
      ),
    );
  }
}

Widget _bgWidget() {
  return SizedBox.expand(
      child: Stack(
    children: [
      SizedBox.expand(
        child: Container(
          padding: const EdgeInsets.only(top: 50, bottom: 50),
          child: ExtendedImage.network(
            "https://singlestep.cn/onestep/file/me.jpeg",
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox.expand(
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Opacity(
              opacity: 0.3,
              child: Container(
                decoration: BoxDecoration(
                    //color: Colors.grey,
                    color: Colors.black87.withOpacity(0.8)),
              ),
            ),
          ),
        ),
      ),
    ],
  ));
}

Widget _bgPureWidget() {
  return SizedBox.expand(
    child: Container(color: Colors.white),
  );
}

Widget _contentWidget() {
  return Container(
    padding: const EdgeInsets.only(left: 16, top: 66, right: 16, bottom: 16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: ExtendedImage.network(
                  "https://singlestep.cn/onestep/file/me.jpeg",
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'DarrenYou',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '向往着做一个有情怀的科技爱好者',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _sportItemWidget('公路车'),
                  const SizedBox(width: 16),
                  _sportItemWidget('羽毛球'),
                  const SizedBox(width: 16),
                  _sportItemWidget('音乐'),
                  const SizedBox(width: 16),
                  _sportItemWidget('电影'),
                  const SizedBox(width: 16),
                  _sportItemWidget('摄影'),
                  const SizedBox(width: 16),
                  _sportItemWidget('美术展'),
                ],
              ),
              const SizedBox(height: 32),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Github: darren-you',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(width: 32),
                  Text(
                    '小红书: DarrenYou',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(width: 32),
                  Text(
                    '公众号: 游同学',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget _sportItemWidget(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.white60.withOpacity(0.2),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    ),
  );
}
