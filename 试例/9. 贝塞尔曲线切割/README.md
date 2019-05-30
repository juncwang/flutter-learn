### 去掉DeBug图标

* 在我们进行编写代码预览时，有一Debug的图标一直在屏幕上，确实不太美观，其实只要语句代码就可以去掉的
* `debugShowCheckedModeBanner: false,`
* 这个代码要配置在主入口文件里，全部代码如下

```dart
import 'package:flutter/material.dart';
import 'custom_clipper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:HomePage()
    );
  }
}
```

### ClipPath 路径裁切控件

* clipPath控件可以把其内部的子控件切割，它有两个主要属性（参数）:
    * child :要切割的元素，可以是容器，图片.....
    * clipper : 切割的路径，这个要和CustomClipper对象配合使用

```dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          ClipPath(
            clipper:BottomClipper(),
            child: Container(
              color:Colors.deepPurpleAccent,
              height: 200.0,
            ),
          )
        ],
      )
    );
  }
}
```

* 在Scaffold里放置了一个列容器，然后把ClipPath控件放到了里边，ClipPath的子元素是一个容器控件Container。BootomClipper是我们自定义的一个对象，里边主要就是切割的路径

### CustomClipper 裁切路径

* 我们主要的贝塞尔曲线路径就写在getClip方法里，它返回一段路径。
* 一个二阶的贝塞尔曲线是需要控制点和终点的，控制点就像一块磁铁，把直线吸引过去，形成一个完美的弧度，这个弧度就是贝塞尔曲线了。
* 我们先来熟悉一下裁切路径和贝塞尔曲线，作一个最简单的贝塞尔曲线出来。

全部代码如下：

```dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          ClipPath(
            clipper:BottomClipper(),
            child: Container(
              color:Colors.deepPurpleAccent,
              height: 200.0,
            ),
          )
        ],
      )
    );
  }
}

class BottomClipperTest extends CustomClipper<Path>{
  @override
    Path getClip(Size size) {
      // TODO: implement getClip
      var path = Path();
      path.lineTo(0, 0);
      path.lineTo(0, size.height-30);
      var firstControlPoint =Offset(size.width/2,size.height);
      var firstEndPoint = Offset(size.width,size.height-30);

      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

      path.lineTo(size.width, size.height-30);
      path.lineTo(size.width, 0);
    
      return path;

    }
    @override
      bool shouldReclip(CustomClipper<Path> oldClipper) {
        // TODO: implement shouldReclip
        return false;
      }

}
```

### 多个贝塞尔曲线

* 作一个波浪形的贝塞尔裁切

```dart
class BottomClipper extends CustomClipper<Path>{
  @override
    Path getClip(Size size) {
      // TODO: implement getClip
      var path = Path();
      path.lineTo(0, size.height-20);
      var firstControlPoint =Offset(size.width/4,size.height);
      var firstEndPoint = Offset(size.width/2.25,size.height-30);

      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

      var secondControlPoint = Offset(size.width/4*3,size.height-80);
      var secondEndPoint = Offset(size.width,size.height-40);

      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

      path.lineTo(size.width, size.height-40);
      path.lineTo(size.width, 0);

      return path;

    }
    @override
      bool shouldReclip(CustomClipper<Path> oldClipper) {
        // TODO: implement shouldReclip
        return false;
      }

}
```
