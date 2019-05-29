### 主入口文件

* 这个还是继承StatelessWidget,然后在home属性中加入SearchBarDemo，这是一个自定义的Widget
* main.dart 文件的代码如下：

```dart
import 'package:flutter/material.dart';
import 'search_bar_demo.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Demo',
      theme: ThemeData.light(),
      home: SearchBarDemo()
    );
  }
}
```

### 数据文件 asset.dart

* asset.dart相当于数据文件，工作中这些数据是后台传递给我们，或者写成配置文件的，这里我们就以List的方式代替了。我们在这个文件中定义了两个List：
    * searchList : 这个相当于数据库中的数据，我们要在这里进行搜索。
    * recentSuggest ： 目前的推荐数据，就是搜索时，自动为我们进行推荐。
* 整体代码如下 ：

```dart
const searchList = [
  "jiejie-大长腿",
  "jiejie-水蛇腰",
  "gege1-帅气欧巴",
  "gege2-小鲜肉"
];

const recentSuggest = [
  "推荐-1",
  "推荐-2"
];
```

### AppBar的样式制作

* 第一个搜索界面布好

```dart
import 'package:flutter/material.dart';
import 'asset.dart';

class SearchBarDemo extends StatefulWidget {
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('SearchBarDemo'),
        actions:<Widget>[
          IconButton(
            icon:Icon(Icons.search),
            onPressed: (){
               print('开始搜索');
            }
          ),
        ]
      )
    );
  }
}
```

### searchBarDelegate 类

* 点击图标时执行searchBarDelegate 类，这个类继承与SearchDelegate类，继承后要重写里边的四个方法

### 重写buildActions方法：

* buildActions方法时搜索条右侧的按钮执行方法，我们在这里方法里放入一个clear图标。 当点击图片时，清空搜索的内容。

```dart
@override
List<Widget> buildActions(BuildContext context){
return [
    IconButton(
    icon:Icon(Icons.clear),
    onPressed: ()=>query = "",)
    ];
}
```

### buildLeading 方法重写

* 这个时搜索栏左侧的图标和功能的编写，这里我们才用AnimatedIcon，然后在点击时关闭整个搜索页面

```dart
@override
Widget buildLeading(BuildContext context) {
return IconButton(
    icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
    onPressed: () => close(context, null));
}
```

### buildResults方法重写

* buildResults方法，是搜到到内容后的展现，因为我们的数据都是模拟的，所以我这里就使用最简单的Container+Card组件进行演示了

```dart
@override
Widget buildResults(BuildContext context) {
return Container(
    width: 100.0,
    height: 100.0,
    child: Card(
    color: Colors.redAccent,
    child: Center(
        child: Text(query),
    ),
    ),
);
}
```

### buildSuggestions方法重写

* 这个方法主要的作用就是设置推荐，就是我们输入一个字，然后自动为我们推送相关的搜索结果，这样的体验是非常好的

```dart
 @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
              title: RichText(
                  text: TextSpan(
                      text: suggestionList[index].substring(0, query.length),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                        text: suggestionList[index].substring(query.length),
                        style: TextStyle(color: Colors.grey))
                  ])),
            ));
  }
}
```

* 为了方便小伙伴们学习，给出所有search_bar_demo.dart文件的代码

```dart
import 'package:flutter/material.dart';
import 'asset.dart';

class SearchBarDemo extends StatefulWidget {
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('SearchBarDemo'),
        actions:<Widget>[
          IconButton(
            icon:Icon(Icons.search),
            onPressed: (){
               showSearch(context:context,delegate: searchBarDelegate());
            }
            // showSearch(context:context,delegate: searchBarDelegate()),
          ),
        ]
      )
    );
  }
}

class searchBarDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(
        icon:Icon(Icons.clear),
        onPressed: ()=>query = "",)
      ];
  }
  
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
              title: RichText(
                  text: TextSpan(
                      text: suggestionList[index].substring(0, query.length),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                        text: suggestionList[index].substring(query.length),
                        style: TextStyle(color: Colors.grey))
                  ])),
            ));
  }
}
```