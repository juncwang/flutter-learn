### Cupertino UI

* 其实早都知道Flutter有两套UI模板，一套是material,另一套就是Cupertino。Cupertino主要针对的的就是IOS系统的UI，所以用的右滑返回上一级就是在这个Cupertino里

### Cupertino的引入方法

* 直接使用import引入就可以了，代码如下:
* `import 'package:flutter/cupertino.dart';`
* 引入了cupertino的包之后，就可以使用皮肤和交互效果的特性了。要用的右滑返回上一页也是皮肤的交互特性，直接使用就可以了

### CupertinoPageScaffold

* 这个和以前使用material的Scaffold类似，不过他里边的参数是child，例如下面的代码.

```dart
return CupertinoPageScaffold(
  child: Center(
    child: Container(
      height: 100.0,
      width:100.0,
      color: CupertinoColors.activeBlue,
      child: CupertinoButton(
        child: Icon(CupertinoIcons.add),
        onPressed: (){
          Navigator.of(context).push(
            CupertinoPageRoute(builder: (BuildContext context){
              return RightBackDemo();
            })
          );
        },
      ),
    ),
  ),
);
```

* 在Cupertino下也有很多Widget控件，他们都是以Cupertino开头的，这就让我们很好区分，当然两种皮肤是可以进行混用的

### 整个案例代码

* 这个案例就两个主要文件，main.dart和right_back_demo.dart，代码如下:

* main.dart文件代码

```dart
import 'package:flutter/material.dart';
import 'right_back_demo.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Demo',
      theme:ThemeData(primarySwatch: Colors.blue),
      home: RightBackDemo(),
    );
  }
}
```

* right_back_demo。dart文件

```dart
import 'package:flutter/cupertino.dart'; 

class RightBackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Container(
          height: 100.0,
          width:100.0,
          color: CupertinoColors.activeBlue,
          child: CupertinoButton(
            child: Icon(CupertinoIcons.add),
            onPressed: (){
              Navigator.of(context).push(
                CupertinoPageRoute(builder: (BuildContext context){
                  return RightBackDemo();
                })
              );
            },
          ),
        ),
      ),
    );
  }
}
```

* 其实只要使用CupertinoPageRoute打开的子页面，就可以实现右滑返回上一级。所以整个案例并不难。希望小伙伴们有所收获