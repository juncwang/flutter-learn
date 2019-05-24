##### ListView的声明

* 这就是一个最基本的机构

```dart
import 'package:flutter/material.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'JSPang Flutter Demo',
      home:Scaffold(
        appBar:new AppBar(
          title:new Text('ListView Widget')
        ),
        body: new Text('ListView Text')
      ),
    );
  }
}
```

* 有了最基本的结构后，就可以加入ListView组件

```dart
body: new ListView(
  children:<Widget>[
    new ListTile(
      leading:new Icon(Icons.access_time),
      title:new Text('access_time')
    )
  ]
),
```

* 我们使用了ListView，然后在他的内部children中，使用了widget数组，因为是一个列表，所以它接受一个数组，然后有使用了listTite组件（列表瓦片），在组件中放置了图标和文字
* 当然我们还可以多加入几行列表，比如我们再加入一行

```dart
body: new ListView(
  children:<Widget>[
    new ListTile(
      leading:new Icon(Icons.access_time),
      title:new Text('access_time')
    ),
    new ListTile(
      leading:new Icon(Icons.account_balance),
      title:new Text('account_balance')
    ),
  ]
),
```

##### 图片列表的使用

```dart
body: new ListView(
  children:<Widget>[
   new Image.network(
      'http://jspang.com/static/upload/20181111/G-wj-ZQuocWlYOHM6MT2Hbh5.jpg'
    ),
     new Image.network(
      'http://jspang.com/static/upload/20181109/1bHNoNGpZjyriCNcvqdKo3s6.jpg'
    ),
     new Image.network(
      'http://jspang.com/static/myimg/typescript_banner.jpg'
    ),new Image.network(
      'http://jspang.com/static/myimg/smile-vue.jpg'
    )
    
  ]
),
```