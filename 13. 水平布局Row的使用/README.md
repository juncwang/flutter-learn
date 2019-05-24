##### 不灵水平布局

* 从字面上就可以理解到，不灵活就是根据Row子元素的大小，进行布局。如果子元素不足，它会留有空隙，如果子元素超出，它会警告
* 比如现在我们要制作三个按钮，并让三个按钮同时在一排。我们写下了如下代码，但你会发现效果并不理想。

```dart
import 'package:flutter/material.dart';
void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context ){
      return MaterialApp(
        title:'ListView widget',
      
        home:Scaffold(
          appBar:new AppBar(
            title:new Text('水平方向布局'),
          ),
          body:new Row(
            children: <Widget>[
              new RaisedButton(
                onPressed: (){
                  
                },
                color:Colors.redAccent,
                child:new Text('红色按钮')
              ),
              new RaisedButton(
                onPressed: (){
               
                },
                color:Colors.orangeAccent,
                child: new Text('黄色按钮'),
              ),  
              new RaisedButton(
                onPressed: (){
                 
                },
                color:Colors.pinkAccent,
                child:new Text('粉色按钮')
              )
            ],
          )
        ),
      );
  }
}
```

* 这时候你会发现的页面已经有了三个按钮，但这三个按钮并没有充满一行，而是出现了空隙。这就是不灵活横向排列造成的。它根据子元素的大小来进行排列

##### 灵活水平布局
* 解决上面有空隙的问题，可以使用 Expanded来进行解决，也就是我们说的灵活布局。我们在按钮的外边加入Expanded就可以

```dart
import 'package:flutter/material.dart';
void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context ){
      return MaterialApp(
        title:'ListView widget',
      
        home:Scaffold(
          appBar:new AppBar(
            title:new Text('水平方向布局'),
          ),
          body:new Row(
            children: <Widget>[
              Expanded(child:new RaisedButton(
                onPressed: (){         
                },
                color:Colors.redAccent,
                child:new Text('红色按钮')
              )),
              Expanded(child:new RaisedButton(
                onPressed: (){
                  },
                  color:Colors.orangeAccent,
                  child: new Text('黄色按钮'),
                )
              
              ),
              Expanded(child:new RaisedButton(
                onPressed: (){
                },
                color:Colors.pinkAccent,
                child:new Text('粉色按钮')
              )             
              )
            ],
          )
        ),
      );
  }
}
```

* 这时候就可以布满一行了

##### 灵活和不灵活的混用

* 如果这时候想让中间的按钮大，而两边的按钮保持真实大小，就可以不灵活和灵活模式进行混用，实现效果

```dart
import 'package:flutter/material.dart';
void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context ){
      return MaterialApp(
        title:'ListView widget',
      
        home:Scaffold(
          appBar:new AppBar(
            title:new Text('水平方向布局'),
          ),
          body:new Row(
            children: <Widget>[
             new RaisedButton(
                onPressed: (){
                  
                },
                color:Colors.redAccent,
                child:new Text('红色按钮')
            ),
            Expanded(child:new RaisedButton(
                onPressed: (){
                   
                  },
                  color:Colors.orangeAccent,
                  child: new Text('黄色按钮'),
                )
              
              ),
            new RaisedButton(
                onPressed: (){
                },
                color:Colors.pinkAccent,
                child:new Text('粉色按钮')
              )
            ],
          )
        ),
      );
  }
}
```