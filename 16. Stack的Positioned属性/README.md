##### Stack的Positioned属性

* Positioned组件也叫做层叠定位组件

##### Positioned组件的属性

* bottom: 距离层叠组件下边的距离
* left：距离层叠组件左边的距离
* top：距离层叠组件上边的距离
* right：距离层叠组件右边的距离
* width: 层叠定位组件的宽度
* height: 层叠定位组件的高度
* child: 子组件

* Demo实例

* 文字直接放入到Positioned里，并且不再是两个组件，而是三个子组件

```dart
import 'package:flutter/material.dart';
void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context ){
      var stack = new Stack(
        
        children: <Widget>[
          new CircleAvatar(
            backgroundImage: new NetworkImage('http://jspang.com/static//myimg/blogtouxiang.jpg'),
            radius: 100.0,
          ),
          new Positioned(
            top:10.0,
            left:10.0,
            child: new Text('JSPang.com'),
          ),
          new Positioned(
            bottom:10.0,
            right:10.0,
            child: new Text('技术胖'),
          )
        ],
      );


      return MaterialApp(
        title:'ListView widget',
        home:Scaffold(
          appBar:new AppBar(
            title:new Text('层叠布局'),
          ),
          body:Center(child:stack),
        ),
      );
  }
}
```
