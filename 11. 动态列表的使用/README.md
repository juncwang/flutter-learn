##### List类型的使用

* List是Dart的集合类型之一,其实你可以把它简单理解为数组，其他语言也都有这个类型。它的声明有几种方式：
    * var myList = List(): 非固定长度的声明。
    * var myList = List(2): 固定长度的声明。
    * var myList= List<String>():固定类型的声明方式。
    * var myList = [1,2,3]: 对List直接赋值。
* 直接用List中的generate方法进行生产List里的元素。最后的结果是生产了一个带值的List变量

```dart
void main () => runApp(MyApp(
  items: new List<String>.generate(1000, (i)=> "Item $i")
));
```
* 说明:在main函数的runApp中调用了MyApp类，再使用类的使用传递了一个items参数,并使用generate生成器对items进行赋值。
* generate方法传递两个参数，第一个参数是生成的个数，第二个是方法。

##### 接受参数

* 我们已经传递了参数，那MyApp这个类是需要接收的。

```dart
final List<String> items;
 MyApp({Key key, @required this.items}):super(key:key);
```

* 这是一个构造函数，除了Key，我们增加了一个必传参数，这里的@required意思就必传。:super如果父类没有无名无参数的默认构造函数，则子类必须手动调用一个父类构造函数。
* 这样我们就可以接收一个传递过来的参数了，当然我们要事先进行声明

##### 动态列表 ListView.builder()

* 接受了值之后，就可以直接调用动态列表进行生成了。具体代码如下：

```dart
import 'package:flutter/material.dart';
void main () => runApp(MyApp(
  items: new List<String>.generate(1000, (i)=> "Item $i")
));

class MyApp extends StatelessWidget{

  final List<String> items;
  MyApp({Key key, @required this.items}):super(key:key);
  @override
  Widget build(BuildContext context ){
      return MaterialApp(
        title:'ListView widget',
        home:Scaffold(
          body:new ListView.builder(
            itemCount:items.length,
            itemBuilder:(context,index){
              return new ListTile(
                title:new Text('${items[index]}'),
              );
            }
          )
        ),
      );
  }
}
```

* 现在我们可以启动虚拟机来查看，我们的列表的效果了。这个就是工作中我们常使用的列表的方式