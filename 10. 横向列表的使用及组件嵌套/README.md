##### 横向列表的使用

* 已经对ListView有了清楚的认识，也做出了普通的纵向（竖向列表）。这节课我们看看横向列表如何使用。其实还是使用我们的ListView组件，只是在ListView组件里加一个ScrollDirection属性。

##### 制作横向列表

* 这个我们先来看效果，然后再具体讲解使用方法:

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
            height:200.0,
            child:new ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                new Container(
                  width:180.0,
                  color: Colors.lightBlue,
                ), new Container(
                  width:180.0,
                  color: Colors.amber,
                ), new Container(
                  width:180.0,
                  color: Colors.deepOrange,
                ),new Container(
                  width:180.0,
                  color: Colors.deepPurpleAccent,
                ),
              ],
            )
          ),
          ),
        ),
      );
  }
}
```

* 我们先是加入了Center组件，作用是让我们的横向列表可以居中到屏幕的中间位置
* 然后在center组件的下面加入了Container容器组件，并设置了容器组件的高是200
* 在容器组件里我们加入了ListView组件，然后设置了组件的scrollDirection属性
* 然后再ListView的子组件里加入了Container容器组件，然后设置了不同颜色

##### scrollDirection属性
* ListView组件的scrollDirection属性只有两个值，一个是横向滚动，一个是纵向滚动。默认的就是垂直滚动，所以如果是垂直滚动
    * Axis.horizontal:横向滚动或者叫水平方向滚动。
    * Axis.vertical:纵向滚动或者叫垂直方向滚动


##### 组件嵌套

* 现在把列表组件独立定义成一个类，然后我们再加入到主组件中
* 我们声明一个MyList的类，然后把嵌套的代码放到这个类里,代码如下。

```dart
class MyList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Container(
            width:180.0,
            color: Colors.lightBlue,
          ), new Container(
            width:180.0,
            color: Colors.amber,
          ), new Container(
            width:180.0,
            color: Colors.deepOrange,
          ),new Container(
            width:180.0,
            color: Colors.deepPurpleAccent,
          ),
        ],
    );
  }
}
```

* 然后再MyAPP类里直接使用这个类，这样就减少了嵌套

```dart
import 'package:flutter/material.dart';
void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context ){
      return MaterialApp(
        title:'ListView widget',
        home:Scaffold(
          body:Center(
          child:Container(
            height:200.0,
            child:MyList()
            ),
          ),
        ),
      );
  }
}


class MyList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Container(
            width:180.0,
            color: Colors.lightBlue,
          ), new Container(
            width:180.0,
            color: Colors.amber,
          ), new Container(
            width:180.0,
            color: Colors.deepOrange,
          ),new Container(
            width:180.0,
            color: Colors.deepPurpleAccent,
          ),
        ],
    );
  }
}
```
