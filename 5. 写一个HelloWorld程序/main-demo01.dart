// 导入 flutter/materil.dart 库
// flutter 基础 UI 库
import 'package:flutter/material.dart';

// flutter 入口函数
void main() => runApp(MyApp());

// 声明一个类 并继承 StatelessWidget 类
// StatelessWidget 不可变状态窗口部件
// StatefulWidget 可变状态的窗口部件
class MyApp extends StatelessWidget {
  // 定义一个重写
  @override
  // 构建一个 widget 组件
  Widget build(BuildContext context) {
    //返回一个Material风格的组件
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
            //创建一个Bar，并添加文本
            appBar: AppBar(
              title: Text('Welcom to Flutter'),
            ),
            //在主体的中间区域，添加一个hello world 的文本
            body: Center(
              child: Text('Hello World')
            )
        )
    );
  }
}
