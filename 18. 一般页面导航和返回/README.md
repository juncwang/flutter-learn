### RaisedButton按钮组件

* 它有两个最基本的属性：
    * child：可以放入容器，图标，文字。让你构建多彩的按钮。
    * onPressed：点击事件的相应，一般会调用Navigator组件。
    * 我们在作页面导航时，大量的使用了RaisedButton组件，这个组件的使用在实际工作中用的也比较多

### Navigator.push 和 Navigator.pop

* Navigator.push：是跳转到下一个页面，它要接受两个参数一个是上下文context，另一个是要跳转的函数
* Navigator.pop：是返回到上一个页面，使用时传递一个context（上下文）参数，使用时要注意的是，你必须是有上级页面的，也就是说上级页面使用了Navigator.push

### 写一个Demo
* 我们现在就来作一个简单的案例，我们打开一个页面，页面上只有一个简单的按钮，按钮写着“查看商品详情页面”，然后点击后进入下一个页面，页面有一个按钮，可以直接返回

```dart
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title:'导航演示1',
    home:new FirstScreen()
  ));
}

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(title:Text('导航页面')),
      body:Center(
        child:RaisedButton(
          child:Text('查看商品详情页面'),
          onPressed: (){
            Navigator.push(context,new  MaterialPageRoute(
              builder:(context) =>new SecondScreen())
            );
          },
        )
      )
    );
  }
}

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(title:Text('技术胖商品详情页')),
      body:Center(child:RaisedButton(
        child:RaisedButton(
          child:Text('返回'),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ))
    );
    
  }
}


```