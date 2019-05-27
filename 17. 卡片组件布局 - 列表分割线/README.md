### 卡片组件布局 - 列表分割线

* Flutter还有一种比较比较酷炫的布局方式，我称它为卡片式布局。这种布局类似ViewList，但是列表会以物理卡片的形态进行展示
* 比如我们现在要开发一个类似收获地址的列表，并且列表外部使用一个卡片式布局。
* 卡片式布局默认是撑满整个外部容器的，如果你想设置卡片的宽高，需要在外部容器就进行制定
* 代码中使用了一个垂直布局组件Column组件，然后利用了ListTile实现内部列表，这里需要说明的是ListTile不光可以使用在ListView组件中

```dart
import 'package:flutter/material.dart';
void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context ){
      var card = new Card(
         child: Column(
           children: <Widget>[
             ListTile(
               title:new Text('吉林省吉林市昌邑区',style: TextStyle(fontWeight: FontWeight.w500),),
               subtitle: new Text('技术胖:1513938888'),
               leading: new Icon(Icons.account_box,color: Colors.lightBlue,),
             ),
             // 分割线
             new Divider(),
              ListTile(
               title:new Text('北京市海淀区中国科技大学',style: TextStyle(fontWeight: FontWeight.w500),),
               subtitle: new Text('胜宏宇:1513938888'),
               leading: new Icon(Icons.account_box,color: Colors.lightBlue,),
             ),
             new Divider(),
              ListTile(
               title:new Text('河南省濮阳市百姓办公楼',style: TextStyle(fontWeight: FontWeight.w500),),
               subtitle: new Text('JSPang:1513938888'),
               leading: new Icon(Icons.account_box,color: Colors.lightBlue,),
             ),
             new Divider(),
             
           ],
         ),
      
      );


      return MaterialApp(
        title:'ListView widget',
        home:Scaffold(
          appBar:new AppBar(
            title:new Text('卡片布局'),
          ),
          body:Center(child:card),
        ),
      );
  }
}
```