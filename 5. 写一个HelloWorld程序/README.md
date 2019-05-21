### HelloWorld整体代码

* 这段代码写在根目录\lib\main.dart文件中，这就是Flutter主文件
```dart
import 'package:flutter/material.dart';
//主函数（入口函数），下面我会简单说说Dart的函数
void main() =>runApp(MyApp());
// 声明MyApp类
class MyApp extends StatelessWidget{
  //重写build方法
  @override
  Widget build(BuildContext context){
    //返回一个Material风格的组件
   return MaterialApp(
      title:'Welcome to Flutteraa',
      home:Scaffold(
        //创建一个Bar，并添加文本
        appBar:AppBar(
          title:Text('Welcome to Flutter'),
        ),
        //在主体的中间区域，添加一个hello world 的文本
        body:Center(
          child:Text('Hello World'),
        ),
      ),
    );
  }
}
```
* 写完后打开终端，运行flutter run,等待一小会，就会看到虚拟机中显示了Hello World的内容
* 也许你对上面的语法还不够了解，但你不必惊慌，我们会一点点进行说明，那先来看一下Dart中的函数

### Dart语法Function函数
* Dart是面向对象的语言，即使是函数也是对象，并且属于Function类型的对象。这意味着函数可以分配给变量或作为参数传递给其他函数。当然你也可以像JavaScript一样，调用一个函数
* 比如我们写Hello World中的第2行，就是一个函数
* `void main() =>runApp(MyApp());`
* 因为这个函数体里只有一行代码，所以可以直接使用=>来省略{}，只有函数体里只有一行时，才可以使用，否则请使用大括号

### StatefulWidget和StatelessWidget

* StatefulWidget : 具有可变状态的窗口部件，也就是你在使用应用的时候就可以随时变化
* StatelessWidget : 不可变状态窗口部件，也就是你在使用时不可以改变，比如固定的文字

# VSCode中如何热加载

* r 键：点击后热加载，也就算是重新加载吧。
* p 键：显示网格，这个可以很好的掌握布局情况，工作中很有用。
* o 键：切换android和ios的预览模式。
* q 键：退出调试预览模式。

* 如果你觉的这太麻烦了，我们可以开启Debug模式，这时就可以实现真正的热加载了