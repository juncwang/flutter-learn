### 主入口方法

* 先编写一个主入口方法，还是最简单的格式，只不过home属性，使用的FirstPage的组件是我们自定义的，需要我们再次编写

```dart
import 'package:flutter/material.dart';
import 'pages.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:FirstPage()
    );
  }
}
```

### pages.dart页面的编写

* 主入口文件用import引入了pages.dart文件，这个文件就是生成了两个页面（Flutter里的页面也是Widget,这个你要跟网页区分开）
* pages.dart文件的代码如下

```dart
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar:AppBar(
        title:Text('FirstPage',style: TextStyle(fontSize: 36.0)),
        elevation: 0.0,
      ),
      body:Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_next,
            color:Colors.white,
            size:64.0,
          ),
          onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:(BuildContext context){
                     return SecondPage();
                  }));
          },
        ),
      )
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('SecondPage',style:TextStyle(fontSize:36.0),),
        backgroundColor: Colors.pinkAccent,
        leading:Container(),
        elevation: 0.0,
      ),
      body:Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color:Colors.white,
            size:64.0
          ),
          onPressed: ()=>Navigator.of(context).pop(),
        ),
      )
    );
  }
}
```

* AppBar Widger的 elevation 属性：这个值是AppBar 滚动时的融合程度，一般有滚动时默认是4.0，现在我们设置成0.0，就是和也main完全融合了

### 自定义CustomRoute Widget

* 新建一个custome_router.dart文件，这个就是要自定义的路由方法，自定义首先要继承于通用的路由的构造器类PageRouterBuilder。继承之后重写父类的CustomRoute构造方法
* 构造方法可以简单理解为：只要以调用这个类或者说是Widget，构造方法里的所有代码就执行了
* custome_router.dart代码如下

```dart
import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder{
  final Widget widget;
  CustomRoute(this.widget)
    :super(
      transitionDuration:const Duration(seconds:1),
      pageBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2){
          return widget;
        },
     transitionsBuilder:(
          BuildContext context,
          Animation<double> animation1,
          Animation<double> animation2,
          Widget child){
            return FadeTransition(
              opacity: Tween(begin:0.0,end :1.0).animate(CurvedAnimation(
                  parent:animation1,
                  curve:Curves.fastOutSlowIn
              )),
              child: child,
            );
        }  
      
    ); 
}
```

* FadeTransition:渐隐渐现过渡效果，主要设置opactiy（透明度）属性，值是0.0-1.0
    * animate :动画的样式，一般使用动画曲线组件（CurvedAnimation）
    * curve: 设置动画的节奏，也就是常说的曲线，Flutter准备了很多节奏，通过改变动画取消可以做出很多不同的效果
    * transitionDuration：设置动画持续的时间，建议再1和2之间

### 缩放路由动画

```dart
return ScaleTransition(
  scale:Tween(begin:0.0,end:1.0).animate(CurvedAnimation(
    parent:animation1,
    curve: Curves.fastOutSlowIn
    )),
    child:child
);
```

### 旋转+缩放路由动画

* 旋转+缩放的思路是在一个路由动画里的child属性里再加入一个动画，让两个动画同时执行。来看详细代码：

```dart
 return RotationTransition(
  turns:Tween(begin:0.0,end:1.0)
  .animate(CurvedAnimation(
    parent: animation1,
    curve: Curves.fastOutSlowIn
  )),
  child:ScaleTransition(
    scale:Tween(begin: 0.0,end:1.0)
    .animate(CurvedAnimation(
        parent: animation1,
        curve:Curves.fastOutSlowIn
    )),
    child: child,
  )
);
```

### 左右滑动路由动画

* 其实用的做多的还是左右滑动路由动画，其实实现起来也是非常简单，直接使用SlideTransition就可以了

```dart
// 幻灯片路由动画
return SlideTransition(
  position: Tween<Offset>(
    begin: Offset(-1.0, 0.0),
    end:Offset(0.0, 0.0)
  )
  .animate(CurvedAnimation(
    parent: animation1,
    curve: Curves.fastOutSlowIn
  )),
  child: child,
);
```