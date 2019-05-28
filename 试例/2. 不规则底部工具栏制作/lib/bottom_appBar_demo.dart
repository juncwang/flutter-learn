import 'package:flutter/material.dart';

import 'each_view.dart';

class BottomAppBarDemo extends StatefulWidget {
  @override
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {

  List<Widget> _eachView;
  int _index = 0;
  
  @override
  void initState() { 
    super.initState();

    _eachView = List();
    _eachView..add(EachView('Home'))..add(EachView('Wang'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_index],
      // 可交互的浮动按钮
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context){
              return EachView('New page');
            }
          ));
        },
        // 长按时显示提示
        tooltip: 'JuncWang',
        // 内部使用图标
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      // 定义 可交互浮动按钮的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // 把底部导航栏位置 使用 底部工具栏
      bottomNavigationBar: BottomAppBar(
        // 定义底部颜色
        color: Colors.red,
        // 融合缺口, 需要与 floatingActionButton 融合
        // CircularNotchedRectangle 圆形缺口组件
        shape: CircularNotchedRectangle(),
        child: Row(
          // 主轴可占用的空间
          mainAxisSize: MainAxisSize.max,
          // 主轴对其方式
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // 图标按钮
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: (){
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.airport_shuttle),
              color: Colors.white,
              onPressed: (){
                setState(() {
                  _index = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}