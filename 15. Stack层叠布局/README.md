##### 层叠布局的 alignment 属性

* alignment属性是控制层叠的位置的，建议在两个内容进行层叠时使用。它有两个值X轴距离和Y轴距离，值是从0到1的，都是从上层容器的左上角开始算起的。
* alignment: const FractionalOffset(0.5, 0.8) 

##### CircleAvatar组件的使用

* CircleAvatar这个经常用来作头像的，组件里边有个radius的值可以设置图片的弧度。
* 现在我们准备放入一个图像，然后把弧度设置成100，形成一个漂亮的圆形

```dart
new CircleAvatar(
  backgroundImage: new NetworkImage('http://jspang.com/static//myimg/blogtouxiang.jpg'),
  radius: 100.0,
),
```
##### 效果代码

* 想布局出这个效果还是比较容易的

```dart
import 'package:flutter/material.dart';
void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context ){
      var stack = new Stack(
        alignment: const FractionalOffset(0.5, 0.8),
        children: <Widget>[
          new CircleAvatar(
            backgroundImage: new NetworkImage('http://jspang.com/static//myimg/blogtouxiang.jpg'),
            radius: 100.0,
          ),
          new Container(
            decoration: new BoxDecoration(
              color: Colors.lightBlue,
            ),
            padding: EdgeInsets.all(5.0),
            child: new Text('JSPang 技术胖'),
          )
        ],
      );


      return MaterialApp(
        title:'ListView widget',
        
        home:Scaffold(
          appBar:new AppBar(
            title:new Text('垂直方向布局'),
          ),
          body:Center(child:stack),
        ),
      );
  }
}
```