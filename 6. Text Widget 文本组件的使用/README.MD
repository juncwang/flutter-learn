### Text Widget 文本组件的使用

* 代码演示 `main-demo01.dart`

##### TextAlign属性

* TextAlign属性就是文本的对齐方式:
    * center: 文本以居中形式对齐,这个也算比较常用的了。
    * left:左对齐，经常使用，让文本居左进行对齐，效果和start一样。
    * right :右对齐，使用频率也不算高。
    * start:以开始位置进行对齐，类似于左对齐。
    * end: 以为本结尾处进行对齐，不常用。有点类似右对齐.
    * 总结起来，也就算三个对齐方式，left(左对齐)、center（居中对齐）、right（右对齐）。我们来看一下具体代码
```dart
child:Text(
  'Hello JSPang  ,非常喜欢前端，并且愿意为此奋斗一生。我希望可以出1000集免费教程。',
  textAlign:TextAlign.left,
)
```

##### maxLines属性

* 设置最多显示的行数，比如我们现在只显示1行，类似一个新闻列表的题目。代码如下
```dart
child:Text(
  'Hello JSPang  ,非常喜欢前端，并且愿意为此奋斗一生。我希望可以出1000集免费教程。',
  textAlign:TextAlign.left,
  maxLines: 1,
)
```
* 设置好后，文字只能显示出1行了

##### overflow属性

* overflow属性是用来设置文本溢出时，如何处理,它有下面几个常用的值供我们选择
    * clip:直接切断，剩下的文字就没有了，感觉不太友好，体验性不好
    * ellipsis:在后边显示省略号，体验性较好，这个在工作中经常使用
    * fade: 溢出的部分会进行一个渐变消失的效果，当然是上线的渐变，不是左右的哦

##### style属性

* style属性的内容比较多，具体的你可以查一下API，我这里带作一个效果，方便大家快速学会Style的用法

* 我们下面要作的效果为，字体大小为25.0,颜色为粉红色,并且有一个下划线

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
child:Text(
  'Hello JSPang  ,非常喜欢前端，并且愿意为此奋斗一生。我希望可以出1000集免费教程。',
  textAlign:TextAlign.left,
  overflow:TextOverflow.ellipsis,
  maxLines: 1,
  style: TextStyle(
    fontSize:25.0,
    color:Color.fromARGB(255, 255, 150, 150),
    decoration:TextDecoration.underline,
    decorationStyle:TextDecorationStyle.solid,
  ),
)
          ),
        ),
      );
  }
}
```
* 更详细的属性资料可以参看这个网址：https://docs.flutter.io/flutter/painting/TextStyle-class.html