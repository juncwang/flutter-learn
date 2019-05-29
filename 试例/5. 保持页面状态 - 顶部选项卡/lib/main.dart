import 'package:flutter/material.dart';
import 'keep_alive_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: KeepAliveDemo(),
    );
  }
}

class KeepAliveDemo extends StatefulWidget {
  @override
  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}

// with 表示混入其他类, dart 没有多继承, 所以使用 with 来实现
class _KeepAliveDemoState extends State<KeepAliveDemo> with SingleTickerProviderStateMixin {
  
  // 定义 tabBar 控制器
  TabController _controller;

  // 初始化方法
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化控制器 长度为 3 , 并与自身同步(需要 with SingleTickerProviderStateMixin)
    _controller = TabController(length: 3, vsync: this);
  }

  // 销毁方法
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keep Alive Demo'),
        // 头部的 tabBar
        bottom: TabBar(
          // 设置控制器
          controller: _controller,
          // tabBar 的内容
          tabs: <Widget>[
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
      ),
      // tabBar 的显示页面
      body: TabBarView(
        // 设置控制器
        controller: _controller,
        // 设置页面内容
        children: <Widget>[
          MyHomePage(),
          MyHomePage(),
          MyHomePage(),
        ],
      ),
    );
  }
}