### Container容器组件的使用1

* Container（容器控件）在Flutter是经常使用的控件，它就相当于我们HTML里的<div>标签

##### Alignment属性

* 这个属性针对的是Container内child的对齐方式，也就是容器子内容的对齐方式，并不是容器本身的对齐方式

```dart
import 'package:flutter/material.dart';
void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context ){
      return MaterialApp(
        title:'Text widget',
        home:Scaffold(
          body:Center(
           child:Container(
             child:new Text('Hello JSPang',style: TextStyle(fontSize: 40.0),),
             alignment: Alignment.center,
           ),
          ),
        ),
      );
  }
}
```
* 对齐方式有如下几种：
    * bottomCenter:下部居中对齐。
    * botomLeft: 下部左对齐。
    * bottomRight：下部右对齐。
    * center：纵横双向居中对齐。
    * centerLeft：纵向居中横向居左对齐。
    * centerRight：纵向居中横向居右对齐。
    * topLeft：顶部左侧对齐。
    * topCenter：顶部居中对齐。
    * topRight： 顶部居左对齐。

##### 设置宽、高和颜色属性

* 设置宽、高和颜色属性是相对容易的，只要在属性名称后面加入浮点型数字就可以

```dart
child:Container(
  child:new Text('Hello JSPang',style: TextStyle(fontSize: 40.0),),
  alignment: Alignment.center,
  width:500.0,
  height:400.0,
  color: Colors.lightBlue,
),
```