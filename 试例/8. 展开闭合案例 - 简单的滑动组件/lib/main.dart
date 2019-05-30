import 'package:flutter/material.dart';
import 'ExpansionTileDemo.dart';
import 'ExpansionPanelList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      theme: ThemeData.dark(),
      // home: ExpansionTileDemo(),
      home: ExpansionPanelListDemo(),
    );
  }
}