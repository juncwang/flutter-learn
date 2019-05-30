### ExpansionTile组件

* ExpansionTile Widget就是一个可以展开闭合的组件，常用的属性有如下几个。
    * title:闭合时显示的标题，这个部分经常使用Text Widget。
    * leading:标题左侧图标，多是用来修饰，让界面显得美观。
    * backgroundColor: 展开时的背景颜色，当然也是有过度动画的，效果非常好。
    * children: 子元素，是一个数组，可以放入多个元素。
    * trailing ： 右侧的箭头，你可以自行替换但是我觉的很少替换，因为谷歌已经表现的很完美了。
    * initiallyExpanded: 初始状态是否展开，为true时，是展开，默认为false，是不展开

### main.dart入口文件

```dart
import 'package:flutter/material.dart';
import 'expansion_tile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Demo',
      theme: new ThemeData.dark(),
      home:ExpansionTileDemo()
    );
  }
}
```

### expansion_tile.dart 扩展组件

* 代码如下:

```dart
import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('expansion tile demo')),
      body:Center(
        child: ExpansionTile(
          title:Text('Expansion Tile'),
          leading:Icon(Icons.ac_unit),
          backgroundColor: Colors.white12,
          children: <Widget>[
            ListTile(
              title:Text('list tile'),
              subtitle:Text('subtitle')
            )
          ],
          initiallyExpanded: true,
        )
      )
    );
  }
}
```

### ExpansionPanelList 常用属性

* expansionCallback:点击和交互的回掉事件，有两个参数，第一个是触发动作的索引，第二个是布尔类型的触发值。
* children:列表的子元素，里边多是一个List数组。

### ExpandStateBean 自定义类

* 为了方便管理制作了一个ExpandStateBean类，里边就是两个状态，一个是是否展开isOpen,另一个索引值。代码如下:

```dart
class ExpandStateBean{
  var isOpen;
  var index;
  ExpandStateBean(this.index,this.isOpen);
}
```

### expansion_panel_list.dart

```dart
import 'package:flutter/material.dart';

class ExpansionPanelListDemo extends StatefulWidget {
  _ExpansionPanelListDemoState createState() => _ExpansionPanelListDemoState();
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  var currentPanelIndex = -1;
  List<int> mList;   //组成一个int类型数组，用来控制索引
  List<ExpandStateBean> expandStateList;    //开展开的状态列表， ExpandStateBean是自定义的类
  //构造方法，调用这个类的时候自动执行
  _ExpansionPanelListDemoState(){
    mList = new List(); 
    expandStateList = new List();
    //便利为两个List进行赋值
    for(int i=0;i<10;i++){
      mList.add(i);
      expandStateList.add(ExpandStateBean(i,false));
    }
  }
   //修改展开与闭合的内部方法
  _setCurrentIndex(int index, isExpand){
    setState(() {
          //遍历可展开状态列表
          expandStateList.forEach((item){
            if(item.index==index){
              //取反，经典取反方法
              item.isOpen = !isExpand;
            }
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("expansion panel list")
      ),
      //加入可滚动组件
      body:SingleChildScrollView(
        child: ExpansionPanelList(
          //交互回掉属性，里边是个匿名函数
          expansionCallback: (index,bol){
            //调用内部方法
            _setCurrentIndex(index, bol);
          },
          children: mList.map((index){//进行map操作，然后用toList再次组成List
            return ExpansionPanel(
              headerBuilder: (context,isExpanded){
                return ListTile(
                  title:Text('This is No. $index')
                );
              },
              body:ListTile(
                title:Text('expansion no.$index')
              ),
              isExpanded: expandStateList[index].isOpen
            );
          }).toList(),
        ),
      )

    );
  }
}
//自定义扩展状态类
class ExpandStateBean{
  var isOpen;
  var index;
  ExpandStateBean(this.index,this.isOpen);
}
```