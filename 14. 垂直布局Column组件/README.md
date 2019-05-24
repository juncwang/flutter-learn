##### Column基本用法

* 写一段代码，在column里加入三行文字，然后看一下效果

```dart
import 'package:flutter/material.dart';
void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context ){
      return MaterialApp(
        title:'ListView widget',
      
        home:Scaffold(
          appBar:new AppBar(
            title:new Text('垂直方向布局'),
          ),
          body:Column(
            children: <Widget>[
             Text('I am JSPang'),
             Text('my website is jspang.com'),
             Text('I love coding')
            ],
          )
        ),
      );
  }
}
```
* 这时候你会发现文字是以最长的一段文字居中对齐的，看起来很别扭。那如果想让文字以左边开始对齐，只需要加入一个对齐属性

* 左对齐只要在column组件下加入下面的代码，就可以让文字左对齐。
* crossAxisAlignment: CrossAxisAlignment.start,
    * CrossAxisAlignment.star：居左对齐。
    * CrossAxisAlignment.end：居右对齐。
    * CrossAxisAlignment.center：居中对齐。

##### 主轴和副轴的辨识

* 在设置对齐方式的时候你会发现右mainAxisAlignment属性，意思就是主轴对齐方式
    * main轴：如果你用column组件，那垂直就是主轴，如果你用Row组件，那水平就是主轴。
    * cross轴：cross轴我们称为幅轴，是和主轴垂直的方向。比如Row组件，那垂直就是幅轴，Column组件的幅轴就是水平方向的。
* 主轴和幅轴我们搞清楚，才能在实际工作中随心所欲的进行布局。

* 比如现在我们要把上面的代码，改成垂直方向居中。因为用的是Column组件，所以就是主轴方向，这时候你要用的就是主轴对齐了
* mainAxisAlignment: MainAxisAlignment.center,
* 现在全部的代码如下：

```dart
import 'package:flutter/material.dart';
void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context ){
      return MaterialApp(
        title:'ListView widget',
        
        home:Scaffold(
          appBar:new AppBar(
            title:new Text('垂直方向布局'),
          ),
          body:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             Text('I am JSPang'),
             Text('my website is jspang.com'),
             Text('I love coding')
            ],
          )
        ),
      );
  }
}
```

##### 水平方向相对屏幕居中

* 让文字相对于水平方向居中加入Center组件

```dart
import 'package:flutter/material.dart';
void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context ){
      return MaterialApp(
        title:'ListView widget',
        
        home:Scaffold(
          appBar:new AppBar(
            title:new Text('垂直方向布局'),
          ),
          body:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Center(child:Text('I am JSPang')),
             Center(child:Text('my website is jspang.com')),
             Center(child:Text('I love coding'))
            ],
          )
        ),
      );
  }
}
```

##### Expanded属性的使用

* 其实在学习水平布局的时候我们对Expanded有了深刻的理解，它就是灵活布局。比如我们想让中间区域变大，而头部区域和底部根据文字所占空间进行显示。

```dart
body:Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Center(child:Text('I am JSPang')),
    Expanded(child:Center(child:Text('my website is jspang.com'))),
    Center(child:Text('I love coding'))
  ],
)
```