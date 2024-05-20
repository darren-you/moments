import 'package:flutter/material.dart';

import 'package:logger/logger.dart';

final Logger logger = Logger();

class AppInitService {
  static Future<void> init() async {
    debugPrint('< < <   全局初始化 start...   > > >');
    // 初始化 WidgetsFlutterBinding
    WidgetsFlutterBinding.ensureInitialized();

    debugPrint('< < <   全局初始化 end...   > > >');
  }
}
