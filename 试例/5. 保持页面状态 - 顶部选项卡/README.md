### With 关键字的使用

* with是dart的关键字，意思是混入的意思，就是说可以将一个或者多个类的功能添加到自己的类无需继承这些类， 避免多重继承导致的问题
* 比如下面的代码：

```dart
class _KeepAliveDemoState extends State<KeepAliveDemo> with SingleTickerProviderStateMixin {

}
```

* 需要注意的是with后边是Mixin，而不是普通的Widget，这个初学者比较爱犯错误

### TabBar Widget的使用

* TabBar是切换组件，它需要设置两个属性
    * controller: 控制器，后边跟的多是TabController组件
    * tabs：具体切换项，是一个数组，里边放的也是Tab Widget

```dart
bottom:TabBar(
  controller: _controller,
  tabs:[
    Tab(icon:Icon(Icons.directions_car)),
    Tab(icon:Icon(Icons.directions_transit)),
    Tab(icon:Icon(Icons.directions_bike)),
  ],
)
```

### 基本页面布局

* 我们先把入口页面布局好

```dart
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:KeepAliveDemo()
    );
  }
} 

class KeepAliveDemo extends StatefulWidget {
  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}
/*
with是dart的关键字，意思是混入的意思，
就是说可以将一个或者多个类的功能添加到自己的类无需继承这些类，
避免多重继承导致的问题。
SingleTickerProviderStateMixin 主要是我们初始化TabController时，
需要用到vsync ，垂直属性，然后传递this
*/
class _KeepAliveDemoState extends State<KeepAliveDemo> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState(){
    super.initState();
    _controller = TabController(length:3, vsync: this);
  }

  //重写被释放的方法，只释放TabController
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Keep Alive Demo'),
        bottom:TabBar(
          controller: _controller,
          tabs:[
            Tab(icon:Icon(Icons.directions_car)),
            Tab(icon:Icon(Icons.directions_transit)),
            Tab(icon:Icon(Icons.directions_bike)),
          ],
        )
      ),
      body:TabBarView(
        controller: _controller,
        children: <Widget>[
         Text('1111'),
         Text('2222'),
         Text('3333')
        ],
      )
    );
  }
}
```

* 我这里就直接贴出代码了，知识点我已经在代码中写了注释
* 如果小伙伴们对代码有什么不了解的，可以私信，我来进行解答。

```dart
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//混入AutomaticKeepAliveClientMixin，这是保持状态的关键
//然后重写wantKeppAlive 的值为true
class _MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin {
  int _counter = 0;
  //重写keepAlive 为ture ，就是可以有记忆功能了
  @override
  bool get wantKeepAlive => true;
  //声明一个内部方法，用来点击按钮后增加数量
  void _incrementCounter(){
    setState((){ _counter++;});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('点一下加1，点一下加1:'),
            Text(
              '$_counter',
              style:Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      //增加一个悬浮按钮，点击时触犯_incrementCounter方法
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
```

* 写完这个Widget，然后在入口文件中引入。
* `import 'keep_alive_demo.dart';`
* 然后把Body区域改成我们刚写的MyHomePage Widget 就可以了，注意是改三个