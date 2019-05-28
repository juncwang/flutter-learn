import 'package:flutter/material.dart';

import 'bottom_appBar_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter bottomNavigationBar',
      // App 主题颜色
      theme: ThemeData(
        // 定义完成的颜色, 可以选择使用
        primarySwatch: Colors.red,
      ),
      // 自定义组件
      home: BottomAppBarDemo(),
    );
  }
}