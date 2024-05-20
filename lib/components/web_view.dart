import 'dart:html';
import 'dart:ui_web';

import 'package:flutter/material.dart';

class IframeWebDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IframeWebDemoState();
}

class _IframeWebDemoState extends State<IframeWebDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "iframe测试",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: _buildIframeWidget("https://www.jianshu.com/p/04db6e341150"),
    );
  }

  Widget _buildIframeWidget(String url) {
    // var platformViewRegistry = PlatformViewRegistry();
    //注册
    platformViewRegistry.registerViewFactory("iframe-webview", (_) {
      // 2. 创建自己的iframe组件，并设置参数，宽高和加载的url等
      return IFrameElement()
        ..style.height = '100%'
        ..style.width = '100%'
        ..src = url
        ..style.border = 'none';
    });

    // 3. 设置组件所占大小，并创建HtmlElementView
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: HtmlElementView(
          viewType: "iframe-webview",
          onPlatformViewCreated: (int id) {
            // 组件创建回调
          },
        ));
  }
}
