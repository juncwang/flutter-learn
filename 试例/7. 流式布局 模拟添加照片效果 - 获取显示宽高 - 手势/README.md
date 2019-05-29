### mediaQuery 媒体查询

* 使用meidaQuery可以很容易的得到屏幕的宽和高，得到宽和高的代码如下：

```dart
final width = MediaQuery.of(context).size.width;
final height = MediaQuery.of(context).size.height;
```

### Wrap流式布局

* Flutter中流式布局大概有三种常用方法，这节课先学一下Wrap的流式布局。有的小伙伴会说Wrap中的流式布局可以用Flow很轻松的实现出来，但是Wrap更多的式在使用了Flex中的一些概念，某种意义上说式跟Row、Column更加相似的
* 单行的Wrap跟Row表现几乎一致，单列的Wrap则跟Column表现几乎一致。但Row与Column都是单行单列的，Wrap则突破了这个限制，mainAxis上空间不足时，则向crossAxis上去扩展显示。
* 从效率上讲，Flow肯定会比Wrap高，但Wrap使用起来会更方便一些。

### GestureDetector 手势操作

* GestureDetector它式一个Widget，但没有任何的显示功能，而只是一个手势操作，用来触发事件的。虽然很多Button组件是有触发事件的，比如点击，但是也有一些组件是没有触发事件的，比如：Padding、Container、Center这时候我们想让它有触发事件就需要再它们的外层增加一个GestureDetector，比如我们让Padding有触发事件

```dart
Widget buildAddButton(){
    return  GestureDetector(
      onTap:(){
        if(list.length<9){
          setState(() {
                list.insert(list.length-1,buildPhoto());
          });
        }
      },
      child: Padding(
        padding:const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
  ```

### 入口文件

* 入口文件很简单，就是引用了warp_demo.dart文件，然后再home属性中使用了WarpDemo，代码如下：

```dart
import 'package:flutter/material.dart';
import 'warp_demo.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData.dark(),
      home:WarpDemo()
    );
  }
}
```

### warp_demo.dart

* 主要的文件代码我就列在下面了

```dart
import 'package:flutter/material.dart';

//继承与动态组件
class WarpDemo extends StatefulWidget {
  _WarpDemoState createState() => _WarpDemoState();
}

class _WarpDemoState extends State<WarpDemo> {
  List<Widget> list;  //声明一个list数组

  @override
  //初始化状态，给list添加值，这时候调用了一个自定义方法`buildAddButton`
  void initState() { 
    super.initState();
    list = List<Widget>()..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    //得到屏幕的高度和宽度，用来设置Container的宽和高
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap流式布局'),
      ),
      body:Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height/2,
            color: Colors.grey,
            child: Wrap(    //流式布局，
              children: list,
              spacing: 26.0,  //设置间距
            ),
          ),
        ),
      )
    );
  }

  Widget buildAddButton(){
    //返回一个手势Widget，只用用于显示事件
    return  GestureDetector(
      onTap:(){
        if(list.length<9){
          setState(() {
                list.insert(list.length-1,buildPhoto());
          });
        }
      },
      child: Padding(
        padding:const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPhoto(){
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.amber,
          child: Center(
            child: Text('照片'),
          ),
        ),
    );
  }
}
```