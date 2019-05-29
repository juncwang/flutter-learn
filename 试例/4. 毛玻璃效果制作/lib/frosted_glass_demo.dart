import 'package:flutter/material.dart';

// 使用过滤去组件需要引入的头文件
import 'dart:ui';

class FrostedClassDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // 约束盒子组件, 添加额外的约束条件 child 上
          ConstrainedBox(
            // 约束条件 : 盒子约束, 随着 child 的组件进行扩展
            constraints: const BoxConstraints.expand(),
            child: Image.network('http://d.5857.com/dlrb_170526/001.jpg'),
          ),
          Center(
            // 可裁切的矩形
            child: ClipRect(
              // 背景过滤器
              child: BackdropFilter(
                // 图片过滤器
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                // 透明组件
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 420.0,
                    height: 900.0,
                    decoration: BoxDecoration(
                      // 盒子修饰器
                      color: Colors.grey.shade200,
                    ),
                    child: Center(
                      child: Text(
                        'Hello World',
                        // 使用字体皮肤修饰器
                        style: Theme.of(context).textTheme.display3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}