import 'package:flutter/material.dart';

import 'bottom_navigation_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter bottomNavigationBar',
      // App 主题颜色
      theme: ThemeData.light(),
      // 自定义组件
      home: BottomNavigationWidget()
    );
  }
}