import 'package:flutter/material.dart';

import 'pages/home_screen.dart';
import 'pages/email_screen.dart';
import 'pages/pages_screen.dart';
import 'pages/airplay_screen.dart';

// 定义一个 有 state 状态的 widget
class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {

  // 定义颜色
  final _BottomNavigationColor = Colors.blue;
  // 定义当前激活 item 位置
  int _currentIndex = 0;
  // 定义页面数组
  List<Widget> list = List();

  // 重写 initState 方法
  @override
  void initState(){
    // 把需要加载的页面放到页面数组中
    list
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(AirplayScreen());
    
    // 调用父类的 initState 方法
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 返回一个页面脚手架
    return Scaffold(
      // 页面内容使用页面数组的内容
      body: list[_currentIndex],
      // 定义底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        // 定义底部选项卡的动画类型
        type: BottomNavigationBarType.fixed,
        // 当前激活的页面
        currentIndex: _currentIndex,
        // 底部点击事件, index 点击的哪一个
        onTap: (int index){
          // 使用 index 设置当前的状态
          // 设置完成后, 页面会根据更改的状态自动更新
          setState(() {
            _currentIndex = index;
          });
        },
        // 被选中的 item 颜色 (如果在 item 中设置后将失效)
        selectedItemColor: Colors.indigo,
        // 未被选中的 item 颜色 (如果在 item 中设置后将失效)
        unselectedItemColor: Colors.orange,
        // 被选中的 item 字体大小 (如果在 item 中设置 type - fixed 生效)
        selectedFontSize: 12,
        // 未被选中的 item 字体大小 (如果在 item 中设置 type - fixed 生效)
        unselectedFontSize: 12,
        // 底部项目组
        items: [
          // 底部按钮项目
          BottomNavigationBarItem(
            // 按钮的图标及颜色
            icon: Icon(
              Icons.home,
              color: _BottomNavigationColor,
            ),
            // 按钮的文字及颜色
            title: Text(
              "Home",
              style: TextStyle(
                color: _BottomNavigationColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _BottomNavigationColor,
            ),
            title: Text(
              "Email",
              style: TextStyle(
                color: _BottomNavigationColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: _BottomNavigationColor,
            ),
            title: Text(
              "Pages",
              style: TextStyle(
                color: _BottomNavigationColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color: _BottomNavigationColor,
            ),
            title: Text(
              "Airplay",
              style: TextStyle(
                color: _BottomNavigationColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}