import 'package:flutter/material.dart';
import 'frosted_glass_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo of JunWang',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:Scaffold(
        body: FrostedClassDemo(),
      ),
    );
  }
}