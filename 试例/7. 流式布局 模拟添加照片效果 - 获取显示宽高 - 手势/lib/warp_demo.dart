import 'package:flutter/material.dart';

class WarpDemo extends StatefulWidget {
  @override
  _WarpDemoState createState() => _WarpDemoState();
}

class _WarpDemoState extends State<WarpDemo> {

  List<Widget> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 初始化 widget 列表
    list = List<Widget>()..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {

    // 获取设备的宽度
    final width = MediaQuery.of(context).size.width;
    // 获取设备的高度
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Warp Demo'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height/2,
            color: Colors.grey,
            // wrap 流布局
            child: Wrap(
              children: list,
              spacing: 0.0,
            ),
          ),
        ),
      ),
    );
  }

  // 返回一个带手势的 container
  Widget buildAddButton(){
    // 手势组件 可以给没有事件的组件添加事件 onXxxxx
    return GestureDetector(
      onTap: (){
        if(list.length < 9){
          setState(() {
            list.insert(0, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  // 照片组件
  Widget buildPhoto(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.amber,
        child: Center(
          child: Text('照片'),
        ),
      ),
    );
  }
}

