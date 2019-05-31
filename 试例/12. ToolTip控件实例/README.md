### 轻量级操作提示

* 其实Flutter中有很多提示控件,比如Dialog、Snackbar和BottomSheet这些操作都是比较重量级的，存在屏幕上的时间较长或者会直接打断用户的操作
* 当然我并不是说这些控件不好，根据需求的不同，要有多种选择，所以才会给大家讲一下轻量级操作提示Tooltip
* Tooltip是继承于StatefulWidget的一个Widget，它并不需要调出方法，当用户长按被Tooltip包裹的Widget时，会自动弹出相应的操作提示

* main.dart文件
* 这节课就用最简单代码给大家做一个轻量级提示案例出来。入口文件代码如下：

```dart
import 'package:flutter/material.dart';
import 'tool_tips_demo.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Demo',
      theme:ThemeData.light(),
      home: ToolTipDemo(),
    );
  }
}
```

* tool_tips_demo.dart文件
* 这个文件主要的用途就是承载轻提示控件，代码如下：

```dart
import 'package:flutter/material.dart';

class ToolTipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('tool tips demo')),
      body:Center(
        child: Tooltip(
          message: '不要碰我，我怕痒',
          child: Icon(Icons.all_inclusive),
        ),
      )
    );
  }
}
```