import 'package:flutter/material.dart';

import 'asset.dart';

class SearchBarDemo extends StatefulWidget {
  @override
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SearchBarDemo',
        ),
        // 右边图标
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // 显示搜索代理
              showSearch(context: context, delegate: SearchBarDelegate());
            },
          ),
        ],
      ),
    );
  }
}

// 自定义搜索代理类, query 为搜索框内输入的文字
class SearchBarDelegate extends SearchDelegate<String> {
  @override
  // 搜索框　右侧按钮
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          // 清空搜索框内容
          query = '';
        },
      ),
    ];
  }

  @override
  // 搜索框 左侧按钮
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        // 退出搜索框
        close(context, null);
      },
    );
  }

  @override
  // 搜索框 点击完成返回的组件
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Card(
        color: Colors.white,
        child: Text(query),
      ),
    );
  }

  @override
  // 搜索框 输入文字后提示组件
  Widget buildSuggestions(BuildContext context) {
    // 定义数组
    final suggestionList = query.isEmpty
    ? recentSuggest 
    : searchList.where((input) => input.startsWith(query)).toList();
      
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        title: RichText(
          text: TextSpan(
            // 字符串截取与输入字符串匹配的字符串
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                // 字符串截取与输入字符串不匹配的字符串
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
