### 自定义主题样本

* Flutter支持自定义主题，如果使用自定义主题，设置的内容项是非常多的，这可能让初学者头疼，Flutter贴心的为给我们准备了主题样本
* primarySwatch ：现在支持18种主题样本了
* 具体代码如下：

```dart
theme: ThemeData(
  primarySwatch: Colors.lightBlue,
),
```

* 会了这个知识后，我们就可以先把我们的主入口文件编写一下了，具体代码如下：

```dart
import 'package:flutter/material.dart';
import 'bottom_appBar_demo.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Demo',
theme: ThemeData(
  primarySwatch: Colors.lightBlue,
),
      home:BottomAppBarDemo(),
    );
  }
}
```

* 这时候bottom_appBar_demo.dart这个文件还没有，也找不到，这个文件是我们的主要文件，我们的主要业务逻辑会写在这个文件里
* 因为没有所以你写完之后会报错，那接下来我们就来编写这个文件

### floatingActionButton Widget

* `floatingActionButton`工作中我们通常简称它为“FAB”，也许只是我们公司这样称呼，从字面理解可以看出，它是“可交互的浮动按钮”
* 一般来说，它是一个圆形，中间放着图标，会优先显示在其他Widget的前面
* 下面我们来看看它的常用属性:
    * onPressed ：点击相应事件，最常用的一个属性
    * tooltip：长按显示的提示文字
    * child ：放置子元素，一般放置Icon Widget
* 我们来看一下floatingActionButton的主要代码:

```dart
floatingActionButton: FloatingActionButton(
    onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context){
        return EachView('New Page');
      }));
    },
    tooltip: 'Increment',
    child: Icon(
      Icons.add,
      color: Colors.white,
    ),
  ),
```

* 写完这些代码已经有了一个悬浮的按钮，但这个悬浮按钮还没有和低栏进行融合，这时候需要一个属性。
* `floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,`
* 这时候就可以和底栏进行融合了

### BottomAppBar Widget

* BottomAppBar 是底部工具栏的意思，这个要比BottomNavigationBar widget灵活很多，可以放置文字和图标，当然也可以放置容器
* BottomAppBar的常用属性:
    * color:底部工具栏的颜色
    * shape:设置底栏的形状，一般使用这个都是为了和floatingActionButton融合，所以使用的值都是CircularNotchedRectangle(),有缺口的圆形矩形
    * child:里边可以放置大部分Widget，让我们随心所欲的设计底栏

* 主要代码：

```dart
import 'package:flutter/material.dart';

class BottomAppBarDemo extends StatefulWidget {
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
          
          },
          tooltip: 'Increment',
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       bottomNavigationBar: BottomAppBar(
         color:Colors.lightBlue,
         shape:CircularNotchedRectangle(),
         child: Row(
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: <Widget>[
             IconButton(
               icon:Icon(Icons.home),
               color:Colors.white,
               onPressed:(){
                
               }
             ),
             IconButton(
               icon:Icon(Icons.airport_shuttle),
               color:Colors.white,
               onPressed:(){
                 
               }
             ),
           ],
         ),
       )
        ,
     );
  }
}
```

### StatefulWidget子页面的制作

* 写一个继承于StatefulWidget的控件
* 新建一个each_view.dart文件，然后输入如下代码：

```dart
import 'package:flutter/material.dart';

class EachView extends StatefulWidget {
  String _title;
  EachView(this._title);
  @override
  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text(widget._title)),
      body: Center(child:Text(widget._title)),
    );
  }
}
```

* 代码中设置了一个内部的_title变量，这个变量是从主页面传递过来的，然后根据传递过来的具体值显示在APP的标题栏和屏幕中间

### 按钮交互效果的制作

* 这些效果都是在bottom_appBar_demo.dart页面完成的
* 首先我们需要引入新作的子页面each_view.dart
* `import 'each_view.dart';`
* 新建两个变量,主要作用是控制body中的试图，也就是显示不同的子页面
* `List<Widget> _eachView;  //创建视图数组`
* `int _index = 0;          //数组索引，通过改变索引值改变视图`

* 下一步是为_eachView进行初始化赋值，我们可以直接重写初始化方法，具体代码如下：

```dart
  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      _eachView = List();
      _eachView..add(EachView('Home'))..add(EachView('Me'));
    }
```

* 剩下的就是写个个按钮的交互事件，交互的动作分两种：
* 直接打开子导航，比如我们点击了中间的”+“按钮，我们直接开启子页面
```dart
onPressed: (){
    Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context){
      return EachView('New Page');
    }));
  },
```

* 改变状态，通过改变状态，来切换页面，这样我们整体页面并没有被刷新

```dart
onPressed:(){
  setState(() {
    _index=0;             
  });
}
```

* 代码如下:

```dart
import 'package:flutter/material.dart';
import 'each_view.dart';

class BottomAppBarDemo extends StatefulWidget {
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  List<Widget> _eachView;  //创建视图数组
  int _index = 0;          //数组索引，通过改变索引值改变视图

  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      _eachView = List();
      _eachView..add(EachView('Home'))..add(EachView('Me'));
    }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body:_eachView[_index],
        floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context){
            return EachView('New Page');
          }));
        },
          tooltip: 'Increment',
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       bottomNavigationBar: BottomAppBar(
         color:Colors.lightBlue,
         shape:CircularNotchedRectangle(),
         child: Row(
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: <Widget>[
             IconButton(
               icon:Icon(Icons.home),
               color:Colors.white,
                onPressed:(){
                  setState(() {
                    _index=0;             
                  });
                }
             ),
             IconButton(
               icon:Icon(Icons.airport_shuttle),
               color:Colors.white,
               onPressed:(){
                 setState(() {
                    _index=1;             
                 });
               }
             ),
           ],
         ),
       )
        ,
     );
  }
}
```