import 'package:flutter/material.dart';

// 单个闭合展开案例
class ExpansionTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionTileDemo'),
      ),
      body: Center(
        // 闭合组件
        child: ExpansionTile(
          // 未打开时的标题
          title: Text('Expansion Tile Demo'),
          // 头部显示的内容
          leading: Icon(Icons.ac_unit),
          // 打开后的背景颜色
          backgroundColor: Colors.white12,
          children: <Widget>[
            ListTile(
              title: Text('list tile'),
              subtitle: Text('subtitle'),
            ),
          ],
          // 默认是否为打开状态, 默认为 false
          initiallyExpanded: true,
        ),
      ),
    );
  }
}