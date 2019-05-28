### 底部导航栏制作

##### 主入口文件的编写

* 首先我们先写一个主入口文件，这个文件只是简单的APP通用结构，最主要的是要引入自定义的`BottomNavigationWidget`组件

```dart
import 'package:flutter/material.dart';
import 'bottom_navigation_widget.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter bottomNavigationBar',
      theme:ThemeData.light(),
      home:BottomNavigationWidget()
    );
  }.
}
```

* 注意的是`BottomNaivgationWidget`这个组件还没有编写，所以现在会报错

##### StatefulWidget 讲解

* 在编写`BottomNaivgationWidget`组件前，我们需要简单了解一下什么是`StatefulWidget`
* `StatefulWidget`具有可变状态(state)的窗口组件（widget）。使用这个要根据变化状态，调整State值
* 在lib目录下，新建一个`bottom_navigation_widget.dart`文件
* 它的初始化和以前使用的`StatelessWidget`不同，我们在VSCode中直接使用快捷方式生成代码（直接在VSCode中输入stful）

```dart
class name extends StatefulWidget {
  _nameState createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: child,
    );
  }
}
```

* 上面的代码可以清楚的看到，使用`StatefulWidget`分为两个部分，第一个部分是继承与`StatefullWidget`，第二个部分是继承于`State`.其实`State`部分才是我们的重点，主要的代码都会写在`State`中

##### BottomNaivgationWidget自定义

* 接下来我们就要创建BottomNaivgationWidget这个Widget了，只是建立一个底部导航

```dart
import 'package:flutter/material.dart';


class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
     
       bottomNavigationBar: BottomNavigationBar(
         items: [
           BottomNavigationBarItem(
             icon:Icon(
               Icons.home,
               color:_BottomNavigationColor,
             ),
             title:Text(
               'Home',
               style:TextStyle(color:_BottomNavigationColor)
             )
           ),
           BottomNavigationBarItem(
             icon:Icon(
               Icons.email,
               color:_BottomNavigationColor,
             ),
             title:Text(
               'Email',
               style:TextStyle(color:_BottomNavigationColor)
             )
           ),
           BottomNavigationBarItem(
             icon:Icon(
               Icons.pages,
               color:_BottomNavigationColor,
             ),
             title:Text(
               'Pages',
               style:TextStyle(color:_BottomNavigationColor)
             )
           ),
           BottomNavigationBarItem(
             icon:Icon(
               Icons.airplay,
               color:_BottomNavigationColor,
             ),
             title:Text(
               'AipPlay',
               style:TextStyle(color:_BottomNavigationColor)
             )
           ),
         ],
         type:BottomNavigationBarType.fixed
       ),
     );
  }
}
```

*这时候我们就可以使用flutter run 来进行查看代码了，效果已经出现，在APP的页面上已经出现了一个底部导航栏，只不过现在还点击还没有什么效果

##### 子页面的编写

* 子页面我们就采用最简单的编写了，只放入一个AppBar和一个Center，然后用Text Widget表明即可
* 先来写一个HomeScreen组件，新建一个pages目录，然后在目录下面新建home_screen.dart文件

```dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('HOME'),
      ),
      body:Center(
        child: Text('HOME'),
      )
    );
  }
}
```

* 有了这个文件剩下的文件就可以复制粘贴，然后改少量的代码来完成了
* 分别建立:
    * email_screen.dart
    * pages_screen.dart
    * airplay_screen.dart
* 这些都是导航要用的子页面，有了这些页面，我们才能继续编写代码

##### 重写initState()方法

* 我们要重新initState()方法，把刚才做好的页面进行初始化到一个Widget数组中。有了数组就可以根据数组的索引来切换不同的页面了。这是现在几乎所有的APP采用的方式
* 代码如下:

```dart
 List<Widget> list = List();
 @override
 void initState(){
    list
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(AirplayScreen());
    super.initState();
  }
```

* 这里的..add()是Dart语言的..语法，如果你学过编程模式，你一定听说过建造者模式，简单来说就是返回调用者本身。这里list后用了..add()，还会返回list，然后就一直使用..语法，能一直想list里增加widget元素。 最后我们调用了一些父类的initState()方法

##### BottomNavigationBar里的响应事件

* `BottomNavigationBar`组件里提供了一个相应事件`onTap`，这个事件自带一个索引值`index`，通过索引值我们就可以和我们list里的索引值相对应了

```dart
onTap:(int index){
    setState((){
        _currentIndex= index;
    });
    },
```

* 现在给出全部的`bottom_navigation_widget.dart`的全部代码

```dart
import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/email_screen.dart';
import 'pages/pages_screen.dart';
import 'pages/airplay_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState(){
    list
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(AirplayScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: list[_currentIndex],
       bottomNavigationBar: BottomNavigationBar(
         items: [
           BottomNavigationBarItem(
             icon:Icon(
               Icons.home,
               color:_BottomNavigationColor,
             ),
             title:Text(
               'Home',
               style:TextStyle(color:_BottomNavigationColor)
             )
           ),
           BottomNavigationBarItem(
             icon:Icon(
               Icons.email,
               color:_BottomNavigationColor,
             ),
             title:Text(
               'Email',
               style:TextStyle(color:_BottomNavigationColor)
             )
           ),
           BottomNavigationBarItem(
             icon:Icon(
               Icons.pages,
               color:_BottomNavigationColor,
             ),
             title:Text(
               'Pages',
               style:TextStyle(color:_BottomNavigationColor)
             )
           ),
           BottomNavigationBarItem(
             icon:Icon(
               Icons.airplay,
               color:_BottomNavigationColor,
             ),
             title:Text(
               'AipPlay',
               style:TextStyle(color:_BottomNavigationColor)
             )
           ),
         ],
         currentIndex:_currentIndex,
         onTap:(int index){
           setState((){
             _currentIndex= index;
           });
         },
         type:BottomNavigationBarType.fixed
       ),
     );
  }
}
```
