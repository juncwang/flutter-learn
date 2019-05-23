### Container容器组件的使用

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

##### padding属性

* padding的属性就是一个内边距，指的是Container边缘和child内容的距离

```dart
child:Container(
  child:new Text('Hello JSPang',style: TextStyle(fontSize: 40.0),),
  alignment: Alignment.topLeft,
  width:500.0,
  height:400.0,
  color: Colors.lightBlue,
  padding:const EdgeInsets.all(10.0),
),
```
* 上面主要的padding代码就一句。
* `padding:const EdgeInsets.all(10.0),`
* 这句的意思是设置Container的内边距是10，左右上下全部为10
* `EdgeInsets.fromLTRB(value1,value2,value3,value4)`
* 我们用EdgeInsets.fromLTRB可以满足我们的需求，LTRB分别代表左、上、右、下。
* 那我们设置上边距为30，左边距为10，就可以用下面的代码来编写。
* `padding:const EdgeInsets.fromLTRB(10.0,30.0,0.0,0.0),`

##### margin属性

* margin是外边距，只的是container和外部元素的距离。
* 现在要把container的外边距设置为10个单位，代码如下:

```dart
child:Container(
  child:new Text('Hello JSPang',style: TextStyle(fontSize: 40.0),),
  alignment: Alignment.topLeft,
  width:500.0,
  height:400.0,
  color: Colors.lightBlue,
  padding:const EdgeInsets.fromLTRB(10.0,30.0,0.0,0.0),
  margin: const EdgeInsets.all(10.0),
),
```

##### decoration属性

* decoration是 container 的修饰器，主要的功能是设置背景和边框
* 比如你需要给背景加入一个渐变，这时候需要使用BoxDecoration这个类，代码如下（需要注意的是如果你设置了decoration，就不要再设置color属性了，因为这样会冲突）

```dart
child:Container(
  child:new Text('Hello JSPang',style: TextStyle(fontSize: 40.0),),
  alignment: Alignment.topLeft,
  width:500.0,
  height:400.0,
  padding:const EdgeInsets.fromLTRB(10.0,30.0,0.0,0.0),
  margin: const EdgeInsets.all(10.0),
  decoration:new BoxDecoration(
    gradient:const LinearGradient(
      colors:[Colors.lightBlue,Colors.greenAccent,Colors.purple]
    )
  ),
),
```
* 上面的代码去掉了color的设置，这时候container的背景就变成了渐变颜色

##### 设置边框

* 设置边框可以在decoration里设置border属性，比如你现在要设置一个红色边框，宽度为2。代码如下：

```dart
child:Container(
  child:new Text('Hello JSPang',style: TextStyle(fontSize: 40.0),),
  alignment: Alignment.topLeft,
  width:500.0,
  height:400.0,
  padding:const EdgeInsets.fromLTRB(10.0,30.0,0.0,0.0),
  margin: const EdgeInsets.all(10.0),
  decoration:new BoxDecoration(
    gradient:const LinearGradient(
      colors:[Colors.lightBlue,Colors.greenAccent,Colors.purple]
    ),
    border:Border.all(width:2.0,color:Colors.red)
  ),
),
```
* 关键代码其实就是：
* `border:Border.all(width:2.0,color:Colors.red)`
* 这时候就有了边框显示

* 为容器定义边框圆角
* `borderRadius: BorderRadius.circular(10.0),`

##### 完整代码
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
            alignment: Alignment.topLeft,
            width:500.0,
            height:400.0,
            padding:const EdgeInsets.fromLTRB(10.0,30.0,0.0,0.0),
            margin: const EdgeInsets.all(10.0),
            decoration:new BoxDecoration(
              gradient:const LinearGradient(
                colors:[Colors.lightBlue,Colors.greenAccent,Colors.purple]
              ),
              border:Border.all(width:2.0,color:Colors.red),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          ),
        ),
      );
  }
}
```