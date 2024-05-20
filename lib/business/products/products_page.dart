import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'products_page_controller.dart';

class ProductsPage extends GetView<ProductsPageController> {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 66, right: 16, bottom: 66),
      //color: Colors.pink,
      child: Center(
        child: GestureDetector(
          onTap: () async {
            final Uri _url =
                Uri.parse('https://mp.weixin.qq.com/s/ADFQrvrQbUU2LiXNP1OSKQ');
            await launchUrl(_url);
          },
          child: Text('Url launcher'),
        ),
      ),
    );
  }
}
